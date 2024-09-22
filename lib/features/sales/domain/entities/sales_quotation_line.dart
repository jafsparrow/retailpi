// domain/entities/sales_quotation_line.dart
class SalesQuotationLine {
  final String productId;
  final String productName;
  final double quantity;
  final double price;
  final double discount;
  final double totalPrice;

  SalesQuotationLine({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.totalPrice,
  });

  // Calculate total price considering the discount
  double calculateTotalPrice() {
    final discountedPrice = price - (price * discount / 100);
    return discountedPrice * quantity;
  }
}

// // SalesQuotationLine class with discount feature
// class SalesQuotationLine {
//   String? productId;
//   String? productName;
//   double quantity;
//   double price;
//   double totalPrice;
//   double discount; // new field for discounts

//   SalesQuotationLine({
//     this.productId,
//     this.productName,
//     this.quantity = 1,
//     this.price = 0.0,
//     this.totalPrice = 0.0,
//     this.discount = 0.0, // default discount is 0%
//   });

//   // Calculate total price considering the discount
//   void calculateTotalPrice() {
//     final discountedPrice =
//         price - (price * discount / 100); // percentage discount
//     totalPrice = discountedPrice * quantity;
//   }
// }
