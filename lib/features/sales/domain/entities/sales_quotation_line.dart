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

  // [TODO] - creating an empty sale quotation line now, need to think more on it? should I make the field no required.
  factory SalesQuotationLine.empty() {
    return SalesQuotationLine(
        productId: '000',
        productName: 'select product',
        quantity: 0,
        price: 0,
        discount: 0,
        totalPrice: 0);
  }
}
