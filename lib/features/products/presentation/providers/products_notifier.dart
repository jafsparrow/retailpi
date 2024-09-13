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
