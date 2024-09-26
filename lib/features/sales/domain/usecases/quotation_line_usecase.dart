import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';

class ManageSalesQuotationLinesUseCase {
  SalesQuotation addLine(
      SalesQuotation salesQuotation, SalesQuotationLine newLine) {
    final updatedquotationLines = [...salesQuotation.quotationLines, newLine];
    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: updatedquotationLines));
  }

  SalesQuotation removeLine(SalesQuotation salesQuotation, String productId) {
    final updatedquotationLines = salesQuotation.quotationLines
        .where((line) => line.productId != productId)
        .toList();
    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: updatedquotationLines));
  }

  SalesQuotation updateLine(
      SalesQuotation salesQuotation, SalesQuotationLine updatedLine) {
    final updatedquotationLines = salesQuotation.quotationLines.map((line) {
      if (line.productId == updatedLine.productId) {
        return updatedLine;
      }
      return line;
    }).toList();
    return _calculateSalesQuotation(
        salesQuotation.copyWith(quotationLines: updatedquotationLines));
  }

  SalesQuotation _calculateSalesQuotation(SalesQuotation salesQuotation) {
    final totalAmount = salesQuotation.quotationLines
        .fold(0.0, (sum, line) => sum + line.totalPrice);
    final tax = totalAmount * 0.15; // Example tax rate (15%)
    final totalTaxed = totalAmount + tax;

    return salesQuotation.copyWith(
      totalAmount: totalAmount,
      taxedTotal: totalTaxed,
    );
  }
}
