import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/presentation/widgets/cart_list.dart';

class CartListPage extends ConsumerStatefulWidget {
  const CartListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartListPageState();
}

class _CartListPageState extends ConsumerState<CartListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart List'),
      ),
      body: Column(
        children: [
          // cart items.
          Expanded(child: CartList()),
          //  keypad aream.

          // actions area. to add notes of different type.
          Container(
            height: 80,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: GestureDetector(
                    child: Center(
                      child: Icon(Icons.back_hand),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Center(
                      child: Text('hello'),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.toc_rounded),
      ),
    );
  }
}
