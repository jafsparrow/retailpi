import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';

// domain/entities/sales_quotation.dart
class SalesQuotation {
  final String quotationNumber;
  final DateTime quotationDate;
  final String createdByUserId;
  final String customerId;
  final List<SalesQuotationLine> quotationLines;
  final double totalAmount;

  SalesQuotation({
    required this.quotationNumber,
    required this.quotationDate,
    required this.createdByUserId,
    required this.customerId,
    required this.quotationLines,
    required this.totalAmount,
  });

  // Calculate the total quotation amount
  double calculateTotalAmount() {
    return quotationLines.fold(
      0.0,
      (sum, line) => sum + line.totalPrice,
    );
  }

  SalesQuotation copyWith({
    String? quotationNumber,
    DateTime? quotationDate,
    String? createdByUserId,
    String? customerId,
    List<SalesQuotationLine>? quotationLines,
    double? totalAmount,
  }) {
    return SalesQuotation(
      quotationNumber: quotationNumber ?? this.quotationNumber,
      quotationDate: quotationDate ?? this.quotationDate,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      customerId: customerId ?? this.customerId,
      quotationLines: quotationLines ?? this.quotationLines,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}


// class SalesQuotation {
//   late String quotationNumber;

//   late DateTime quotationDate;
//   late String createdByUserId;
//   late List<SalesQuotationLine> quotationLines;
//   late double totalAmount;

//   SalesQuotation({
//     required this.quotationNumber,
//     required this.quotationDate,
//     required this.createdByUserId,
//     required this.quotationLines,
//     required this.totalAmount,
//   });

//   SalesQuotation.empty() {
//     quotationNumber = generateQuotationNumber();
//     quotationDate = DateTime.now();
//     createdByUserId = "defaultUser"; // Should be assigned dynamically
//     quotationLines = [];
//     totalAmount = 0.0;
//   }

//   // Generate a quotation number based on date/time or other criteria
//   String generateQuotationNumber() {
//     return "QTN-${DateTime.now().millisecondsSinceEpoch}";
//   }

//   // Calculate the total quotation amount
//   void calculateTotalAmount() {
//     totalAmount = quotationLines.fold(
//       0.0,
//       (sum, line) => sum + line.totalPrice,
//     );
//   }

//   // Add a new line to the quotation
//   void addLine(SalesQuotationLine line) {
//     quotationLines.add(line);
//     calculateTotalAmount();
//   }

//   // Remove a line from the quotation
//   void removeLine(int index) {
//     if (index >= 0 && index < quotationLines.length) {
//       quotationLines.removeAt(index);
//       calculateTotalAmount();
//     }
//   }
// }
