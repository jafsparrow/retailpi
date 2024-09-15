import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/entities/product_variant.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchAllProducts();
  Future<List<ProductVariant>> fetchAllProductWithVariants();
  Future<ProductVariant?> fetchProductByBarcode(String barcode);

  Future<void> uploadProducts(String filePath);
  Future<void> addProducts(List<Product> products);
  Future<List<Product>> searchProducts(String query, {int limit, int offset});
}
