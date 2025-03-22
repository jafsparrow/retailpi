// presentation/providers/sales_quotation_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/features/sales/data/repositories/sales_quotation_repository_impl.dart';
import 'package:retailpi/features/sales/data/sources/realm_sales_quotation_data_source.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/repositories/sales_quotation_repository.dart';
import 'package:retailpi/features/sales/domain/usecases/create_quotation.dart';
import 'package:retailpi/features/sales/domain/usecases/quotation_line_usecase.dart';
import 'package:retailpi/features/sales/presentation/state/notifiers/sales_quotation_notifier.dart';

final realmSalesQuotationDataSourceProvider =
    Provider<RealmSalesQuotationDataSource>((ref) {
  return RealmSalesQuotationDataSource();
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

final manageQuotationLinesUseCaseProvider =
    Provider<ManageSalesQuotationLinesUseCase>((ref) {
  return ManageSalesQuotationLinesUseCase();
});

// Riverpod provider
final salesQuotationProvider =
    StateNotifierProvider<SalesQuotationNotifier, SalesQuotation>(
  (ref) => SalesQuotationNotifier(
    createQuotationUseCase: ref.read(createQuotationUseCaseProvider),
    manageLinesUseCase: ref.read(manageQuotationLinesUseCaseProvider),
  ),
);
