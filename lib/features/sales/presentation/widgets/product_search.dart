import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';

class ProductSearchField extends ConsumerStatefulWidget {
  final Function(Product) onProductSelected;
  final int index;
  final FocusNode productNameFocusNode;

  ProductSearchField({
    required this.onProductSelected,
    required this.productNameFocusNode,
    required this.index,
  });

  @override
  _ProductSearchFieldState createState() => _ProductSearchFieldState();
}

class _ProductSearchFieldState extends ConsumerState<ProductSearchField> {
  late TextEditingController _typeAheadController;

  @override
  void initState() {
    super.initState();
    _typeAheadController = TextEditingController();

    final line = ref.read(
      salesQuotationProvider.select(
        (quotation) => quotation.quotationLines[widget.index],
      ),
    );
    if (line.productName != 'select product') {
      _typeAheadController.text = line.productName;
    }
  }

  @override
  void dispose() {
    _typeAheadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Product>(
      focusNode: widget.productNameFocusNode,
      controller: _typeAheadController,
      builder: (context, controller, focusNode) {
        return TextField(
          controller: _typeAheadController,
          focusNode: focusNode,
          autofocus: false,
        );
      },
      suggestionsCallback: (pattern) async {
        // Call the searchProducts method in the search notifier as user types
        await ref.read(productSearchProvider.notifier).searchProducts(pattern);
        return ref.read(productSearchProvider);
      },
      itemBuilder: (context, Product product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text("product.code"),
        );
      },
      onSelected: (Product product) {
        _typeAheadController.text = product.name;
        widget.onProductSelected(product); // Handle product selection
      },
      emptyBuilder: (context) => ListTile(
        title: Text('No products found'),
      ),
    );
  }
}
