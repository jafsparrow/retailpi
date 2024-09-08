import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/models/category.dart';

class RealmDataSource {
  final Realm _realm;

  RealmDataSource(this._realm);

  void saveCategory(Category category) {
    _realm.write(() {
      _realm.add(category);
    });
  }
}
