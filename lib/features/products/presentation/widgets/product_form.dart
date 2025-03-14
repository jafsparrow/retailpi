import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';

class AddEditProductForm extends StatefulWidget {
  final Product? product; // Null when adding a new product.

  const AddEditProductForm({Key? key, this.product}) : super(key: key);

  @override
  _AddEditProductFormState createState() => _AddEditProductFormState();
}

class _AddEditProductFormState extends State<AddEditProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;
    print('running edit add form');
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'name': widget.product?.name,
            'description': widget.product?.description,
            'defaultCode': widget.product?.defaultCode,
            'expiryDate': widget.product?.expiryDate,
            'standardPrice': widget.product?.standardPrice?.toString(),
            'listPrice': widget.product?.listPrice?.toString(),
            'reorderMinQuantity':
                widget.product?.reorderMinQuantity?.toString(),
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name Field
                FormBuilderTextField(
                  name: 'name',
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Product name is required'),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Must be at least 3 characters'),
                  ]),
                ),
                const SizedBox(height: 10),
                // Description Field
                FormBuilderTextField(
                  name: 'description',
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Description is required'),
                  ]),
                ),
                const SizedBox(height: 10),
                // Code Field
                FormBuilderTextField(
                  name: 'code',
                  decoration: InputDecoration(labelText: 'Code'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Code is required'),
                    FormBuilderValidators.minLength(4,
                        errorText: 'Code must be at least 4 characters long'),
                  ]),
                ),
                const SizedBox(height: 10),
                // Expiry Date Field (Optional)
                FormBuilderDateTimePicker(
                  name: 'expiryDate',
                  decoration: InputDecoration(labelText: 'Expiry Date'),
                  inputType: InputType.date,
                  // validator: FormBuilderValidators.,
                ),
                const SizedBox(height: 10),
                // Cost Field
                FormBuilderTextField(
                  name: 'standardPrice',
                  decoration: InputDecoration(labelText: 'Cost'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Cost is required'),
                    FormBuilderValidators.min(0.01,
                        errorText: 'Cost must be greater than 0'),
                  ]),
                ),
                const SizedBox(height: 10),
                // Selling Rate Field
                FormBuilderTextField(
                  name: 'listPrice',
                  decoration: InputDecoration(labelText: 'Selling Rate'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Selling rate is required'),
                    FormBuilderValidators.min(0.01,
                        errorText: 'Selling rate must be greater than 0'),
                  ]),
                ),
                const SizedBox(height: 10),
                // Reorder Quantity Field (Optional)
                FormBuilderTextField(
                  name: 'reorderMinQuantity',
                  decoration: InputDecoration(labelText: 'Reorder Quantity'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    // FormBuilderValidators.optional(),
                    FormBuilderValidators.min(0,
                        errorText: 'Reorder quantity must be non-negative'),
                  ]),
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final formData = _formKey.currentState?.value;
                      if (isEditing) {
                        print('Edited Product Data: $formData');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Product edited successfully!'),
                        ));
                      } else {
                        print('New Product Data: $formData');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Product added successfully!'),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please correct errors in the form'),
                      ));
                    }
                  },
                  child: Text(isEditing ? 'Save Changes' : 'Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
