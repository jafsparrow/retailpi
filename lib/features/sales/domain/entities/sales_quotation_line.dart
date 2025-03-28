// domain/entities/sales_quotation_line.dart
class SalesQuotationLine {
  final String productId;
  final String productName;
  final double quantity;
  final double unitPrice;
  final double discount;
  // final double totalPrice;
  List<SalesQuotationLine> alternatives; // Up to 4 alternatives.
  int selectedAlternativeIndex; // Tracks which alternative is selected (-1 if none)

  SalesQuotationLine({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
    // required this.totalPrice,
    this.alternatives = const [],
    this.selectedAlternativeIndex =
        -1, // -1 indicates no alternative is selected
  });

  // Getter to calculate totalPrice dynamically
  double get totalPrice => (quantity * unitPrice) - discount;

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
      // totalPrice: totalPrice ?? this.totalPrice,
      discount: discount,
    );
  }

  // [TODO] - creating an empty sale quotation line now, need to think more on it? should I make the field no required.
  factory SalesQuotationLine.empty() {
    return SalesQuotationLine(
      productId: '0000-0000',
      productName: 'select product',
      quantity: 0,
      unitPrice: 0,
      discount: 0,
    );
  }
}
