import 'dart:math';

double toDecimal(int amount, int decimalPlaces) =>
    amount / pow(10, decimalPlaces);
