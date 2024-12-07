import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductListMode { normal, alternative }

class ProductListCartMode {
  final ProductListMode mode;
  final String? cartId;
  final String? lineId;

  ProductListCartMode({
    required this.mode,
    this.cartId,
    this.lineId,
  });

  ProductListCartMode copyWith({
    ProductListMode? mode,
    String? cartId,
    String? lineId,
  }) {
    return ProductListCartMode(
      mode: mode ?? this.mode,
      cartId: cartId ?? this.cartId,
      lineId: lineId ?? this.lineId,
    );
  }
}

class ProductListModeNotifier extends StateNotifier<ProductListCartMode> {
  ProductListModeNotifier()
      : super(ProductListCartMode(mode: ProductListMode.normal));

  void setNormalMode() {
    state = ProductListCartMode(
        mode: ProductListMode.normal, cartId: null, lineId: null);
  }

  void setAlternativeMode(String cartId, String lineId) {
    state = ProductListCartMode(
      mode: ProductListMode.alternative,
      cartId: cartId,
      lineId: lineId,
    );
  }
}
