import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/features/products/presentation/pages/product_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_upload.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/core/utils/excel_upload.dart';
import 'package:retailpi/features/category/presentation/pages/category_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductScreen()); //UploadProductsPage()); // ProductScreen());
  }
}
