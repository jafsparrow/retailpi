import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
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
    List<SalesQuotationLine> quotationLines =
        ref.watch(salesQuotationProvider).quotationLines;
    return ListView.builder(
        itemCount: quotationLines.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showFullScreenProductCountDialog(context, quotationLines[index]);
            },
            leading: Icon(Icons.delete),
            title: Text(quotationLines[index].productName),
            subtitle: RichText(
              text: TextSpan(
                text: '${quotationLines[index].quantity} x ',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: quotationLines[index].unitPrice.toString(),
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
                  quotationLines[index].totalPrice.toString(),
                  style: TextStyle(fontSize: 20),
                )),
          );
        });
  }

  void showFullScreenProductCountDialog(
      BuildContext context, SalesQuotationLine selectedQuotationLine) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return CartItemAdjustment(
            selectedQuotationLineItem: selectedQuotationLine,
            onConfirm: (SalesQuotationLine editedLine) {
              print(editedLine);
            },
          );
        },
      ),
    );
  }
}
