import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/features/category/presentation/providers/category_provider.dart';
import 'package:retailpi/features/products/data/respositories/product_repository_impl.dart';
import 'package:retailpi/features/products/data/sources/realm_product_data_source.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';
import 'package:retailpi/features/products/presentation/providers/products_notifier.dart';

final realmProductDataSourceProvider = Provider<RealmProductDataSource>((ref) {
  final realm = ref.watch(realmProvider);
  return RealmProductDataSource(realm);
});

// Provider for ProductRepositoryImpl
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dataSource = ref.read(realmProductDataSourceProvider);
  final categoryRepository = ref.read(categoryRepositoryProvider);
  return ProductRepositoryImpl(dataSource, categoryRepository);
});

// ViewModel Example
final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<Product>>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return ProductStateNotifier(productRepository);
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