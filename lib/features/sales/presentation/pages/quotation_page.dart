import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/sales_quotation_line.dart';

class SalesQuotationScreen extends ConsumerWidget {
  const SalesQuotationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesQuotation = ref.watch(salesQuotationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Quotation'),
      ),
      body: Column(
        children: [
          Text(salesQuotation.quotationNumber.toString()),
          Text(salesQuotation.quotationLines.length.toString()),
          Row(
            children: [
              const SizedBox(
                width: 40, // Fixed width for the number column
                child: Text('SNo'),
              ),
              const Text('Prodcut'),
              SizedBox(
                width: 30,
              ),

              // Unit Price Column
              const Text('Qty'),
              Spacer(),
              // Unit Price Column
              const Text('Unit price'),
              Spacer(),
              const Text('Taxes'),
              Spacer(),
              const Text('Total'),

              Spacer(),
              // Icon Column (fixed width for an icon button)
              const Text('action'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: salesQuotation.quotationLines.length + 1,
              itemBuilder: (context, index) {
                if (index == salesQuotation.quotationLines.length) {
                  return TextButton(
                    onPressed: () {
                      ref
                          .read(salesQuotationProvider.notifier)
                          .addLineToQuotation(
                            SalesQuotationLine.empty(),
                          );
                    },
                    child: const Text('Add Line'),
                  );
                }

                final line = salesQuotation.quotationLines[index];
                return SalesQuotationLineWidget(
                  index: index,
                  line: line,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
