import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/category/presentation/providers/category_provider.dart';
import 'package:retailpi/features/products/data/respositories/product_repository_impl.dart';
import 'package:retailpi/features/products/data/sources/powersync_product_data_source.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';
import 'package:retailpi/features/products/domain/usecases/get_top_products_search_usercase.dart';
import 'package:retailpi/features/products/presentation/providers/product_top_search_notifier.dart';
import 'package:retailpi/features/products/presentation/providers/products_notifier.dart';

final powerSyncProductDataSourceProvider =
    Provider<PowersyncProductDataSource>((ref) {
  return PowersyncProductDataSource();
});

// Provider for ProductRepositoryImpl
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final categoryRepository = ref.read(categoryRepositoryProvider);
  final powerSyncProductRepository =
      ref.read<PowersyncProductDataSource>(powerSyncProductDataSourceProvider);
  return ProductRepositoryImpl(categoryRepository, powerSyncProductRepository);
});

// ViewModel Example
final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<Product>>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return ProductStateNotifier(productRepository);
});

final getTopProductsSearchUsercaseProvider =
    Provider<GetTopProductsSearchUsecase>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return GetTopProductsSearchUsecase(productRepository);
});

final productSearchProvider =
    StateNotifierProvider<ProductSearchNotifier, List<Product>>((ref) {
  final productSearchUsercaseProvider =
      ref.read(getTopProductsSearchUsercaseProvider);
  return ProductSearchNotifier(
      getTopProductsSearchUsecase: productSearchUsercaseProvider);
});

// final productRepositoryProvider = Provider<ProductRepository>((ref) {
//   final realm = ref.watch(realmProvider);
//   return ProductRepository(realm);
// });

// // Provider for the ItemStateNotifier
// final productStateNotifierProvider =
//     StateNotifierProvider<ProductStateNotifier, List<Product>>((ref) {
//   final repository = ref.watch(productRepositoryProvider);
//   return ProductStateNotifier(repository);
// });


  // realm.write(() {
  //   for (var item in data) {
  //     realm.add(User(
  //       id: item['id']!,
  //       name: item['name']!,
  //       age: item['age']!,
  //     ));
  //   }
  // });