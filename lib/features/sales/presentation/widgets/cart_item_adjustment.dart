import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/keypad_custom.dart';

class CartItemAdjustment extends ConsumerStatefulWidget {
  const CartItemAdjustment({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartItemAdjustmentState();
}

class _CartItemAdjustmentState extends ConsumerState<CartItemAdjustment> {
  String _currencyInput = '';
  String _selectedValue = 'Price'; // Initially selected value

  void _onKeypadTap(String value) {
    setState(() {
      _currencyInput = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wall fan vatsun.'),
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
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('300'),
                  RichText(
                    text: TextSpan(
                      text: '30.000 ',
                      style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        TextSpan(
                          text: 'with dicount',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
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
          ],
        ),
      ),
    );
  }
}
