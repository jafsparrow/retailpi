import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/cart/presentation/state/providers/cart_providers.dart';

class CartSwitcher extends ConsumerWidget {
  const CartSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartIds = ref.watch(cartIdsProvider);
    final activeCartId = ref.watch(cartStateProvider).activeCartId;

    print('jafar is awesome');
    print(cartIds);
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: cartIds.length,
        itemBuilder: (context, index) {
          final cartId = cartIds[index];
          final isActive = cartId == activeCartId;

          return ListTile(
            title: Text('Cart ID: $cartId'),
            trailing: isActive ? Icon(Icons.check, color: Colors.green) : null,
            onTap: () {
              ref.read(cartStateProvider.notifier).switchCart(cartId);
              Navigator.pop(context); // Close the bottom sheet after switching
            },
          );
        },
      ),
    );
  }
}
