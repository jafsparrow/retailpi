import 'dart:io';

import 'package:excel/excel.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/domain/repositories/product_repository.dart';

class UploadProductsFromExcelUseCase {
  final ProductRepository productRepository;

  UploadProductsFromExcelUseCase(this.productRepository);

  Future<void> uploadProductsFromExcel(String filePath) async {
    final products = await _parseExcelFile(filePath);

    // Add all products using the repository
    await productRepository.addProducts(products);
  }

  // Helper method to parse the Excel file (you could move this logic out if desired)
  Future<List<Product>> _parseExcelFile(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final excel = Excel.decodeBytes(bytes);

    List<Product> products = [];

    for (var table in excel.tables.keys) {
      var sheet = excel.tables[table];
      for (var row in sheet!.rows.skip(1)) {
        // Skip header row
        final name = row[1]?.value.toString();
        print(name);
        final code = row[2]?.value.toString();

        final cost = row[5]?.value.toString();
        final price = row[4]?.value.toString();
        print(cost);

        if (name != null && code != null && cost != null) {
          print('inside if condition');
          products.add(Product(
              id: 'someidchange later',
              name: name,
              categoryId: 'catid',
              listPrice: int.parse(price!),
              standardPrice: int.parse(cost!),
              defaultCode: code));
        }
      }
    }

    return products;
  }
}
