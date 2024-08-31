import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/models/product.dart';
import 'package:retailpi/features/products/respositories/product_repository.dart';

class ProductStateNotifier extends StateNotifier<List<Product>> {
  final ProductRepository _productRepository;

  ProductStateNotifier(this._productRepository) : super([]);

  void loadProducts() {
    state = _productRepository.getProducts();
  }

  void searchProduct(String searchTerm) {
    state = _productRepository.searchProduct(searchTerm);
  }
}
