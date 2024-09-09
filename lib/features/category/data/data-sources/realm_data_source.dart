import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/models/category.dart';

class RealmDataSource {
  final Realm _realm;

  RealmDataSource(this._realm);

  void saveCategory(Category category) {
    print('am i coming this fa');
    _realm.write(() {
      _realm.add(category);
    });
  }

  List<Category> getCategories() {
    // Implementation for fetching categories
    return _realm.all<Category>().toList();
    return [];
  }

  Category? getCategoryById(ObjectId id) {
    return _realm.find<Category>(id);
  }
}
