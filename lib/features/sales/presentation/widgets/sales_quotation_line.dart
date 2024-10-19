import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/product_search.dart';

class SalesQuotationLineWidget extends ConsumerStatefulWidget {
  final int index;
  final FocusNode productNameFocusNode;
  final Function(int) onTabOut;
  const SalesQuotationLineWidget(
      {super.key,
      required this.index,
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
    final quotationLine = ref.read(
      salesQuotationProvider
          .select((quotation) => quotation.quotationLines[widget.index]),
    );

    quantiyController.text = quotationLine.quantity.toString();
    unitPriceController.text = quotationLine.unitPrice.toString();

    return Row(
      children: [
        SizedBox(
          width: 40, // Fixed width for the number column
          child: Text((widget.index + 1).toString()),
        ),
        Expanded(
          flex: 2,
          child: ProductSearchField(
            onProductSelected: _handleProductSelection,
            productNameFocusNode: widget.productNameFocusNode,
            index: widget.index,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        // Quantity Input
        SizedBox(
          width: 80,
          child: Focus(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]+[,.]{0,1}[0-9]*'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
              controller: quantiyController,
              onChanged: (value) {},
              onEditingComplete: () {},
            ),
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                final quantity = double.tryParse(quantiyController.text) ?? 1;
                _handleQuantityChange(quantity, quotationLine);
              }
            },
          ),
        ),
        const Spacer(),
        // Unit Price Column
        SizedBox(
          width: 80,
          child: Focus(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]+[,.]{0,1}[0-9]*'),
                ),
              ],
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

              if (!hasFocus) {
                unitPriceController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: unitPriceController.text.length);
                _handleUnitPriceChange(unitPrice, quotationLine);
              }
            },
          ),
        ),
        const Spacer(),
        // Total Column
        const SizedBox(
          width: 80, // Fixed width for the total column
          child: Text('5%'),
        ),
        const Spacer(),
        // Total Column
        const SizedBox(
          width: 80, // Fixed width for the total column
          child: Text('\$60.00'),
        ),
        const Spacer(),
        // Icon Column (fixed width for an icon button)
        SizedBox(
          width: 40,
          child: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(salesQuotationProvider.notifier)
                  .removeLine(widget.index);
            },
          ),
        ),
      ],
    );
  }

  //  String _getRegexString() =>
  //     allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
