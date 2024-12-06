import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/cart/presentation/state/notifiers/cart_item_alternative.dart';
import 'package:retailpi/features/cart/presentation/state/providers/product_list_mode_provider.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/cart/domain/entities/cart_item.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/cart/presentation/state/notifiers/cart_state_notifier.dart';
import 'package:retailpi/features/cart/presentation/state/providers/cart_providers.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/cart/presentation/widgets/cart_item_adjustment.dart';

class ProductList extends ConsumerWidget {
  ProductList({super.key});
  final List<String> product = [
    '4" upvc pipes',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc'
  ];

  // // Method to handle adding new line
  // void _addLine(WidgetRef ref, Product product) {
  //   final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);
  //   SalesQuotationLine newLine = SalesQuotationLine(
  //       productId: product.id!,
  //       productName: product.name,
  //       quantity: 1,
  //       unitPrice: double.parse(
  //         product.standardPrice.toString(),
  //       ),
  //       discount: 0);

  //   salesQuotationNotifier.addLineToQuotation(quotationLine: newLine);
  // }

  // Method to handle adding new line
  void _addLine(WidgetRef ref, Product product) {
    final cartStateNotifier = ref.read(cartStateProvider.notifier);
    final productCartMode = ref.watch(productListCartModeProvider);

    CartItem newLine = CartItem(
      id: product.id!,
      name: product.name,
      quantity: 1,
      unitPrice: double.parse(
        product.standardPrice.toString(),
      ),
      discount: 0,
    );

    if (productCartMode.mode == ProductListMode.alternative) {
      final currentCartId = productCartMode.cartId;
      final cartItemId = productCartMode.cartItemId;

      //TODO: if its the alternative, do the needfull here.
      cartStateNotifier.addAlternativeItem(
          currentCartId!, cartItemId!, newLine);
    } else {
      cartStateNotifier.addToCart(newLine);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the product list state
    final products = ref.watch(productStateNotifierProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              title: Text(
                products[index].name,
                style: TextStyle(overflow: TextOverflow.fade),
              ),
              subtitle: GestureDetector(
                child: Row(
                  children: [
                    Text(products[index].defaultCode ?? 'No Code'),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      products[index].standardPrice.toString(),
                      style: TextStyle(overflow: TextOverflow.clip),
                    ),
                    const Spacer(),
                    const VerticalDivider(),
                    Text(
                      products[index].listPrice.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        height: 140,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(products[index].name),
                            Text(
                              products[index].listPrice.toString(),
                            ),
                            Divider(),
                            Text(products[index].standardPrice.toString()),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      showFullScreenProductCountDialog(
                          context, ref, products[index]);
                    },
                    child: Icon(
                      Icons.keyboard_sharp,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Icon(Icons.add_circle),
                    onTap: () {
                      _addLine(ref, products[index]);
                    },
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              // This creates a separator between the items
              color: Colors.grey,
              thickness: 1,
            );
          },
        ),
      ),
    );
  }

  void showFullScreenProductCountDialog(
      BuildContext context, WidgetRef ref, Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return CartItemAdjustment(
            cartItem: CartItem(
              id: product.id!,
              name: product.name,
              quantity: 1,
              unitPrice: double.parse(product.standardPrice!.toString()),
              discount: 0,
            ),
            onConfirm: (CartItem editedLine) {
              print(editedLine);
              ref.read(cartStateProvider.notifier).addToCart(editedLine);
            },
          );
        },
      ),
    );
  }
}
