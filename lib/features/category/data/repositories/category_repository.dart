import 'package:retailpi/features/category/data/data-sources/realm_data_source.dart';
import 'package:retailpi/features/category/data/models/category.dart';

class CategoryRepository {
  final RealmDataSource _dataSource;

  CategoryRepository(this._dataSource);

  Future<void> addCategory(Category category) async {
    _dataSource.saveCategory(category);
  }
}
