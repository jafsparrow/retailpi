import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/pricelists/models/pricelist.dart';

final realmProvider = Provider<Realm>((ref) {
  final config = Configuration.local(
      [Product.schema, Category.schema, PriceList.schema],
      schemaVersion: 7);
  final realm = Realm(config);
  return realm;
});
