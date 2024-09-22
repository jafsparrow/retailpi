import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/usecases/get_top_products_search_usercase.dart';

class ProductSearchNotifier extends StateNotifier<List<Product>> {
  final GetTopProductsSearchUsecase getTopProductsSearchUsecase;

  ProductSearchNotifier({required this.getTopProductsSearchUsecase})
      : super([]);

  // Fetch and filter products from Realm based on search query
  Future<void> searchProducts(String query) async {
    final filteredProducts =
        await getTopProductsSearchUsecase.getTopProductSearch(query);

    state = filteredProducts; // Update the state with the filtered products
  }
}
