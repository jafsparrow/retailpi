class RealmProductDataSource {
  RealmProductDataSource();

  getProducts() {
    throw UnimplementedError();
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
