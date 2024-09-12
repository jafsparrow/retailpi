import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/presentation/providers/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the product list state
    final products = ref.watch(productStateNotifierProvider);

    // Get access to the notifier
    final productNotifier = ref.read(productStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter product name or code',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              // Trigger filtering when search query changes
              onChanged: (query) => {},
            ),
          ),
          // List of products
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    title: Text(product.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('Code: ${product.productTemplate?.defaultCode}'),
                        // Text(
                        //     'Sell Rate: \$${product.productTemplate?.listPrice}'),
                        // Text('Cost: \$${product.cost.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

