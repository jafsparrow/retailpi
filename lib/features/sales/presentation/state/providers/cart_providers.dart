import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/data/repositories/cart_persistance_repository_impl.dart';
import 'package:retailpi/features/sales/domain/entities/cart.dart';
import 'package:retailpi/features/sales/domain/entities/cart_state.dart';
import 'package:retailpi/features/sales/presentation/state/notifiers/cart_state_notifier.dart';

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
        cartItems: []),
  );
});

final cartIdsProvider = Provider<List<String>>((ref) {
  final cartState = ref.watch(cartStateProvider);
  return cartState.carts.map((cart) => cart.id).toList();
});

final activeCartTotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartStateProvider);
  final activeCart = cartState.carts.firstWhere(
    (cart) => cart.id == cartState.activeCartId,
  );

  if (activeCart == null) return 0.0;

  // Calculate the total amount for the active cart
  return activeCart.cartItems.fold(0.0, (total, item) {
    return total + (item.quantity * item.unitPrice) - item.discount;
  });
});
