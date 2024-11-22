import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/cart/domain/entities/cart_item.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import '../../../../core/widgets/keypad_custom.dart';

class CartItemAdjustment extends ConsumerStatefulWidget {
  final CartItem cartItem;
  final Function(CartItem) onConfirm;
  const CartItemAdjustment({
    super.key,
    required this.cartItem,
    required this.onConfirm,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartItemAdjustmentState();
}

class _CartItemAdjustmentState extends ConsumerState<CartItemAdjustment> {
  String _currencyInput = '';
  String _selectedValue = 'Quantity'; // Initially selected value
  String intialValue = '30.30';
  String appliedDiscount = '';
  String enteredPrice = '';
  String enteredQuantity = '1';

  void _onKeypadTap(String value) {
    setState(() {
      _currencyInput = value;
      switch (_selectedValue) {
        case 'Quantity':
          if (_currencyInput.isNotEmpty) {
            enteredQuantity = _currencyInput;
          } else {
            enteredQuantity = '1';
          }
          break;

        case 'Price':
          enteredPrice = _currencyInput;
          break;

        case 'Discount':
          appliedDiscount = _currencyInput;
          break;
        default:
      }
      print(value);
    });
  }

  void _onConfirmTheAdjustmentEntries() {
    Navigator.of(context).pop();
    widget.onConfirm(
      widget.cartItem.copyWith(
          quantity: enteredQuantity.isNotEmpty
              ? double.parse(
                  enteredQuantity,
                )
              : widget.cartItem.quantity,
          unitPrice: enteredPrice.isNotEmpty
              ? double.parse(enteredPrice)
              : widget.cartItem.unitPrice),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cartItem.name),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        color: Colors.white,
                        child: Text(
                          enteredQuantity,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'x  ${enteredPrice.isEmpty ? widget.cartItem.unitPrice : enteredPrice} /Unit',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  RichText(
                    text: _currencyInput.isNotEmpty
                        ? TextSpan(
                            text: enteredPrice.isNotEmpty
                                ? widget.cartItem.unitPrice.toString()
                                : '',
                            style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.shade600,
                            ),
                            children: [
                              TextSpan(
                                text: appliedDiscount.isEmpty
                                    ? ''
                                    : 'with ${appliedDiscount} % discount',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          )
                        : TextSpan(text: ''),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Add more fields, sliders, dropdowns, etc., here

            SegmentedButton<String>(
              segments: const <ButtonSegment<String>>[
                ButtonSegment<String>(
                  value: 'Price',
                  label: Text('Price'),
                  icon: Icon(Icons.looks_one),
                ),
                ButtonSegment<String>(
                  value: 'Discount',
                  label: Text('Discount'),
                  icon: Icon(Icons.looks_two),
                ),
                ButtonSegment<String>(
                  value: 'Quantity',
                  label: Text('Quantity'),
                  icon: Icon(Icons.looks_3),
                ),
              ],
              selected: <String>{_selectedValue}, // Selected value in a set
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedValue = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.blue;
                  }
                  return Colors.grey.shade200;
                }),
              ),
            ),
            CurrencyKeypad(onKeyTap: _onKeypadTap),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: FilledButton(
                    onPressed: _onConfirmTheAdjustmentEntries,
                    child: Text('OK')))
          ],
        ),
      ),
    );
  }
}
