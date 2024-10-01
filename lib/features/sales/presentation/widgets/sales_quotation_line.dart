import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/product_search.dart';

class SalesQuotationLineWidget extends ConsumerStatefulWidget {
  final int index;
  final FocusNode productNameFocusNode;
  final Function(int) onTabOut;
  SalesQuotationLineWidget(
      {required this.index,
      required this.onTabOut,
      required this.productNameFocusNode});

  @override
  SalesQuotationLineWidgetState createState() =>
      SalesQuotationLineWidgetState();
}

class SalesQuotationLineWidgetState
    extends ConsumerState<SalesQuotationLineWidget> {
  late TextEditingController quantiyController = TextEditingController();
  late TextEditingController unitPriceController = TextEditingController();

  void _handleProductSelection(Product product) {
    final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

    final SalesQuotationLine newLine = SalesQuotationLine(
      productId: product.id!,
      productName: product.name,
      quantity: 1,
      unitPrice: double.parse(
        product.listPrice.toString(),
      ),
      discount: 0,
    );

    salesQuotationNotifier.updateLine(newLine, widget.index);
  }

  void _handleQuantityChange(double quantity, SalesQuotationLine line) {
    final updatedLine = line.copyWith(quantity: quantity);
    ref
        .read(salesQuotationProvider.notifier)
        .updateLine(updatedLine, widget.index);
  }

  void _handleUnitPriceChange(double unitPrice, SalesQuotationLine line) {
    final updatedLine = line.copyWith(unitPrice: unitPrice);
    ref
        .read(salesQuotationProvider.notifier)
        .updateLine(updatedLine, widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final line = ref.watch(salesQuotationProvider.select(
      (quotation) => quotation.quotationLines[widget.index],
    ));

    // final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);
    // List<Product> filteredProducts = ref.read(productStateNotifierProvider);
    final quotationLine = ref.watch(
      salesQuotationProvider
          .select((quotation) => quotation.quotationLines[widget.index]),
    );

    quantiyController.text = quotationLine.quantity.toString();
    unitPriceController.text = quotationLine.unitPrice.toString();
    // final List<Product> matchingProducts = filteredProducts
    //     .where((product) => product.id == line.productId)
    //     .toList(); // Filter products by productId
    // final product = matchingProducts.isNotEmpty
    //     ? matchingProducts[0] // Return the first matching product if found
    //     : null; // Return null if no match is found
    // // print(_filteredProducts);
    return Row(
      children: [
        const SizedBox(
          width: 40, // Fixed width for the number column
          child: Text('99'),
        ),
        Expanded(
          flex: 2,
          child: ProductSearchField(
            onProductSelected: _handleProductSelection,
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
            controller: quantiyController,
            onChanged: (value) {},
            onEditingComplete: () {
              final quantity = double.tryParse(quantiyController.text) ?? 1;
              _handleQuantityChange(quantity, line);
            },
          ),
        ),
        Spacer(),
        // Unit Price Column
        SizedBox(
          width: 80,
          child: Focus(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Unit Price',
              ),
              controller: unitPriceController,
              onChanged: (value) {
                // final unitPrice = double.tryParse(value) ?? 1;
                // _handleUnitPriceChange(unitPrice, line);
              },
              onSubmitted: (value) {
                widget.onTabOut(widget.index);
              },
            ),
            onFocusChange: (hasFocus) {
              final unitPrice = double.tryParse(unitPriceController.text) ?? 1;
              print('calling onsubmitted method');
              _handleUnitPriceChange(unitPrice, line);
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
