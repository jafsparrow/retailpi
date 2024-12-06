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
}
