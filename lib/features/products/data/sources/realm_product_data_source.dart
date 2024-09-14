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

  List<ProductTemplate> featchAllProductTemplate() {
    return _realm.all<ProductTemplate>().toList();
  }

  uploadProducts(dynamic data, Category categoryrealm) {
    _realm.write(() {
      for (var item in data) {
        _realm.add(ProductTemplate(ObjectId(), item['name']!, item['code ']!,
            item['cost']!, item['price']!, 'companyId', DateTime.now(), true,
            category: categoryrealm));
      }
    });
  }

  Future<void> addProducts(List<ProductTemplate> productTemplatess) async {
    _realm.write(() {
      for (var product in productTemplatess) {
        _realm.add(product);
      }
    });
  }

  List<ProductTemplate> searchProducts(String query) {
    final products = _realm.all<ProductTemplate>().query(
        'name CONTAINS[c] \$0 OR defaultCode CONTAINS[c] \$0',
        [query]).toList();

    return products;
  }
}
