import 'package:retailpi/features/products/data/sources/realm_product_data_source.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/entities/product_variant.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RealmProductDataSource realmProductDataSource;

  ProductRepositoryImpl(this.realmProductDataSource);

  @override
  Future<List<ProductVariant>> fetchAllProductWithVariants() {
    // TODO: implement fetchAllProductWithVariants

    final ProductVariant product = ProductVariant(
        id: '1',
        name: 'Jafar product',
        displayName: 'jafar color black',
        qtyAvailable: null);
    return Future(() => [product, product]);
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> fetchAllProducts() {
    final Product product =
        Product(name: 'Hello Jafar product as fuck template');
    return Future(() => [
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product,
          product
        ]);
    // TODO: implement fetchAllProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductVariant?> fetchProductByBarcode(String barcode) {
    // TODO: implement fetchProductByBarcode
    throw UnimplementedError();
  }
}

// class ProductRepository {
//   final Realm realm;

//   ProductRepository(this.realm);

//   Future<void> addProduct(Product product) async {
//     realm.write(() {
//       realm.add<Product>(product);
//     });
//   }

//   List<Product> getProducts() {
//     return realm.all<Product>().toList();
//   }

//   List<Product> searchProduct(String searchTerm) {
//     final results = realm.query<Product>("name CONTAINS[c] \$0", [searchTerm]);
//     return results.toList();
//   }
// }
