import 'package:retailpi/features/products/domain/entities/product.dart';

class ProductTag {
  final String id;
  final String name;
  final List<Product> products;

  ProductTag({
    required this.id,
    required this.name,
    required this.products,
  });

  ProductTag copyWith({
    String? id,
    String? name,
    List<Product>? products,
  }) {
    return ProductTag(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
    );
  }
}
