// Enum for payment status
import 'package:flutter/material.dart';

enum PaymentStatus {
  paid,
  notPaid,
  partPaid,
}

// Class to hold status data (text and colors)
class PaymentStatusData {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  PaymentStatusData({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
}

// Map to store PaymentStatusData for each status
final Map<PaymentStatus, PaymentStatusData> paymentStatusMap = {
  PaymentStatus.paid: PaymentStatusData(
    text: 'PAID',
    backgroundColor: Colors.green.shade50,
    textColor: Colors.green.shade800,
  ),
  PaymentStatus.notPaid: PaymentStatusData(
    text: 'NOT PAID',
    backgroundColor: Colors.red.shade50,
    textColor: Colors.red.shade800,
  ),
  PaymentStatus.partPaid: PaymentStatusData(
    text: 'PART PAID',
    backgroundColor: Colors.orange.shade50,
    textColor: Colors.orange.shade800,
  ),
};
