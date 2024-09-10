import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/products/data/respositories/product_repository.dart';
import 'package:retailpi/features/products/presentation/providers/product_notifier.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final realm = ref.watch(realmProvider);
  return ProductRepository(realm);
});

// Provider for the ItemStateNotifier
final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(repository);
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