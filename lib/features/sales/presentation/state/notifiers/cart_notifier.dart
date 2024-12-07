// presentation/notifiers/cart_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/cart/domain/entities/cart.dart';
import 'package:retailpi/features/cart/domain/entities/cart_item.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  Cart? _activeCart; // Track active cart
  Cart? get activeCart => _activeCart;

  CartNotifier() : super([]);

  void addCartItem(CartItem item) {
    if (_activeCart == null) return; // Ensure there's an active cart

    state = state.map((cart) {
      if (cart.id == _activeCart!.id) {
        final updatedCart = Cart(
          id: cart.id,
          customerId: cart.customerId,
          lines: [],
          createdByUserId: 'tesmp',
          createdDateTime: new DateTime.now(),
        );
        _activeCart = updatedCart; // Update active cart
        return updatedCart;
      }
      return cart;
    }).toList();
  }

  // void switchCart(String cartId) {
  //   _activeCart =
  //       state.firstWhere((cart) => cart.id == cartId, orElse: () => null);
  // }

  void persistCartState() {
    // Save state using a repository (e.g., shared_preferences)
  }

  void loadPersistedState() {
    // Load state from shared_preferences
  }
}
// 