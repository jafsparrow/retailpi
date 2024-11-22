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
  return cartState.carts.firstWhere(
    (cart) => cart.id == cartState.activeCartId,
    // orElse: () => null,
  );
});

final cartIdsProvider = Provider<List<String>>((ref) {
  final cartState = ref.watch(cartStateProvider);
  return cartState.carts.map((cart) => cart.id).toList();
});
