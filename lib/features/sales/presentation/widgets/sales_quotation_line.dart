
// // Update SalesQuotationLineWidget to include discount input
// class SalesQuotationLineWidget extends ConsumerStatefulWidget {
//   final int index;
//   final SalesQuotationLine line;

//   SalesQuotationLineWidget({required this.index, required this.line});

//   @override
//   _SalesQuotationLineWidgetState createState() => _SalesQuotationLineWidgetState();
// }

// class _SalesQuotationLineWidgetState extends ConsumerState<SalesQuotationLineWidget> {
//   TextEditingController _searchController = TextEditingController();
//   TextEditingController _discountController = TextEditingController(); // new controller for discount

//   @override
//   Widget build(BuildContext context) {
//     final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           // Existing code for product search and quantity input...

//           // Discount input
//           TextField(
//             controller: _discountController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(labelText: 'Discount (%)'),
//             onChanged: (value) {
//               final discount = double.tryParse(value) ?? 0;
//               final updatedLine = SalesQuotationLine(
//                 productId: widget.line.productId,
//                 productName: widget.line.productName,
//                 price: widget.line.price,
//                 quantity: widget.line.quantity,
//                 discount: discount,
//               );
//               updatedLine.calculateTotalPrice();
//               salesQuotationNotifier.updateLine(widget.index, updatedLine);
//             },
//           ),

//           // Total Price after discount
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               'Total after discount: \$${widget.line.totalPrice.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),

//           // Rest of the existing UI...
//         ],
//       ),
//     );
//   }


// // Barcode scanning field in SalesQuotationLineWidget
// IconButton(
//   icon: Icon(Icons.camera_alt),
//   onPressed: () async {
//     // Logic to open camera and scan barcode
//     String? scannedBarcode = await scanBarcode(); // This can be a method using barcode scanning packages
//     if (scannedBarcode != null) {
//       // Search product by barcode
//       final product = ref.read(productProvider.notifier).searchProducts(scannedBarcode).firstOrNull();
//       if (product != null) {
//         final updatedLine = SalesQuotationLine(
//           productId: product.id,
//           productName: product.name,
//           price: product.price,
//           quantity: widget.line.quantity,
//         );
//         updatedLine.calculateTotalPrice();
//         salesQuotationNotifier.updateLine(widget.index, updatedLine);
//       }
//     }
//   },
// ),


// IconButton(
//   icon: Icon(Icons.undo),
//   onPressed: () {
//     final originalLine = SalesQuotationLine(
//       productId: widget.line.productId,
//       productName: widget.line.productName,
//       price: widget.line.price,
//       quantity: widget.line.quantity,
//     );
//     originalLine.calculateTotalPrice();
//     salesQuotationNotifier.updateLine(widget.index, originalLine);
//   },
// ),



// }