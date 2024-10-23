import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showFullScreenProductCountDialog(context);
            },
            leading: Icon(Icons.delete),
            title: Text(cartList[index]),
            subtitle: RichText(
              text: TextSpan(
                text: '3x ',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: '3.500',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
            isThreeLine: false,
            trailing: Container(
                color: Colors.yellow,
                child: Text(
                  '10.500',
                  style: TextStyle(fontSize: 20),
                )),
          );
        });
  }

  void showFullScreenProductCountDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return CartItemAdjustment();
        },
      ),
    );
  }
}
