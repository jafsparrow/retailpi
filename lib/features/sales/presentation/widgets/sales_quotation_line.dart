import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/widgets/product_search.dart';

class SalesQuotationLineWidget extends ConsumerStatefulWidget {
  final int index;
  final SalesQuotationLine line;
  final FocusNode productNameFocusNode;
  final Function(int) onTabOut;
  SalesQuotationLineWidget(
      {required this.index,
      required this.line,
      required this.onTabOut,
      required this.productNameFocusNode});

  @override
  SalesQuotationLineWidgetState createState() =>
      SalesQuotationLineWidgetState();
}

class SalesQuotationLineWidgetState
    extends ConsumerState<SalesQuotationLineWidget> {
  @override
  void initState() {
    super.initState();
    // _searchController.addListener(() {
    //   _filterProducts(_searchController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);
    List<Product> filteredProducts = ref.read(productStateNotifierProvider);
    final List<Product> matchingProducts = filteredProducts
        .where((product) => product.id == widget.line.productId)
        .toList(); // Filter products by productId
    final product = matchingProducts.isNotEmpty
        ? matchingProducts[0] // Return the first matching product if found
        : null; // Return null if no match is found
    // print(_filteredProducts);
    return Row(
      children: [
        const SizedBox(
          width: 40, // Fixed width for the number column
          child: Text('99'),
        ),
        Expanded(
          flex: 2,
          child: ProductSearchField(
            onProductSelected: (product) {},
            productNameFocusNode: widget.productNameFocusNode,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        // Quantity Input
        SizedBox(
          width: 80,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
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
        ),
        Spacer(),
        // Unit Price Column
        SizedBox(
          width: 80,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Unit Price',
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
            onEditingComplete: () {
              widget.onTabOut(widget.index);
            },
          ),
        ),
        Spacer(),
        // Total Column
        const SizedBox(
          width: 80, // Fixed width for the total column
          child: Text('5%'),
        ),
        Spacer(),
        // Total Column
        const SizedBox(
          width: 80, // Fixed width for the total column
          child: Text('\$60.00'),
        ),
        Spacer(),
        // Icon Column (fixed width for an icon button)
        const SizedBox(
          width: 40,
          child: Icon(Icons.delete),
        ),
      ],
    );
  }
}
