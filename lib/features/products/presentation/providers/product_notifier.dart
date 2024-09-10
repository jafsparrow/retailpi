import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/products/data/respositories/product_repository.dart';

class ProductStateNotifier extends StateNotifier<List<Product>> {
  final ProductRepository _productRepository;
  List<Product> _allProducts = [];
  ProductStateNotifier(this._productRepository) : super([]) {
    loadProducts();
  }

  void loadProducts() {
    state = _productRepository.getProducts();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      state = _allProducts;
    } else {
      state = _allProducts.where((product) {
        final lowerQuery = query.toLowerCase();
        return product.productTemplate!.name
                .toLowerCase()
                .contains(lowerQuery) ||
            product.productTemplate!.defaultCode
                .toLowerCase()
                .contains(lowerQuery);
      }).toList();
    }
  }

  uploadProducts(dynamic data) {
    // _realm.write(() {
    //   for (var item in data) {
    //     _realm.add(Product(
    //       item['name']!,
    //       'codemebro',
    //       item['code']!,
    //       item['cost']!,
    //       item['price']!,
    //     ));
    //   }
    // });
  }
}
