import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';

class RealmProductDataSource {
  final Realm _realm;

  RealmProductDataSource(this._realm);

  List<ProductVariantRealm> getProducts() {
    return _realm.all<ProductVariantRealm>().toList();
  }

  // List<Product> searchProduct(String query) {
  //   final lowerQuery = query.toLowerCase();

  // }

  List<ProductTemplateRealm> featchAllProductTemplate() {
    return _realm.all<ProductTemplateRealm>().toList();
  }

  uploadProducts(dynamic data, CategoryRealm categoryrealm) {
    _realm.write(() {
      for (var item in data) {
        _realm.add(ProductTemplateRealm(
            ObjectId(),
            item['name']!,
            item['code ']!,
            item['cost']!,
            item['price']!,
            'companyId',
            DateTime.now(),
            true,
            category: categoryrealm));
      }
    });
  }

  Future<void> addProducts(List<ProductTemplateRealm> productTemplatess) async {
    _realm.write(() {
      _realm.deleteAll<ProductTemplateRealm>();
      for (var product in productTemplatess) {
        _realm.add(product);
      }
    });
  }

  List<ProductTemplateRealm> searchProducts(String query,
      {int limit = 20, int offset = 0}) {
    final products = _realm
        .all<ProductTemplateRealm>()
        .query('name CONTAINS[c] \$0 OR defaultCode CONTAINS[c] \$0', [query])
        .skip(offset)
        .take(limit)
        .toList();

    return products;
  }
}
