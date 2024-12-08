import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/styles/sales_alternative_colors.dart';
import 'package:retailpi/features/cart/domain/entities/cart_item.dart';
import 'package:retailpi/features/cart/domain/entities/cart_line.dart';
import 'package:retailpi/features/cart/presentation/state/notifiers/cart_item_alternative.dart';
import 'package:retailpi/features/cart/presentation/state/providers/cart_providers.dart';
import 'package:retailpi/features/cart/presentation/state/providers/product_list_mode_provider.dart';

class CartLineWidget extends ConsumerWidget {
  final CartLine line;
  final int lineItemNumber;
  final List<int> numss = [1, 2, 3, 4];
  // final CartLine cartLine;
  CartLineWidget({super.key, required this.line, required this.lineItemNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String activeCartId = ref.read(activeCartProvider)!.id;
    return Row(
      children: [
        Container(
          width: 25,
          child: PopupMenuButton(
            menuPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            onSelected: (selectedValue) {
              print(selectedValue);
            },
            icon: Text(lineItemNumber.toString()),
            itemBuilder: (_) => [
              PopupMenuItem(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...SalesPredefinedColor.predefinedColors
                        .asMap()
                        .entries
                        .map((entry) {
                      return InkWell(
                        onTap: () {
                          ref
                              .read(productListCartModeProvider.notifier)
                              .setAlternativeMode(activeCartId, line.id);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: entry.value,
                        ),
                      );
                    })
                  ],
                ),
                value: 0,
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            ...line.cartItems.asMap().entries.map((entry) {
              return CartItemWidget(
                  backgourndColour:
                      SalesPredefinedColor.predefinedColors[entry.key],
                  cartItem: entry.value);
            }),
          ],
        ))
      ],
    );
  }
}

class CartLineHeaderWidget extends ConsumerWidget {
  final CartLine line;

  CartLineHeaderWidget({super.key, required this.line});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String activeCartId = ref.read(activeCartProvider)!.id;
    return Container(
      child: Row(
        children: [
          Text('1'),
          Spacer(),
          ...SalesPredefinedColor.predefinedColors.asMap().entries.map((entry) {
            return InkWell(
              onTap: () {
                ref
                    .read(productListCartModeProvider.notifier)
                    .setAlternativeMode(activeCartId, line.id);
                Navigator.pop(context);
              },
              child: Container(
                width: 18,
                height: 10,
                color: entry.value,
              ),
            );
          })
        ],
      ),
    );
  }
}

class CartItemWidget extends ConsumerWidget {
  final Color backgourndColour;
  final CartItem cartItem;
  CartItemWidget(
      {super.key, required this.backgourndColour, required this.cartItem});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(children: [
        GestureDetector(
          onDoubleTap: () {
            print('double tapped');
          },
          onTap: () {
            print('sigel tapped');
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: backgourndColour,
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  cartItem.name,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              // const Icon(Icons.circle),
            ],
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Text('${cartItem.quantity} x ${cartItem.unitPrice} '),
        const SizedBox(
          width: 5,
        ),
        Text('${cartItem.quantity * cartItem.unitPrice}')
      ]),
    );
  }
}

//  if (cartItems[index].alternatives.isNotEmpty) ...[
//                         ...cartItems[index].alternatives.map((alternative) {
//                           return ListTile(
//                             tileColor: SalesPredefinedColor
//                                 .predefinedColors[alternative.colorIndex],
//                             title: Text(alternative.name),
//                           );
//                         })
//                       ]

 // ListTile(
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
                      //           color: Colors.grey.shade500, fontSize: 20),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: cartItems[index].unitPrice.toString(),
                      //           style: const TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.black),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   isThreeLine: false,
                      //   trailing: IconButton(
                      //     onPressed: () {
                      //       final cartId = cartState.activeCartId!;
                      //       final cartItemId = cartItems[index].id;
                      //       ref
                      //           .read(productListCartModeProvider.notifier)
                      //           .setAlternativeMode(cartId, cartItemId);
                      //       Navigator.pop(context);
                      //     },
                      //     icon: Icon(Icons.alarm),
                      //   ),

                      //   // Text(
                      //   //   cartItems[index].totalPrice.toString(),
                      //   //   style: const TextStyle(fontSize: 20),
                      //   // ),
                      // ),