import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/category/presentation/providers/category_provider.dart';

class CategoryForm extends ConsumerStatefulWidget {
  final CategoryRealm?
      category; // If this is null, we're creating a new category.

  CategoryForm({this.category});

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends ConsumerState<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  CategoryRealm? _parentCategory;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _name = widget.category!.name;
      _parentCategory = widget.category!.parentCategory;
    }
  }

  void _saveCategory() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.category == null) {
        // Create new category
        ref
            .read(categoryNotifierProvider.notifier)
            .addCategory(name: _name, parent: _parentCategory);
      } else {
        // Edit existing category
        ref.read(categoryNotifierProvider.notifier).updateCategory(
            category: widget.category!,
            name: _name!,
            parentCategory: _parentCategory);
      }
      Navigator.pop(context); // Close the form after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.category == null ? 'Create Category' : 'Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              DropdownButtonFormField<CategoryRealm>(
                value: widget.category,
                decoration: InputDecoration(labelText: 'Parent Category'),
                items: categories
                    .map((category) => DropdownMenuItem<CategoryRealm>(
                          value: category,
                          child: Text(category.categoryPath),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _parentCategory = value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCategory,
                child: Text(widget.category == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
