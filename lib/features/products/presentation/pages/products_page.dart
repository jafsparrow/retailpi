import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/pages/product_upload.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/products/presentation/widgets/product_list_item.dart';

class ProductsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the product list state
    final products = ref.watch(productStateNotifierProvider);

    // Get access to the notifier
    final productNotifier = ref.read(productStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text(
          'Product List',
        ),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              FocusScope.of(context).requestFocus(
                  FocusNode()); //[todo] : this is temporary fix for text field focus when user moved back to list page.
              if (selectedValue == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadProductsPage()),
                );
              }

              if (selectedValue == 2) {
                context.go('/products/add');
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Add Prodcut'), value: 2),
              PopupMenuItem(child: Text('Upload Products'), value: 0),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter product name or code',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    // Trigger filtering when search query changes
                    onChanged: (query) => {
                      // if (query.isNotEmpty)
                      //   {
                      ref
                          .read(productStateNotifierProvider.notifier)
                          .searchProducts(query, limit: 50, offset: 0)
                      // }
                    },
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.barcode_reader))
              ],
            ),
          ),
          ListTile(
            title: Text("product A"),
            onTap: () => {context.go('/products/123')},
          ),

          // List of products
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductListItem(
                  productName: product.name!,
                  productCode: product.defaultCode!,
                  productPrice: product.listPrice!,
                  onEdit: () {},
                  onClick: () {
                    _showProductBottomSheet(context, product);
                  },
                );

                // return ListTile(
                //   title: Text(product.name!),
                //   onTap: () => _showProductBottomSheet(context, product),
                //   subtitle: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('Code: ${product.defaultCode}'),
                //       Text('Sell Rate: \$${product.listPrice}'),
                //       // Text('Cost: \$${product.cost.toStringAsFixed(2)}'),
                //     ],
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProductBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      // ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product.name!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Price: ${product.listPrice!.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      '${product.listPrice!.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                // Product Cost
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cost:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      '${product.standardPrice!.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // View Details Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'View Product Details',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddDialog(BuildContext context, WidgetRef ref) {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Product'),
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name = nameController.text;
              final price = double.tryParse(priceController.text) ?? 0.0;
              // if (name.isNotEmpty && price > 0) {
              //   ref
              //       .read(productProvider.notifier)
              //       .addProduct(Product(name: name, price: price));
              //   Navigator.of(context).pop();
              // }
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}

//   void _showEditDialog(BuildContext context, WidgetRef ref, Product product) {
//     final nameController = TextEditingController(text: product.name);
//     final priceController =
//         TextEditingController(text: product.price.toString());

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Product'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Price'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 final name = nameController.text;
//                 final price = double.tryParse(priceController.text) ?? 0.0;
//                 if (name.isNotEmpty && price > 0) {
//                   ref.read(productProvider.notifier).updateProduct(
//                         Product(id: product.id, name: name, price: price),
//                       );
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text('Update'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteProduct(BuildContext context, WidgetRef ref, int id) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Delete Product'),
//           content: Text('Are you sure you want to delete this product?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 ref.read(productProvider.notifier).deleteProduct(id);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
