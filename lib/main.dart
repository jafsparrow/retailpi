import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_add.dart';
import 'package:retailpi/features/products/presentation/pages/product_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_upload.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/core/utils/excel_upload.dart';
import 'package:retailpi/features/category/presentation/pages/category_page.dart';

import 'package:go_router/go_router.dart';
import 'package:retailpi/features/sales/presentation/pages/quotation_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => DashboardScreen(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => ProductScreen(),
      ),
      GoRoute(
        path: '/sales-invoices',
        builder: (context, state) => SalesQuotationScreen(),
      ),
      GoRoute(
        path: '/product-add',
        builder: (context, state) => const ProductAddPage(),
      ),
      // GoRoute(
      //   path: '/customers',
      //   builder: (context, state) => CustomerPage(),
      // ),
      // GoRoute(
      //   path: '/vendors',
      //   builder: (context, state) => VendorPage(),
      // ),
      // GoRoute(
      //   path: '/pos',
      //   builder: (context, state) => POSPage(),
      // ),
    ],
  );
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'My Flutter App',
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         useMaterial3: true,
  //       ),
  //       home: ProductScreen()); //UploadProductsPage()); // ProductScreen());
  // }
}
