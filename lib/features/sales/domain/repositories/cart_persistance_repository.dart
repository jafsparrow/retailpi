import 'package:retailpi/features/sales/domain/entities/cart_state.dart';

abstract class CartPersistenceRepository {
  Future<void> saveCartState(CartState cartState);

  Future<CartState?> loadCartState();
}
