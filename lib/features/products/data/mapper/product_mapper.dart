import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/products/domain/entities/product.dart'
    as domain;

class ProductMapper {
  // Convert domain model to Realm model
  // static ProductRealmModel toRealmModel(Product product) {
  //   return ProductRealmModel(
  //     id: product.id,
  //     name: product.name,
  //     categoryId: product.categoryId,
  //   );
  // }

  // Convert Realm model to domain model
  static domain.Product toDomainModel(ProductTemplate realmProduct) {
    return domain.Product(
        name: realmProduct.name,
        listPrice: realmProduct.listPrice,
        standardPrice: realmProduct.standaredPrice,
        defaultCode: realmProduct.defaultCode);
  }
}
