import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';

class ProductStateNotifier extends StateNotifier<List<Product>> {
  final ProductRepository _productRepository;
  List<Product> _allProducts = [];
  ProductStateNotifier(this._productRepository) : super([]) {
    loadProducts();
  }

  void loadProducts() async {
    state = await _productRepository.fetchAllProducts();
  }

  Future<void> searchProducts(String query,
      {int limit = 20, int offset = 0}) async {
    if (query.isEmpty) {
      loadProducts();
      return;
    }
    state = await _productRepository.searchProducts(query,
        limit: limit, offset: offset);
  }

  // void searchProduct(String query) {
  //   if (query.isEmpty) {
  //     state = _allProducts;
  //   } else {
  //     state = _allProducts.where((product) {
  //       final lowerQuery = query.toLowerCase();
  //       return product.productTemplate!.name
  //               .toLowerCase()
  //               .contains(lowerQuery) ||
  //           product.productTemplate!.defaultCode
  //               .toLowerCase()
  //               .contains(lowerQuery);
  //     }).toList();
  //   }
  // }
}
