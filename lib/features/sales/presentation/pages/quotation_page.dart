import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/providers/sales_quotation_provider.dart';

class SalesQuotationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesQuotation = ref.watch(salesQuotationProvider);
    final productList = ref.watch(productStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Quotation'),
      ),
      body: Column(
        children: [
          Text(salesQuotation.quotationNumber.toString()),
          Text(salesQuotation.quotationLines.length.toString()),
          Expanded(
            child: ListView.builder(
              itemCount: salesQuotation.quotationLines.length,
              itemBuilder: (context, index) {
                final line = salesQuotation.quotationLines[index];
                print(line);
                // return Text('hello work');
                print(line.productName);
                return SalesQuotationLineWidget(
                  index: index,
                  line: line,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(salesQuotationProvider.notifier).addLineToQuotation(
                    SalesQuotationLine(
                        discount: 1,
                        price: 3,
                        productId: 'kdf',
                        productName: 'hello product',
                        quantity: 3,
                        totalPrice: 33),
                  );
            },
            child: Text('Add Line'),
          ),
        ],
      ),
    );
  }
}

class SalesQuotationLineWidget extends ConsumerStatefulWidget {
  final int index;
  final SalesQuotationLine line;

  SalesQuotationLineWidget({required this.index, required this.line});

  @override
  _SalesQuotationLineWidgetState createState() =>
      _SalesQuotationLineWidgetState();
}

class _SalesQuotationLineWidgetState
    extends ConsumerState<SalesQuotationLineWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _searchController.addListener(() {
    //   _filterProducts(_searchController.text);
    // });
  }

  void _filterProducts(String query) {
    ref.read(productStateNotifierProvider.notifier).searchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    // final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);
    List<Product> _filteredProducts = ref.read(productStateNotifierProvider);
    final List<Product> matchingProducts = _filteredProducts
        .where((product) => product.id == widget.line.productId)
        .toList(); // Filter products by productId
    final product = matchingProducts.isNotEmpty
        ? matchingProducts[0] // Return the first matching product if found
        : null; // Return null if no match is found
    // print(_filteredProducts);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Product Search Field
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search Product',
              suffixIcon: Icon(Icons.search),
            ),
          ),

          // Dropdown to select product from filtered list
          DropdownButton<Product>(
            isExpanded: true,
            hint: Text('Select Product'),
            value: product,
            items: _filteredProducts.map((product) {
              return DropdownMenuItem<Product>(
                value: product,
                child: Text(product.name),
              );
            }).toList(),
            onChanged: (Product? selectedProduct) {
              // if (selectedProduct != null) {
              //   salesQuotationNotifier.updateLine(
              //     widget.index,
              //     SalesQuotationLine(
              //       productId: selectedProduct.id,
              //       productName: selectedProduct.name,
              //       price: selectedProduct.price,
              //       quantity: widget.line.quantity,
              //     ),
              //   );
              // }
            },
          ),

          // Quantity Input
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Quantity',
            ),
            onChanged: (value) {
              //   final quantity = double.tryParse(value) ?? 1;
              //   salesQuotationNotifier.updateLine(
              //     widget.index,
              //     SalesQuotationLine(
              //       productId: widget.line.productId,
              //       productName: widget.line.productName,
              //       price: widget.line.price,
              //       quantity: quantity,
              //     ),
              //   );
            },
          ),
        ],
      ),
    );
  }
}
