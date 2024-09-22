// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:retailpi/features/products/domain/entities/product.dart';

// class ProductSearchField extends ConsumerStatefulWidget {
//   final Function(Product) onProductSelected;

//   ProductSearchField({required this.onProductSelected});

//   @override
//   _ProductSearchFieldState createState() => _ProductSearchFieldState();
// }

// class _ProductSearchFieldState extends ConsumerState<ProductSearchField> {
//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<Product>(
//       textFieldConfiguration: TextFieldConfiguration(
//         decoration: InputDecoration(
//           labelText: 'Product Name or Code',
//         ),
//       ),
//       suggestionsCallback: (pattern) async {
//         // Fetch products based on user input pattern
//         await ref.read(productProvider.notifier).fetchProducts(pattern);
//         return ref.read(productProvider);
//       },
//       itemBuilder: (context, Product product) {
//         return ListTile(
//           title: Text(product.name),
//           subtitle: Text(product.code),
//         );
//       },
//       onSuggestionSelected: (Product product) {
//         widget
//             .onProductSelected(product); // Callback to handle product selection
//       },
//       noItemsFoundBuilder: (context) => ListTile(
//         title: Text('No products found'),
//       ),
//     );
//   }
// }
