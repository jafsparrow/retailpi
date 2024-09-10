import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/category/data/data-sources/realm_data_source.dart';

class CategoryRepository {
  final RealmDataSource _dataSource;

  CategoryRepository(this._dataSource);

  Future<void> addCategory({required name, Category? parent}) async {
    _dataSource.saveCategory(name: name, parent: parent);
  }

  Future<void> updateCategory(
      {required Category category,
      required String name,
      Category? parentCategory}) async {
    _dataSource.updateCategory(category, name, parentCategory);
  }

  List<Category> getCategories() {
    return _dataSource.getCategories();
  }

  Category? getCategoryById(ObjectId id) {
    return _dataSource.getCategoryById(id);
  }
}
