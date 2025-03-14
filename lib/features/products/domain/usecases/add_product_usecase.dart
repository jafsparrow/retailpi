import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  Future<void> execute(Product product) async {
    // Business rules (if any) can be added here
    if (product.name.isEmpty) {
      throw ArgumentError("Product name cannot be empty.");
    }
    if (product.standardPrice! < 0) {
      throw ArgumentError("Product price cannot be negative.");
    }
    await repository.addAProduct(product);
  }
}
