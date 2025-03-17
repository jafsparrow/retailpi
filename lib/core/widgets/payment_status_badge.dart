import 'package:flutter/material.dart';
import 'package:retailpi/core/models/payment_related.dart';

class PaymentStatusBadge extends StatelessWidget {
  final PaymentStatus status;

  const PaymentStatusBadge({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the PaymentStatusData for the current status
    final statusData = paymentStatusMap[status]!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusData.backgroundColor,
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Text(
        statusData.text,
        style: TextStyle(
          color: statusData.textColor,
          // fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
