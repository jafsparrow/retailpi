import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/data-sources/realm_data_source.dart';
import 'package:retailpi/features/category/data/models/category.dart';

class CategoryRepository {
  final RealmDataSource _dataSource;

  CategoryRepository(this._dataSource);

  Future<void> addCategory(Category category) async {
    _dataSource.saveCategory(category);
  }

  List<Category> getCategories() {
    return _dataSource.getCategories();
  }

  Category? getCategoryById(ObjectId id) {
    return _dataSource.getCategoryById(id);
  }
}
