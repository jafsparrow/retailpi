import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/styles/sales_alternative_colors.dart';
import 'package:retailpi/features/cart/domain/entities/cart_item.dart';
import 'package:retailpi/features/cart/domain/entities/cart_state.dart';
import 'package:retailpi/features/cart/presentation/state/providers/product_list_mode_provider.dart';
import 'package:retailpi/features/cart/presentation/widgets/cart_line_widget.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/cart/presentation/state/providers/cart_providers.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/cart/presentation/widgets/cart_item_adjustment.dart';

class CartList extends ConsumerStatefulWidget {
  const CartList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {
  List<String> cartList = [
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo',
    'Ipe',
    'appe',
    'mangeo'
  ];

  @override
  Widget build(BuildContext context) {
    CartState cartState = ref.watch(cartStateProvider);

    print(cartState);
    print('jafar at cartlist broo');
    List<CartItem> cartItems = ref.watch(activeCartProvider)!.cartItems ?? [];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    child: Text('Bro'),
                    onPressed: () {},
                  );
                },
                itemCount: 3,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CartLineWidget(),

                      // ListTile(
                      //   contentPadding: EdgeInsets.all(0),
                      //   tileColor: Colors.blue,
                      //   onTap: () {
                      //     showFullScreenProductCountDialog(
                      //         context, cartItems[index]);
                      //   },
                      //   leading: const Icon(Icons.delete),
                      //   title: Text(cartItems[index].name),
                      //   subtitle: RichText(
                      //     text: TextSpan(
                      //       text: '${cartItems[index].quantity} x ',
                      //       style: TextStyle(
                      //         color: Colors.grey.shade500,
                      //       ),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: cartItems[index].unitPrice.toString(),
                      //           style: const TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         TextSpan(text: '  |  '),
                      //         TextSpan(
                      //           text: cartItems[index].totalPrice.toString(),
                      //           style: const TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      //   isThreeLine: false,
                      //   trailing: const Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Icon(Icons.check_box),
                      //       Icon(Icons.arrow_downward),
                      //     ],
                      //   ),
                      // )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFullScreenProductCountDialog(
      BuildContext context, CartItem cartItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return CartItemAdjustment(
            cartItem: cartItem,
            onConfirm: (CartItem editedLine) {
              print(editedLine);
            },
          );
        },
      ),
    );
  }
}
