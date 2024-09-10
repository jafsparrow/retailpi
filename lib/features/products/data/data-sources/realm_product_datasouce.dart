import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';

class RealmProductDataSource {
  final Realm _realm;

  RealmProductDataSource(this._realm);

  List<Product> getProducts() {
    return _realm.all<Product>().toList();
  }

  // List<Product> searchProduct(String query) {
  //   final lowerQuery = query.toLowerCase();

  // }
}
