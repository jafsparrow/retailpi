// domain/entities/sales_quotation_line.dart
class SalesQuotationLine {
  final String productId;
  final String productName;
  final double quantity;
  final double unitPrice;
  final double discount;
  final double totalPrice;

  SalesQuotationLine({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
    required this.totalPrice,
  });

  // Calculate total price considering the discount
  double calculateTotalPrice() {
    final discountedPrice = unitPrice - (unitPrice * discount / 100);
    return discountedPrice * quantity;
  }

  SalesQuotationLine copyWith({
    double? quantity,
    double? unitPrice,
    double? totalPrice,
  }) {
    return SalesQuotationLine(
      productId: productId,
      productName: productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      discount: discount,
    );
  }

  // [TODO] - creating an empty sale quotation line now, need to think more on it? should I make the field no required.
  factory SalesQuotationLine.empty() {
    return SalesQuotationLine(
        productId: '000',
        productName: 'select product',
        quantity: 0,
        unitPrice: 0,
        discount: 0,
        totalPrice: 0);
  }
}
