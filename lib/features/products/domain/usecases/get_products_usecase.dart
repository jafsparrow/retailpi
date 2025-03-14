import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    final products = await repository.fetchAllProducts();

    // Apply any domain-specific filtering or sorting if necessary
    products.sort((a, b) => a.name.compareTo(b.name));

    return products;
  }
}
