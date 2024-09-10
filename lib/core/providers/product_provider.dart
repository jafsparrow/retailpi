import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/products/respositories/product_repository.dart';
import 'package:retailpi/features/products/state/product_notifier.dart';

final productssProvider = Provider<List<Product>>((ref) {
  final realm = ref.watch(realmProvider);
  return realm.all<Product>().toList();
});

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final realm = ref.watch(realmProvider);
  return ProductNotifier(realm);
});

class ProductNotifier extends StateNotifier<List<Product>> {
  late Realm _realm;
  ProductNotifier(Realm realm) : super([]) {
    _realm = realm;
  }

  List<Product> loadProducts() {
    final products = _realm.all<Product>().toList();
    return products;
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

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final realm = ref.watch(realmProvider);
  return ProductRepository(realm);
});

// Provider for the ItemStateNotifier
final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(repository)..loadProducts();
});


  // realm.write(() {
  //   for (var item in data) {
  //     realm.add(User(
  //       id: item['id']!,
  //       name: item['name']!,
  //       age: item['age']!,
  //     ));
  //   }
  // });