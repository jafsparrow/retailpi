import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/data/repositories/cart_persistance_repository_impl.dart';
import 'package:retailpi/features/cart/domain/entities/cart.dart';
import 'package:retailpi/features/cart/domain/entities/cart_state.dart';
import 'package:retailpi/features/cart/presentation/state/notifiers/cart_state_notifier.dart';

final cartPersistenceProvider =
    Provider((ref) => CartPersistenceRepsitoryImpl());

final cartStateProvider =
    StateNotifierProvider<CartStateNotifier, CartState>((ref) {
  final cartPersistenceRepositoryImpl = ref.watch(cartPersistenceProvider);
  return CartStateNotifier(
      cartPersistenceRepository: cartPersistenceRepositoryImpl);
});

final loadCartStateProvider = FutureProvider<void>((ref) async {
  final cartPersistence = ref.read(cartPersistenceProvider);
  final savedCartState = await cartPersistence.loadCartState();
  if (savedCartState != null) {
    ref.read(cartStateProvider.notifier).loadCartState(savedCartState);
  }
});

final activeCartProvider = Provider<Cart?>((ref) {
  final cartState = ref.watch(cartStateProvider);
  // return null;
  return cartState.carts.firstWhere(
    (cart) => cart.id == cartState.activeCartId,
    orElse: () => Cart(
        id: '33',
        createdDateTime: DateTime.now(),
        createdByUserId: 'createdByUserId',
        customerId: 'customerId',
        lines: []),
  );
});

final cartIdsProvider = Provider<List<String>>((ref) {
  final cartState = ref.watch(cartStateProvider);
  return cartState.carts.map((cart) => cart.id).toList();
});

final activeCartTotalProvider = Provider<List<double>>((ref) {
  final cartState = ref.watch(cartStateProvider);
  final activeCart = cartState.carts.firstWhere(
    (cart) => cart.id == cartState.activeCartId,
  );

  if (activeCart == null) return [];

// Find the maximum number of variants in any cart line
  int maxVariants = activeCart.lines
      .map((line) => line.cartItems.length)
      .reduce((a, b) => a > b ? a : b);

  // Calculate totals for each position (variant index)
  List<double> positionTotals = List.generate(maxVariants, (index) {
    return activeCart.lines.fold(0.0, (total, cartLine) {
      // If the cart line has a variant at this position, add its price
      // Otherwise, fallback to the first item's price
      return total +
          (cartLine.cartItems.length > index
              ? cartLine.cartItems[index].unitPrice *
                  cartLine.cartItems[index].quantity
              : cartLine.cartItems[0].unitPrice *
                  cartLine.cartItems[0].unitPrice);
    });
  });

  // Print the totals for each position
  print(positionTotals); // Output: [80.0, 40.0, 30.0]
  return positionTotals;
});
