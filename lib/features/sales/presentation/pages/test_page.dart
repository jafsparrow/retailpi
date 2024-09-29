// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:retailpi/features/products/domain/entities/product.dart';
// import 'package:retailpi/features/sales/presentation/widgets/product_search.dart';

// List<String> products = [
//   'Product 1',
//   'Product 2',
//   'Product 3',
//   'Product 4',
//   'Product 5'
// ];

// class TestLine extends StatefulWidget {
//   @override
//   _SalesQuotationLineState createState() => _SalesQuotationLineState();
// }

// class _SalesQuotationLineState extends State<TestLine> {
//   List<String> products = ['Product 1', 'Product 2', 'Product 3'];
//   String? selectedProduct;
//   final Product product = Product(name: 'name');
//   @override
//   Widget build(BuildContext context) {
//     bool isMobile = MediaQuery.of(context).size.width < 600;
//     TextEditingController _searchController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sales Quotation Line'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Responsive logic based on screen size
//             isMobile
//                 ? _buildMobileProductPicker(
//                     context) // Show modal dialog for mobile
//                 : Container(), // Show typeahead for larger screens
//             SizedBox(height: 20),
//             // Display selected product for demo purposes
//             Text('Selected Product: $selectedProduct'),
//           ],
//         ),
//       ),
//     );
//   }

//   // Modal picker for mobile screens
//   Widget _buildMobileProductPicker(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showProductModal(context),
//       child: AbsorbPointer(
//         child: TextField(
//           decoration: InputDecoration(labelText: 'Select Product'),
//           controller: TextEditingController(text: selectedProduct),
//         ),
//       ),
//     );
//   }

//   // Modal dialog with product list for mobile screens
//   Future<void> _showProductModal(BuildContext context) async {
//     String? selected = await showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Product'),
//           content: SizedBox(
//             height: 300,
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(hintText: 'Search'),
//                   onChanged: (value) {
//                     // Handle search input
//                     setState(() {
//                       products = products
//                           .where((product) => product
//                               .toLowerCase()
//                               .contains(value.toLowerCase()))
//                           .toList();
//                     });
//                   },
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: products.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(products[index]),
//                         onTap: () {
//                           Navigator.pop(context, products[index]);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     if (selected != null) {
//       setState(() {
//         selectedProduct = selected;
//       });
//     }
//   }
// }
