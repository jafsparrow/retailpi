// This file performs setup of the PowerSync database
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';
import 'package:retailpi/core/powesync/migrations/fts_setup.dart';
import 'package:retailpi/core/powesync/schema.dart';
import 'package:retailpi/core/utils/app_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final log = Logger('powersync-supabase');

/// Postgres Response codes that we cannot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  // Class 22 — Data Exception
  // Examples include data type mismatch.
  RegExp(r'^22...$'),
  // Class 23 — Integrity Constraint Violation.
  // Examples include NOT NULL, FOREIGN KEY and UNIQUE violations.
  RegExp(r'^23...$'),
  // INSUFFICIENT PRIVILEGE - typically a row-level security violation
  RegExp(r'^42501$'),
];

// test backend connector
class TestBackendConnector extends PowerSyncBackendConnector {
  @override
  Future<PowerSyncCredentials?> fetchCredentials() {
    return Future.value(PowerSyncCredentials(
        endpoint: AppConfig.powersyncUrl,
        token:
            'eyJhbGciOiJSUzI1NiIsImtpZCI6InBvd2Vyc3luYy1kZXYtMzIyM2Q0ZTMifQ.eyJzdWIiOiI0ZjdjOWMxMi0yODQwLTQyMmItYTAyZC0wNTlhNjM1NTkwODMiLCJpYXQiOjE3NDI3MTEzNTYsImlzcyI6Imh0dHBzOi8vcG93ZXJzeW5jLWFwaS5qb3VybmV5YXBwcy5jb20iLCJhdWQiOiJodHRwczovLzY3ZGQ5OTc1MTkwNzkyNjVhYzVmYzU5Ni5wb3dlcnN5bmMuam91cm5leWFwcHMuY29tIiwiZXhwIjoxNzQyNzU0NTU2fQ.MYIUTe4LStki7vVV2jvnEYY_48-ZS2Kl2FW--l8IGWv8segXpQtmpu_1XfV3d289qzT0ljghV-Aq1P_Bw7XQIJnJGSewNa_J1b6WIbs0c8n8z3WP10H1D5zz0q6EjsMjCkIq_BFHa_imH2sf9EJAQ9Grbk_NTCtltP7QfL1NWj2LOqfTtoA6HalT9dGcC0m_b3_RMWERJHhTCirk-v5FQOmAcii5wgy4F1nOOITkQ4EYCYxXDB3pc5SNbbAqYa-Irg_wcA0ECzIMaehRFmiRh_T-O4HlwkrLZzqQ7x5GM9blFSytRZICRXjGbQT9iqAmd67jPFLwb0tp94QU9CNyhw',
        userId: '173373fe-56d3-44ef-b46f-73a99e8b8b32',
        expiresAt: DateTime.now().add(Duration(days: 1))));
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) {
    // TODO: implement uploadData
    throw UnimplementedError();
  }
}

/// Use Supabase for authentication and data upload.
class SupabaseConnector extends PowerSyncBackendConnector {
  Future<void>? _refreshFuture;

  SupabaseConnector();

  /// Get a Supabase token to authenticate against the PowerSync instance.
  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    // Wait for pending session refresh if any
    await _refreshFuture;

