import 'dart:math';

import 'package:retailpi/features/category/data/repositories/category_repository.dart';
import 'package:retailpi/features/products/data/sources/powersync_product_data_source.dart';
import 'package:retailpi/features/products/data/sources/realm_product_data_source.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/entities/product_variant.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  CategoryRepository categoryRepository;
  PowersyncProductDataSource powersyncProductDataSource;

  ProductRepositoryImpl(
      this.categoryRepository, this.powersyncProductDataSource);

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

  generateRandomProducts() {
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

  @override
  Future<List<Product>> fetchAllProducts() async {
    return powersyncProductDataSource.getProducts();
    return generateRandomProducts();
    // final realMTemplest = realmProductDataSource.featchAllProductTemplate();

    // final mappedList = realMTemplest
    //     .map((product) => ProductMapper.toDomainModel(product))
    //     .toList();
    // return mappedList;
  }

  @override
  Future<ProductVariant?> fetchProductByBarcode(String barcode) {
    // TODO: implement fetchProductByBarcode
    throw UnimplementedError();
  }

  Future<void> uploadProducts(String filePath) async {
    // read the file from the given location

    // // read the category of the given category id;
    // realms.CategoryRealm? categoryRealm =
    //     categoryRepository.getCategoryById(ObjectId.fromHexString('hexString'));

    // _realm.write(() {
    //   for (var item in data) {
    //     _realm.add(Product(
    //       item['name']!,
    //       'codemebro',
    //       item['code']!,
    //       item['cost']!,
    //       item['price']!,
    //     ));
    //   }
    // });
  }

  @override
  Future<void> addProducts(List<Product> products) async {
    // Perform category validation (for example)
    final categoryIds = products.map((p) => p.categoryId).toSet();
    // final validCategories = await categoryRepository.getCategoriesByIds(categoryIds.toList());

    // Only save products with valid categories
    // final validProducts = products.where((p) => validCategories.contains(p.categoryId)).toList();

    // user mapped to map domain product to realmproduct and then pass to datasouce
    // for now experiementation, careting the realmboject right here..
    // realms.Category? categoryRealm =
    //     categoryRepository.getCategoryById(ObjectId.fromHexString('hexString'));

    // final realmProducts = products.map((product) => realms.ProductTemplateRealm(
    //       ObjectId(),
    //       product.name!,
    //       product.defaultCode!,
    //       product.standardPrice!,
    //       product.listPrice!,
    //       'companyId',
    //       DateTime.now(),
    //       true,
    //     ));

    // if (realmProducts.isNotEmpty) {
    //   await realmProductDataSource.addProducts(realmProducts.toList());
    // }
  }

  @override
  Future<List<Product>> searchProducts(String query,
      {int limit = 20, int offset = 0}) async {
    return generateRandomProducts();
    // final productTemplateRealms = realmProductDataSource.searchProducts(query,
    //     limit: limit, offset: offset);

    // final mappedToDomainProduct = productTemplateRealms
    //     .map((product) => ProductMapper.toDomainModel(product));
    // return mappedToDomainProduct.toList();
  }

  @override
  Future<void> addAProduct(Product products) {
    // TODO: implement addAProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> addATagForTheProduct(String id, List<String> tags) {
    // TODO: implement addATagForTheProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deactivateAProduct(String id) {
    // TODO: implement deactivateAProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> updateAProduct(String id, Product product) {
    // TODO: implement updateAProduct
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
