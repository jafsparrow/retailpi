import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/usecases/upload_products_from_excel_usecase.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/products/presentation/providers/products_upload_notifier.dart';

final uploadProductsFromExcelUseCaseProvider = Provider((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return UploadProductsFromExcelUseCase(productRepository);
});
