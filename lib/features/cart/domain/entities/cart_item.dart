// domain/entities/sales_quotation_line.dart
class CartItem {
  final String id;
  final String name;
  final double quantity;
  final double unitPrice;
  final double discount;
  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
  });

  // Getter to calculate totalPrice dynamically
  double get totalPrice => (quantity * unitPrice) - discount;

  // Calculate total price considering the discount
  double calculateTotalPrice() {
    final discountedPrice = unitPrice - (unitPrice * discount / 100);
    return discountedPrice * quantity;
  }

  CartItem copyWith({
    double? quantity,
    double? unitPrice,
    double? totalPrice,
    double? discount,
    CartItem? alternateItem,
    int? colorIndex,
  }) {
    return CartItem(
      id: id,
      name: name,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      // totalPrice: totalPrice ?? this.totalPrice,
      discount: discount ?? this.discount,
    );
  }

  // [TODO] - creating an empty sale quotation line now, need to think more on it? should I make the field no required.
  factory CartItem.empty() {
    return CartItem(
      id: '0000-0000',
      name: 'select product',
      quantity: 0,
      unitPrice: 0,
      discount: 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'dicount': discount
      };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      discount: json['discount'],
    );
  }
}
