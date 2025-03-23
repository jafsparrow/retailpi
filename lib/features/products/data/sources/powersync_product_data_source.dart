import 'dart:math';

import 'package:powersync/sqlite3.dart';
import 'package:retailpi/core/powesync/powersync.dart';
import 'package:retailpi/core/utils/currency_util.dart';
import 'package:retailpi/core/utils/utils.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';

class PowersyncProductDataSource {
  Future<List<Product>> getProducts() async {
    print('fetching products insider pwoersync');
    final random = Random();
    // return generateRandomProducts();
    List<Product> result =
        (await db.getAll('select * from product_product')).map((Row row) {
      return Product(
        id: row['id'],
        name: row['name'],
        defaultCode: 'defualtcodeno',
        standardPrice: int.parse(row['standard_price'].toString()),
        listPrice: int.parse(row['list_price'].toString()),
        categoryId: row['category_id'],
      );
    }).toList();

    db
        .watch(
      'select * from product_product',
    )
        .map((event) {
      return event.map((Row row) => row['name']).toList(growable: false);
    }).listen((items) {
      print('Items: $items');
    });
    return result;
  }

  List<Product> generateRandomProducts() {
    final random = Random();
    final products = List.generate(
      10,
      (index) => Product(
        id: random.nextInt(100000).toString(),
        name: 'Product ${random.nextInt(100)}',
        defaultCode: 'Code${random.nextInt(1000)}',
        standardPrice: 100,
        listPrice: 150,
        categoryId: 'Category${random.nextInt(10)}',
      ),
    );

    return products;
  }

  // List<Product> searchProduct(String query) {
  //   final lowerQuery = query.toLowerCase();

  // }

  featchAllProductTemplate() {
    throw UnimplementedError();
  }

  uploadProducts(dynamic data, String categoryId) {
    throw UnimplementedError();

    // _realm.write(() {
    //   for (var item in data) {
    //     _realm.add(ProductTemplateRealm(
    //         ObjectId(),
    //         item['name']!,
    //         item['code ']!,
    //         item['cost']!,
    //         item['price']!,
    //         'companyId',
    //         DateTime.now(),
    //         true,
    //         category: categoryrealm));
    //   }
    // });
  }

  Future<void> addProducts(List<String> productTemplatess) async {
    //   _realm.write(() {
    //     _realm.deleteAll<ProductTemplateRealm>();
    //     for (var product in productTemplatess) {
    //       _realm.add(product);
    //     }
    //   });
    // }

    // List<ProductTemplateRealm> searchProducts(String query,
    //     {int limit = 20, int offset = 0}) {
    //   final products = _realm
    //       .all<ProductTemplateRealm>()
    //       .query('name CONTAINS[c] \$0 OR defaultCode CONTAINS[c] \$0', [query])
    //       .skip(offset)
    //       .take(limit)
    //       .toList();

    //   return products;
  }
}
