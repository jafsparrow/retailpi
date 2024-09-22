import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/repositories/sales_quotation_repository.dart';

class CreateQuotationUseCase {
  final SalesQuotationRepository repository;

  CreateQuotationUseCase(this.repository);

  Future<void> execute(SalesQuotation quotation) async {
    await repository.createQuotation(quotation);
  }
}
