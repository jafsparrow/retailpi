import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/cart/presentation/state/notifiers/cart_item_alternative.dart';

final productListCartModeProvider =
    StateNotifierProvider<ProductListModeNotifier, ProductListCartMode>(
  (ref) => ProductListModeNotifier(),
);
