import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductListMode { normal, alternative }

class ProductListCartMode {
  final ProductListMode mode;
  final String? cartId;
  final String? cartItemId;

  ProductListCartMode({
    required this.mode,
    this.cartId,
    this.cartItemId,
  });

  ProductListCartMode copyWith({
    ProductListMode? mode,
    String? cartId,
    String? cartItemId,
  }) {
    return ProductListCartMode(
      mode: mode ?? this.mode,
      cartId: cartId ?? this.cartId,
      cartItemId: cartItemId ?? this.cartItemId,
    );
  }
}

class ProductListModeNotifier extends StateNotifier<ProductListCartMode> {
  ProductListModeNotifier()
      : super(ProductListCartMode(mode: ProductListMode.normal));

  void setNormalMode() {
    state = ProductListCartMode(
        mode: ProductListMode.normal, cartId: null, cartItemId: null);
  }

  void setAlternativeMode(String cartId, String cartItemId) {
    state = ProductListCartMode(
      mode: ProductListMode.alternative,
      cartId: cartId,
      cartItemId: cartItemId,
    );
  }
}
