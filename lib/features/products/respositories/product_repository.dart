import 'package:realm/realm.dart';
import 'package:retailpi/features/products/models/product.dart';

class ProductRepository {
  final Realm realm;

  ProductRepository(this.realm);

  Future<void> addProduct(Product product) async {
    realm.write(() {
      realm.add<Product>(product);
    });
  }

  List<Product> getProducts() {
    return realm.all<Product>().toList();
  }

  List<Product> searchProduct(String searchTerm) {
    final results = realm.query<Product>("name CONTAINS[c] \$0", [searchTerm]);
    return results.toList();
  }
}
