import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/utils/constants.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/sales_quotation_line.dart';

class SalesQuotationScreen extends ConsumerStatefulWidget {
  const SalesQuotationScreen({super.key});

  @override
  _QuotationScreenState createState() => _QuotationScreenState();
}

class _QuotationScreenState extends ConsumerState<SalesQuotationScreen> {
  final List<FocusNode> _productNameFocusNodes = [];

  @override
  void initState() {
    // TODO: implement initState
    final exisitngQuotationLines =
        ref.read(salesQuotationProvider).quotationLines;
    if (exisitngQuotationLines.isNotEmpty) {
      for (var item in exisitngQuotationLines) {
        _productNameFocusNodes.add(FocusNode());
      }
    }
    super.initState();
  }

  // Method to handle adding new line
  void _addLine() {
    final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

    _productNameFocusNodes.add(FocusNode());

    salesQuotationNotifier.addLineToQuotation();

    // Request focus for the last added line (productName TextField)
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_productNameFocusNodes.isNotEmpty) {
        FocusScope.of(context).requestFocus(_productNameFocusNodes.last);
      }
    });
  }

  // Method to handle tabbing out or pressing enter
  void _handleFieldExit(int index) {
    final salesQuotation = ref.read(salesQuotationProvider);
    print('has this been called');
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
        title: Text(
          salesQuotation.quotationNumber.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value),
                      ),
                    ),
                  },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      value: 'helloovalue',
                      child: Text('hello'),
                    ),
                    const PopupMenuItem(value: 'second', child: Text('better')),
                    const PopupMenuItem(value: 'third', child: Text('stuff')),
                  ]),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppConst.kBodyPadding, right: AppConst.kBodyPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildQuotationCustomerInfo(salesQuotation),
              ),
            ),
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
                    final line =
                        ref.watch(salesQuotationProvider).quotationLines[index];
                    // print('*********checking at quotation page.*****');

                    // print(line.productName);
                    // print(line.unitPrice);
                    // print('*********checking at quotation page.*****');
                    return SalesQuotationLineWidget(
                      index: index,
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
      ),
    );
  }

  Widget buildQuotationCustomerInfo(SalesQuotation salesQuotation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1, // Allocates the other half to this section
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(12, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.00),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow),
                          onPressed: () {
                            // Add your button logic here
                          },
                          child: Text('Button ${index + 1}'),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(child: customerSubsection()),
            SizedBox(
              width: 10,
            ),
            Expanded(child: customerSubsection()),
          ],
        ),
      ],
    );
  }

  Widget customerSubsection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jafar',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 18,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 18,
                ))
          ],
        ),
        Text('Address Line 1 , Line 2'),
        Text('9338393')
      ],
    );
  }
}
