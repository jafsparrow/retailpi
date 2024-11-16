import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/cart_list.dart';

class CartListPage extends ConsumerStatefulWidget {
  const CartListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartListPageState();
}

class _CartListPageState extends ConsumerState<CartListPage> {
  @override
  Widget build(BuildContext context) {
    SalesQuotation quotation = ref.watch(salesQuotationProvider);
    List<SalesQuotationLine> quotationLines = quotation.quotationLines;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: quotationLines.isNotEmpty
          ? Column(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(quotation.totalAmount.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Confirm')
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'No Items in the Cart',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.toc_rounded),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Cart List'), // Show title when not searching

      actions: [
        Icon(Icons.qr_code),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Text('bootom sheet'),
                    );
                  });
            },
            icon: Icon(Icons.grid_3x3)),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
}