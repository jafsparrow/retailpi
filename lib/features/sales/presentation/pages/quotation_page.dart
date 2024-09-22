// presentation/screens/sales_quotation_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/providers/sales_quotation_provider.dart';

class SalesQuotationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesQuotation = ref.watch(salesQuotationProvider);
    final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Quotation'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Quotation No: ${salesQuotation.quotationNumber}'),
            subtitle: Text('Date: ${salesQuotation.quotationDate}'),
            trailing: Text(
                'Total: \$${salesQuotation.totalAmount.toStringAsFixed(2)}'),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: salesQuotation.quotationLines.length,
              itemBuilder: (context, index) {
                final line = salesQuotation.quotationLines[index];
                return ListTile(
                  title: Text(line.productName),
                  subtitle: Text(
                      'Quantity: ${line.quantity}, Price: \$${line.price}'),
                  trailing:
                      Text('Total: \$${line.totalPrice.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add a new line to the quotation
              final newLine = SalesQuotationLine(
                productId: '123',
                productName: 'Sample Product',
                quantity: 1.0,
                price: 10.0,
                discount: 0.0,
                totalPrice: 10.0,
              );
              salesQuotationNotifier.addLineToQuotation(newLine);
            },
            child: Text('Add Line'),
          ),
        ],
      ),
    );
  }
}
