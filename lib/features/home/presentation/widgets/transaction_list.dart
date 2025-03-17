import 'package:flutter/material.dart';
import 'package:retailpi/core/models/payment_related.dart';
import 'package:retailpi/core/widgets/payment_status_badge.dart';

class TransactionsList extends StatelessWidget {
  final String type;

  TransactionsList({required this.type});

  final List<Map<String, dynamic>> sampleData = [
    {
      'number': '#1001',
      'customer': 'John Doe',
      'total': '\$150.00',
      'paid': true,
      'time': '2 hours ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: sampleData.length,
      itemBuilder: (context, index) {
        final item = sampleData[index];
        return ListTile(
            minVerticalPadding: 16,
            title: Text(
              '${item['number']} - ${item['customer']}',
            ),
            subtitle: Text('${item['total']} - ${item['time']}'),
            trailing: PaymentStatusBadge(status: PaymentStatus.partPaid)
            // Text(
            //   item['paid'] ? 'Paid' : 'Unpaid',
            //   style: TextStyle(
            //     color: item['paid'] ? Colors.green : Colors.red,
            //     backgroundColor: Colors.green,
            //   ),
            // ),
            );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
