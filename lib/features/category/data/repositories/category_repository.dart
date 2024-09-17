import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/category/data/data-sources/realm_data_source.dart';

class CategoryRepository {
  final RealmDataSource _dataSource;

  CategoryRepository(this._dataSource);

  Future<void> addCategory({required name, CategoryRealm? parent}) async {
    _dataSource.saveCategory(name: name, parent: parent);
  }

  Future<void> updateCategory(
      {required CategoryRealm category,
      required String name,
      CategoryRealm? parentCategory}) async {
    _dataSource.updateCategory(category, name, parentCategory);
  }

  List<CategoryRealm> getCategories() {
    return _dataSource.getCategories();
  }

  CategoryRealm? getCategoryById(ObjectId id) {
    return _dataSource.getCategoryById(id);
  }
}
