import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
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

final selectedCategoryIdProvider = StateProvider<ObjectId>((ref) {
  return ObjectId();
});
final categoryByIdProvider = Provider<Category?>((ref) {
  final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getCategoryById(selectedCategoryId);
});

// List of categories
final categoryNotifierProvider =
    StateNotifierProvider<CategoryListNotifier, List<Category>>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return CategoryListNotifier(repository)..loadCategories();
});

// Notifier for managing category list
class CategoryListNotifier extends StateNotifier<List<Category>> {
  final CategoryRepository _repository;

  CategoryListNotifier(this._repository) : super([]);

  void loadCategories() {
    state = _repository.getCategories();
  }

  void addCategory(Category category) {
    _repository.addCategory(category);
    state = [...state, category];
  }

  void searchCategory(String query) {
    if (query.isEmpty) {
      loadCategories();
    } else {
      state = state.where((category) => category.name.contains(query)).toList();
    }
  }
}
