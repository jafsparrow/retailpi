import 'package:retailpi/features/cart/domain/entities/cart.dart';

class CartState {
  List<Cart> carts;
  String? activeCartId;
  String? error;

  CartState({this.carts = const [], this.activeCartId});

  CartState copyWith({
    List<Cart>? carts,
    String? activeCartId,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      activeCartId: activeCartId ?? this.activeCartId,
    );
  }

  Map<String, dynamic> toJson() => {
        'carts': carts.map((cart) => cart.toJson()).toList(),
        'activeCartId': activeCartId,
      };

  factory CartState.fromJson(Map<String, dynamic> json) {
    return CartState(
      carts:
          (json['carts'] as List).map((cart) => Cart.fromJson(cart)).toList(),
      activeCartId: json['activeCartId'],
    );
  }
}
