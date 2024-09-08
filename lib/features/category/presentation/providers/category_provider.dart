import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/features/category/data/data-sources/realm_data_source.dart';
import 'package:retailpi/features/category/data/models/category.dart';
import 'package:retailpi/features/category/data/repositories/category_repository.dart';

final categoryRepositoryProvider = Provider((ref) {
  final realm = ref.watch(realmProvider);
  final dataSource = RealmDataSource(realm);
  return CategoryRepository(dataSource);
});

final addCategoryProvider = Provider((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return (Category category) async {
    await repository.addCategory(category);
  };
});