    // Use Supabase token for PowerSync
    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      // Not logged in
      return null;
    }

    // Use the access token to authenticate against PowerSync
    final token = session.accessToken;

    // userId and expiresAt are for debugging purposes only
    final userId = session.user.id;
    final expiresAt = session.expiresAt == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000);
    return PowerSyncCredentials(
        endpoint: AppConfig.powersyncUrl,
        token: token,
        userId: userId,
        expiresAt: expiresAt);
  }

  @override
  void invalidateCredentials() {
    // Trigger a session refresh if auth fails on PowerSync.
    // Generally, sessions should be refreshed automatically by Supabase.
    // However, in some cases it can be a while before the session refresh is
    // retried. We attempt to trigger the refresh as soon as we get an auth
    // failure on PowerSync.
    //
    // This could happen if the device was offline for a while and the session
    // expired, and nothing else attempt to use the session it in the meantime.
    //
    // Timeout the refresh call to avoid waiting for long retries,
    // and ignore any errors. Errors will surface as expired tokens.
    _refreshFuture = Supabase.instance.client.auth
        .refreshSession()
        .timeout(const Duration(seconds: 5))
        .then((response) => null, onError: (error) => null);
  }

  // Upload pending changes to Supabase.
  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    // This function is called whenever there is data to upload, whether the
    // device is online or offline.
    // If this call throws an error, it is retried periodically.
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) {
      return;
    }

    final rest = Supabase.instance.client.rest;
    CrudEntry? lastOp;
    try {
      // Note: If transactional consistency is important, use database functions
      // or edge functions to process the entire transaction in a single call.
      for (var op in transaction.crud) {
        lastOp = op;

        final table = rest.from(op.table);
        if (op.op == UpdateType.put) {
          var data = Map<String, dynamic>.of(op.opData!);
          data['id'] = op.id;
          await table.upsert(data);
        } else if (op.op == UpdateType.patch) {
          await table.update(op.opData!).eq('id', op.id);
        } else if (op.op == UpdateType.delete) {
          await table.delete().eq('id', op.id);
        }
      }

      // All operations successful.
      await transaction.complete();
    } on PostgrestException catch (e) {
      if (e.code != null &&
          fatalResponseCodes.any((re) => re.hasMatch(e.code!))) {
        /// Instead of blocking the queue with these errors,
        /// discard the (rest of the) transaction.
        ///
        /// Note that these errors typically indicate a bug in the application.
        /// If protecting against data loss is important, save the failing records
        /// elsewhere instead of discarding, and/or notify the user.
        log.severe('Data upload error - discarding $lastOp', e);
        await transaction.complete();
      } else {
        // Error may be retryable - e.g. network error or temporary server error.
        // Throwing an error here causes this call to be retried after a delay.
        rethrow;
      }
    }
  }
}

/// Global reference to the database
late final PowerSyncDatabase db;

bool isLoggedIn() {
  return true;
  // return Supabase.instance.client.auth.currentSession?.accessToken != null;
}

/// id of the user currently logged in
String? getUserId() {
  return uuid.v4();
  // return Supabase.instance.client.auth.currentSession?.user.id;
}

Future<String> getDatabasePath() async {
  const dbFilename = 'powersync-demo.db';
  // getApplicationSupportDirectory is not supported on Web
  if (kIsWeb) {
    return dbFilename;
  }
  final dir = await getApplicationSupportDirectory();
  return join(dir.path, dbFilename);
}

Future<void> openDatabase() async {
  // Open the local database
  db = PowerSyncDatabase(
      schema: schema, path: await getDatabasePath(), logger: attachedLogger);
  await db.initialize();

  // await loadSupabase();

  SupabaseConnector? currentConnector;

  db.connect(connector: TestBackendConnector());

  // if (isLoggedIn()) {
  //   // If the user is already logged in, connect immediately.
  //   // Otherwise, connect once logged in.
  //   currentConnector = SupabaseConnector();
  //   db.connect(connector: currentConnector);
  // }

  // Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
  //   final AuthChangeEvent event = data.event;
  //   if (event == AuthChangeEvent.signedIn) {
  //     // Connect to PowerSync when the user is signed in
  //     currentConnector = SupabaseConnector();
  //     db.connect(connector: currentConnector!);
  //   } else if (event == AuthChangeEvent.signedOut) {
  //     // Implicit sign out - disconnect, but don't delete data
  //     currentConnector = null;
  //     await db.disconnect();
  //   } else if (event == AuthChangeEvent.tokenRefreshed) {
  //     // Supabase token refreshed - trigger token refresh for PowerSync.
  //     currentConnector?.prefetchCredentials();
  //   }
  // });

  // Demo using SQLite Full-Text Search with PowerSync.
  // See https://docs.powersync.com/usage-examples/full-text-search for more details
  await configureFts(db);
}

/// Explicit sign out - clear database and log out.
Future<void> logout() async {
  await Supabase.instance.client.auth.signOut();
  await db.disconnectAndClear();
}
