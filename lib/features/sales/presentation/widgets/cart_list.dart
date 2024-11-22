import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/cart_item.dart';
import 'package:retailpi/features/sales/domain/entities/cart_state.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/state/providers/cart_providers.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/cart_item_adjustment.dart';

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
    List<CartItem> quotationLines =
        ref.watch(activeCartProvider)!.cartItems ?? [];
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              child: Expanded(
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
            ),
            Expanded(
              child: ListView.separated(
                itemCount: quotationLines.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(8),
                        color: Colors.amber,
                        child: ListTile(
                          onTap: () {
                            showFullScreenProductCountDialog(
                                context, quotationLines[index]);
                          },
                          leading: const Icon(Icons.delete),
                          title: Text(quotationLines[index].name),
                          subtitle: RichText(
                            text: TextSpan(
                              text: '${quotationLines[index].quantity} x ',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(
                                  text: quotationLines[index]
                                      .unitPrice
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          isThreeLine: false,
                          trailing: Text(
                            quotationLines[index].totalPrice.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        tileColor: Colors.blue,
                        onTap: () {
                          showFullScreenProductCountDialog(
                              context, quotationLines[index]);
                        },
                        leading: const Icon(Icons.delete),
                        title: Text(quotationLines[index].name),
                        subtitle: RichText(
                          text: TextSpan(
                            text: '${quotationLines[index].quantity} x ',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    quotationLines[index].unitPrice.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(text: '  |  '),
                              TextSpan(
                                text:
                                    quotationLines[index].totalPrice.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        isThreeLine: false,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_box),
                            Icon(Icons.arrow_downward),
                          ],
                        ),
                      )
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
