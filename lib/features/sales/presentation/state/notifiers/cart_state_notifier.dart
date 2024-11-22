import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/cart.dart';
import 'package:retailpi/features/sales/domain/entities/cart_item.dart';
import 'package:retailpi/features/sales/domain/entities/cart_state.dart';
import 'package:retailpi/features/sales/domain/repositories/cart_persistance_repository.dart';

class CartStateNotifier extends StateNotifier<CartState> {
  final CartPersistenceRepository cartPersistenceRepository;
  CartStateNotifier({required this.cartPersistenceRepository})
      : super(CartState(carts: [], activeCartId: ''));
  // in the above stage, share_prefstored cartstate should be loaded.

  // @override
  // void update(void Function(CartState) updates) {
  //   super.update(updates);
  //   _persistState();
  // }

  void addToCart(CartItem cartItem) {
    // if there is no cart before, add a new cart to the array and have the selected id be the same.
    if (state.carts.isEmpty) {
      Cart cart = Cart(
        id: Random().toString(),
        createdDateTime: DateTime.now(),
        createdByUserId: 'createdByUserId',
        customerId: 'customerId',
        cartItems: [cartItem],
      );

      state = CartState(carts: [cart], activeCartId: cart.id);
    } else {
      // Add item to the active cart
      final activeCart =
          state.carts.firstWhere((cart) => cart.id == state.activeCartId);
      final updatedCart = activeCart.copyWith(
        carttItems: [...activeCart.cartItems, cartItem],
      );
      state = CartState(
        carts: state.carts
            .map((cart) => cart.id == activeCart.id ? updatedCart : cart)
            .toList(),
        activeCartId: state.activeCartId,
      );
    }
    _persistState();
  }

  // Update item in the active cart
  void updateItemInActiveCart({
    required String itemId,
    double? quantity,
    double? unitPrice,
    double? discount,
  }) {
    if (state.carts.isEmpty) return;

    final activeCartIndex =
        state.carts.indexWhere((cart) => cart.id == state.activeCartId);
    if (activeCartIndex == -1) return;

    final activeCart = state.carts[activeCartIndex];
    final updatedItems = activeCart.cartItems.map((item) {
      if (item.id == itemId) {
        return item.copyWith(
          quantity: quantity ?? item.quantity,
          unitPrice: unitPrice ?? item.unitPrice,
          discount: discount ?? item.discount,
        );
      }
      return item;
    }).toList();

    final updatedCart = activeCart.copyWith(carttItems: updatedItems);

    state = CartState(
      carts: state.carts
          .map((cart) => cart.id == activeCart.id ? updatedCart : cart)
          .toList(),
      activeCartId: state.activeCartId,
    );

    _persistState();
  }

  void deleteCart(String cartId) {
    // Ensure the cart exists
    final existingCartIndex =
        state.carts.indexWhere((cart) => cart.id == cartId);
    if (existingCartIndex == -1) return;

    // Remove the cart from the list
    final updatedCarts = List<Cart>.from(state.carts)
      ..removeAt(existingCartIndex);

    // Handle active cart
    final newActiveCartId = state.activeCartId == cartId
        ? (updatedCarts.isNotEmpty ? updatedCarts.first.id : '')
        : state.activeCartId;

    // Update state
    state = CartState(carts: updatedCarts, activeCartId: newActiveCartId);

    _persistState();
  }

  void switchCart(String cartId) {
    // Check if the cartId exists in the current list of carts
    final cartExists = state.carts.any((cart) => cart.id == cartId);

    if (cartExists) {
      // Update the active cart ID
      state = state.copyWith(activeCartId: cartId);
    } else {
      throw Exception('Cart with ID $cartId does not exist');
    }
  }

  void loadCartState(CartState savedState) {
    state = savedState;
  }

  Future<void> _persistState() async {
    // await cartPersistenceRepository.saveCartState(state);
  }
}
