import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';

abstract class SalesQuotationRepository {
  Future<List<SalesQuotation>> getQuotations();

  Future<void> createQuotation(SalesQuotation quotation);
  // Future<List<SalesQuotation>> searchQuotations(String query,
  //     {int limit, int offset});

  Future<SalesQuotation?> getQuotationById(String id);
}
