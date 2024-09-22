import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';

class GetTopProductsSearchUsecase {
  final ProductRepository repository;

  GetTopProductsSearchUsecase(this.repository);

  Future<List<Product>> getTopProductSearch(String query) async {
    return await repository.searchProducts(query, limit: 10, offset: 0);
  }
}
