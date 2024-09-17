import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';

class RealmDataSource {
  final Realm _realm;

  RealmDataSource(this._realm);

  void saveCategory({required name, CategoryRealm? parent}) {
    CategoryRealm category =
        CategoryRealm(ObjectId(), name, '', parentCategory: parent);
    category.categoryPath =
        generateCategoryPath(category); // Generate and assign categoryPath

    print('am i coming this fa');
    print(category.toString());
    _realm.write(() {
      _realm.add(category);
    });
  }

  void updateCategory(
      CategoryRealm category, String name, CategoryRealm? parent) {
    print('have i reached in update');
    _realm.write(() {
      category.name = name;
      category.parentCategory = parent;
      category.categoryPath =
          generateCategoryPath(category); // Generate and assign categoryPath
    });
  }

  List<CategoryRealm> getCategories() {
    // Implementation for fetching categories
    return _realm.all<CategoryRealm>().toList();
    return [];
  }

  CategoryRealm? getCategoryById(ObjectId id) {
    return _realm.find<CategoryRealm>(id);
  }

  deleteCategory() {
    // TODO - need to think about deleting it on deactivating it, as some product mihgt have the categoryId mapped to it..
  }
  String generateCategoryPath(CategoryRealm category) {
    List<String> path = [];

    CategoryRealm? currentCategory = category;
    while (currentCategory != null) {
      path.insert(
          0,
          currentCategory
              .name); // Add the category name to the start of the list
      currentCategory =
          currentCategory.parentCategory; // Move to the parent category
    }

    return path.join('/'); // Join the names with "/"
  }
}

// void saveProduct({required String productName, required Category category}) {
//   final categoryPath = generateCategoryPath(category); // Generate the category path

//   final product = Product()
//     ..id = ObjectId()
//     ..name = productName
//     ..categoryPath = categoryPath
//     ..category = category; // Save the reference to the category

//   realm.write(() {
//     realm.add(product); // Save the product to Realm
//   });
// }


// void updateCategory(Category category) {
//   final updatedCategoryPath = generateCategoryPath(category);

//   // Find all products associated with this category or its descendants
//   final productsToUpdate = realm.all<Product>().where((product) => 
//       product.category!.id == category.id ||
//       product.categoryPath.startsWith(generateCategoryPath(category)));

//   realm.write(() {
//     for (var product in productsToUpdate) {
//       product.categoryPath = generateCategoryPath(product.category!); // Update the category path
//     }
//   });
// }

// List<Product> filterProductsByCategoryPath(String categoryPath) {
//   return realm.all<Product>().where((product) => product.categoryPath.startsWith(categoryPath)).toList();
// }

// // Example usage:
// final filteredProducts = filterProductsByCategoryPath('parent/child'); 
// // This will find all products in 'parent/child' and any subcategories under 'parent/child'.


// List<Product> filterProductsByCategoryPath(String categoryPath) {
//   // Find all categories that match or are subcategories of the given path
//   final matchingCategories = realm.all<Category>()
//       .where((category) => category.categoryPath.startsWith(categoryPath))
//       .toList();

//   // Get all products that belong to any of the matching categories
//   final matchingProducts = realm.all<Product>()
//       .where((product) => matchingCategories.contains(product.category))
//       .toList();

//   return matchingProducts;
// }



// void updateCategoryPath(Category category) {
//   final updatedCategoryPath = generateCategoryPath(category);

//   // Update this category's path
//   category.categoryPath = updatedCategoryPath;

//   // Recursively update paths for all descendants
//   final childCategories = realm.all<Category>()
//       .where((child) => child.parentCategory?.id == category.id)
//       .toList();

//   for (var child in childCategories) {
//     updateCategoryPath(child); // Recursively update paths for all descendants
//   }
// }
