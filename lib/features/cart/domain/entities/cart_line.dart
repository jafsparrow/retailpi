import 'package:retailpi/features/cart/domain/entities/cart_item.dart';

class CartLine {
  final String id;
  final double discountValue;
  final bool isDiscountInPercentage;
  List<CartItem> cartItems;
  int selectedCartItemIndex;

  CartLine({
    required this.id,
    required this.discountValue,
    required this.isDiscountInPercentage,
    this.cartItems = const [],
    this.selectedCartItemIndex = 0,
  });

  CartLine copyWith({
    double? discountValue,
    bool? isDiscountInPercentage,
    List<CartItem>? cartItems,
    int? selectedCartItemIndex,
  }) {
    return CartLine(
      id: id,
      discountValue: discountValue ?? this.discountValue,
      isDiscountInPercentage:
          isDiscountInPercentage ?? this.isDiscountInPercentage,
      cartItems: cartItems ?? this.cartItems,
      selectedCartItemIndex:
          selectedCartItemIndex ?? this.selectedCartItemIndex,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'discountValue': discountValue,
        'isDiscountInPercentage': isDiscountInPercentage,
        'cartItems': cartItems.map(
          (item) => item.toJson(),
        ),
        'selectedCartItemIndex': selectedCartItemIndex,
      };

  factory CartLine.fromJson(Map<String, dynamic> json) {
    return CartLine(
      id: json['id'],
      discountValue: json['discountValue'],
      isDiscountInPercentage: json['isDiscountPercentage'],
      cartItems: List<CartItem>.from(
        json['cartItems'],
      ),
    );
  }
}
