import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/usecases/upload_products_from_excel_usecase.dart';
import 'package:retailpi/features/products/presentation/providers/products_upload_provider.dart';

class UploadProductsState {
  final bool isLoading;
  final bool success;
  final String? errorMessage;

  UploadProductsState({
    this.isLoading = false,
    this.success = false,
    this.errorMessage,
  });

  UploadProductsState copyWith({
    bool? isLoading,
    bool? success,
    String? errorMessage,
  }) {
    return UploadProductsState(
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class UploadProductsNotifier extends StateNotifier<UploadProductsState> {
  final UploadProductsFromExcelUseCase uploadProductsFromExcelUseCase;

  UploadProductsNotifier(this.uploadProductsFromExcelUseCase)
      : super(UploadProductsState());

  Future<void> uploadProducts(String filePath) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await uploadProductsFromExcelUseCase.uploadProductsFromExcel(filePath);
      state = state.copyWith(isLoading: false, success: true);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        errorMessage: error.toString(),
      );
    }
  }
}

final uploadProductsNotifierProvider =
    StateNotifierProvider<UploadProductsNotifier, UploadProductsState>((ref) {
  final useCase = ref.read(uploadProductsFromExcelUseCaseProvider);
  return UploadProductsNotifier(useCase);
});
