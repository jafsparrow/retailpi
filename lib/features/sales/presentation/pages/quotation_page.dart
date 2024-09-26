import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/sales_quotation_line.dart';

class SalesQuotationScreen extends ConsumerStatefulWidget {
  @override
  _QuotationScreenState createState() => _QuotationScreenState();
}

class _QuotationScreenState extends ConsumerState<SalesQuotationScreen> {
  List<FocusNode> _productNameFocusNodes = [];

  // Method to handle adding new line
  void _addLine() {
    final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

    salesQuotationNotifier.addLineToQuotation(SalesQuotationLine(
        productId: 'productId',
        productName: 'productName',
        quantity: 1,
        unitPrice: 1,
        discount: 1,
        totalPrice: 1));
    _productNameFocusNodes.add(FocusNode());

    // Request focus for the last added line (productName TextField)
    Future.delayed(Duration(milliseconds: 100), () {
      if (_productNameFocusNodes.isNotEmpty) {
        FocusScope.of(context).requestFocus(_productNameFocusNodes.last);
      }
    });
  }

  // Method to handle tabbing out or pressing enter
  void _handleFieldExit(int index) {
    final salesQuotation = ref.read(salesQuotationProvider);
    if (index == salesQuotation.quotationLines.length - 1) {
      // If we're on the last line, add a new line when user exits
      _addLine();
    }
  }

  @override
  Widget build(BuildContext context) {
    final salesQuotation = ref.watch(salesQuotationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Quotation'),
      ),
      body: Column(
        children: [
          Text(salesQuotation.quotationNumber.toString()),
          Text(salesQuotation.quotationLines.length.toString()),
          const Row(
            children: [
              SizedBox(
                width: 40, // Fixed width for the number column
                child: Text('SNo'),
              ),
              Text('Prodcut'),
              SizedBox(
                width: 30,
              ),

              // Unit Price Column
              Text('Qty'),
              Spacer(),
              // Unit Price Column
              Text('Unit price'),
              Spacer(),
              Text('Taxes'),
              Spacer(),
              Text('Total'),

              Spacer(),
              // Icon Column (fixed width for an icon button)
              Text('action'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: salesQuotation.quotationLines.length + 1,
              itemBuilder: (context, index) {
                if (index == salesQuotation.quotationLines.length) {
                  return TextButton(
                    onPressed: _addLine,
                    child: const Text('Add Line'),
                  );
                } else {
                  final line = salesQuotation.quotationLines[index];
                  return SalesQuotationLineWidget(
                    index: index,
                    line: line,
                    onTabOut: _handleFieldExit,
                    productNameFocusNode: _productNameFocusNodes[index],
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          'Total Items: ${salesQuotation.quotationLines.length}'),
                      Text(
                          'Total Amount: ${salesQuotation.totalAmount.toStringAsFixed(2)}'),
                      Text(
                          'Tax: ${salesQuotation.taxedTotal.toStringAsFixed(2)}'),
                      Text(
                          'Total (Taxed): ${salesQuotation.totalAmount.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                Text(
                  'Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('Total Items: 300'),
                // Add any additional summary details here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
