import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/providers/product_provider.dart';
import 'package:retailpi/features/products/models/product.dart';

class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text('hello here is the product name'),
            subtitle: Text('\${again me...}}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => {}, //_showEditDialog(context, ref, product),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      {}, // _deleteProduct(context, ref, product.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        child: Icon(Icons.add),
      ),
    );
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
}
