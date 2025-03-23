import 'dart:math';

import 'package:currency_formatter/currency_formatter.dart';

double toLocalCurrency(int amount, int decimalPlaces) =>
    amount / pow(10, decimalPlaces);

double formattedToCurrency(double amount) =>
    double.parse(amount.toStringAsFixed(2));

String formattedToCurrencyAndSymbol(int amount) {
  CurrencyFormat euroSettings = const CurrencyFormat(
    code: 'OMR',
    symbol: '﷼',
    symbolSide: SymbolSide.left,
    thousandSeparator: '.',
    decimalSeparator: ',',
    symbolSeparator: ' ',
  );
  return CurrencyFormatter.format(
    toLocalCurrency(amount, 2),
    euroSettings,
  );
}
