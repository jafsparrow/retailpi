import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';
import 'package:retailpi/features/sales/domain/usecases/create_quotation.dart';
import 'package:retailpi/features/sales/domain/usecases/quotation_line_usecase.dart';

class SalesQuotationNotifier extends StateNotifier<SalesQuotation> {
  final CreateQuotationUseCase createQuotationUseCase;
  final ManageSalesQuotationLinesUseCase manageLinesUseCase;

  SalesQuotationNotifier(
      {required this.createQuotationUseCase, required this.manageLinesUseCase})
      : super(
          SalesQuotation(
            quotationNumber: 'Temp001',
            quotationDate: DateTime.now(),
            createdByUserId: '',
            customerId: '',
            quotationLines: [],
            totalAmount: 0.0,
            taxedTotal: 0.0,
          ),
        );

  void createQuotation(SalesQuotation quotation) {
    createQuotationUseCase.execute(quotation);
    state = quotation;
  }

  void addLineToQuotation() {
    // when adding for the first time add a dummy line.
    final saleQuotationDummyLine = SalesQuotationLine.empty();
    state = manageLinesUseCase.addLine(state, saleQuotationDummyLine);
  }

  void removeLine(String productId) {
    state = manageLinesUseCase.removeLine(state, productId);
  }

  void updateLine(SalesQuotationLine updatedLine, int index) {
    state = manageLinesUseCase.updateLine(state, updatedLine, index);
  }

  // void updateLineAtIndex(SalesQuotationLine updatedLine, int index) {
  //   state = manageLinesUseCase.updateAtIndex(state, updatedLine, index);
  // }
}
