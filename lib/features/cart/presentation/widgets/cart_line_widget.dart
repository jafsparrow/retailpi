import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/styles/sales_alternative_colors.dart';
import 'package:retailpi/features/cart/domain/entities/cart_line.dart';

class CartLineWidget extends ConsumerWidget {
  final List<int> numss = [1, 2, 3, 4];
  // final CartLine cartLine;
  CartLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CartLineHeaderWidget(),
        CartItemWidget(
          backgourndColour: SalesPredefinedColor.predefinedColors[1],
        ),
        CartItemWidget(
          backgourndColour: SalesPredefinedColor.predefinedColors[2],
        ),
        CartItemWidget(
          backgourndColour: SalesPredefinedColor.predefinedColors[3],
        )
      ],
    );
  }
}

class CartLineHeaderWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        children: [
          Text('1'),
          Spacer(),
          ...SalesPredefinedColor.predefinedColors.asMap().entries.map((entry) {
            return InkWell(
              onTap: () {},
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
  CartItemWidget({super.key, required this.backgourndColour});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: backgourndColour,
      child: const Row(children: [
        Icon(Icons.add),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'cartItems[index].name',
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              Icon(Icons.circle),
            ],
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Text('2 x 1.600'),
        SizedBox(
          width: 5,
        ),
        Text('3.200')
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