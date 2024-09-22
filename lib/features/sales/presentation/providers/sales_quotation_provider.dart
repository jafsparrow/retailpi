// presentation/providers/sales_quotation_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/features/sales/data/repositories/sales_quotation_repository_impl.dart';
import 'package:retailpi/features/sales/data/sources/realm_sales_quotation_data_source.dart';
import 'package:retailpi/features/sales/domain/repositories/sales_quotation_repository.dart';
import 'package:retailpi/features/sales/domain/usecases/create_quotation.dart';
import '../../domain/entities/sales_quotation.dart';
import '../../domain/entities/sales_quotation_line.dart';

class SalesQuotationNotifier extends StateNotifier<SalesQuotation> {
  final CreateQuotationUseCase createQuotationUseCase;
  // final AddLineToQuotationUseCase addLineUseCase;

  SalesQuotationNotifier({
    required this.createQuotationUseCase,
    // required this.addLineUseCase,
  }) : super(SalesQuotation(
          quotationNumber: '',
          quotationDate: DateTime.now(),
          createdByUserId: '',
          customerId: '',
          quotationLines: [],
          totalAmount: 0.0,
        ));

  void createQuotation(SalesQuotation quotation) {
    createQuotationUseCase.execute(quotation);
    state = quotation;
  }

  void addLineToQuotation(SalesQuotationLine line) {
    state.quotationLines.add(line);
    // state.totalAmount = state.calculateTotalAmount();
    // addLineUseCase.execute(state.quotationNumber, line);
  }
}

final realmSalesQuotationDataSourceProvider =
    Provider<RealmSalesQuotationDataSource>((ref) {
  final realm = ref.watch(realmProvider);
  return RealmSalesQuotationDataSource(realm);
});

// Provider for ProductRepositoryImpl
final salesQuotationRepositoryProvider =
    Provider<SalesQuotationRepository>((ref) {
  final dataSource = ref.read(realmSalesQuotationDataSourceProvider);

  return QuotationRepositoryImpl(dataSource);
});

final createQuotationUseCaseProvider = Provider<CreateQuotationUseCase>((ref) {
  final salesQuotationRepository = ref.read(salesQuotationRepositoryProvider);
  return CreateQuotationUseCase(salesQuotationRepository);
});

// Riverpod provider
final salesQuotationProvider =
    StateNotifierProvider<SalesQuotationNotifier, SalesQuotation>(
  (ref) => SalesQuotationNotifier(
    createQuotationUseCase: ref.read(createQuotationUseCaseProvider),
    // addLineUseCase: ref.read(addLineUseCaseProvider),
  ),
);