import 'package:retailpi/features/cart/domain/entities/cart_state.dart';

abstract class CartPersistenceRepository {
  Future<void> saveCartState(CartState cartState);

  Future<CartState?> loadCartState();
}
