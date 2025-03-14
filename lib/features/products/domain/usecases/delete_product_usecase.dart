import '../repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository repository;

  DeleteProductUseCase(this.repository);

  Future<void> execute(String productId) async {
    // Ensure a valid product ID is provided
    if (productId.isEmpty) {
      throw ArgumentError("Product ID cannot be empty.");
    }
    await repository.deactivateAProduct(productId);
  }
}
