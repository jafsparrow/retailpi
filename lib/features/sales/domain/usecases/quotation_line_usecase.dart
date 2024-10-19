import 'dart:convert';

import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';

class ManageSalesQuotationLinesUseCase {
  SalesQuotation addLine(
      SalesQuotation salesQuotation, SalesQuotationLine newLine) {
    final updatedquotationLines = [...salesQuotation.quotationLines, newLine];
    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: updatedquotationLines));
  }

  SalesQuotation removeLine(SalesQuotation salesQuotation, int index) {
    // final updatedquotationLines = salesQuotation.quotationLines
    //     .where((line) => line.productId != productId)
    //     .toList();

    final existingLineItems = salesQuotation.quotationLines;
    existingLineItems.removeAt(index);

    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: existingLineItems));
  }

  SalesQuotation updateLine(SalesQuotation salesQuotation,
      SalesQuotationLine updatedLine, int index) {
    final updatedquotationLines = [...(salesQuotation.quotationLines)]
      ..[index] = updatedLine;

    // final updatedquotationLines = salesQuotation.quotationLines.map((line) {
    //   if (line.productId == updatedLine.productId) {
    //     print('condition of finding the right product called');
    //     return updatedLine;
    //   }

    //   return line;
    // }).toList();
    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: updatedquotationLines));
  }

  // SalesQuotation updateAtIndex(
  //     SalesQuotation salesQuotation, SalesQuotationLine newLine, int index) {
  //   final quotationLines = salesQuotation.quotationLines;
  //   quotationLines[index] = newLine;
  //   print(quotationLines[index].productName);
  //   final salesQuoationUpdatedLines =
  //       salesQuotation.copyWith(quotationLines: quotationLines);
  //   return _calculateSalesQuotation(
  //       salesQuoationUpdatedLines.copyWith(quotationLines: quotationLines));
  // }

  SalesQuotation _calculateSalesQuotation(SalesQuotation salesQuotation) {
    final totalAmount = salesQuotation.quotationLines.fold(0.0, (sum, line) {
      print('line item total at now');
      print(line.totalPrice);
      print('disocunt is');
      print(line.discount);
      return sum + line.totalPrice;
    });
    final tax = totalAmount * 0.15; // Example tax rate (15%)
    final totalTaxed = totalAmount + tax;

    return salesQuotation.copyWith(
      totalAmount: totalAmount,
      taxedTotal: totalTaxed,
    );
  }
}
