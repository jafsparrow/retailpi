import 'package:flutter/material.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';

class ProductEditPage extends StatefulWidget {
  final String productId;

  const ProductEditPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  bool isLoading = true;
  Product? product;

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  Future<void> _fetchProduct() async {
    try {
      // final fetchedProduct =
      //     await ProductService.getProductById(widget.productId);
      // if (fetchedProduct != null) {
      //   setState(() {
      //     product = fetchedProduct;
      //     _nameController = TextEditingController(text: product!.name);
      //     _descriptionController =
      //         TextEditingController(text: product!.description);
      //     _priceController =
      //         TextEditingController(text: product!.price.toString());
      //     isLoading = false;
      //   });
      // } else {
      //   setState(() => isLoading = false);
      // }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Future<void> _saveProduct() async {
    // if (!_formKey.currentState!.validate()) return;

    // final updatedProduct = Product(
    //   id: widget.productId,
    //   name: _nameController.text,
    //   description: _descriptionController.text,
    //   price: double.tryParse(_priceController.text) ?? 0.0,
    // );

    // await ProductService.updateProduct(updatedProduct);

    // Navigate back to product details after saving
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Edit Product")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Product Not Found")),
        body: Center(child: Text("No product data available.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Edit ${product!.name}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Product Name"),
                validator: (value) =>
                    value!.isEmpty ? "Name cannot be empty" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty || double.tryParse(value) == null
                        ? "Enter a valid price"
                        : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
