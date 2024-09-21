import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';

class SalesQuotationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productStateNotifierProvider);

    if (products.isEmpty) {
      // Display loading indicator while products are being fetched
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text('Sales Quotation')),
        body: Container() /* Rest of the UI */
        );
  }
}
