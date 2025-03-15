import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/home/presentation/pages/home_page.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/pages/product_add.dart';
import 'package:retailpi/features/products/presentation/pages/product_details_page.dart';

import 'package:go_router/go_router.dart';
import 'package:retailpi/features/products/presentation/widgets/product_form.dart';
import 'package:retailpi/features/sales/presentation/pages/pos_page.dart';
import 'package:retailpi/features/sales/presentation/pages/quotation_mob_page.dart';
import 'package:retailpi/theme/light_mode.dart';

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
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => PosPage(), // PosScreen(),
      ),
      GoRoute(
        path: '/product-detail',
        builder: (context, state) {
          final product = state.extra as Product;

          return ProductDetailsPage(product: product);
        },
      ),
      GoRoute(
        path: '/product-edit',
        builder: (context, state) {
          final product = state.extra as Product;

          return AddEditProductForm(product: product);
        },
      ),
      GoRoute(
        path: '/sales-invoices',
        builder: (context, state) => SalesQuotationMobileScreen(),
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
      theme: lightMode,
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
