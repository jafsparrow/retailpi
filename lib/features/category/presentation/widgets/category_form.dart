import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/category/presentation/providers/category_provider.dart';

class CategoryForm extends ConsumerStatefulWidget {
  final Function(String) onSubmit;

  CategoryForm({required this.onSubmit});

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends ConsumerState<CategoryForm> {
  final _nameController = TextEditingController();
  String? _selectedParentCategoryId; // Holds the selected parent category

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 16),
            Text('Select Parent Category (optional)'),
            DropdownButton<String>(
              value: _selectedParentCategoryId,
              isExpanded: true,
              items: categories
                  .where((category) =>
                      category.parentId == null) // Only parent categories
                  .map((parentCategory) {
                return DropdownMenuItem(
                  value: parentCategory.id.hexString,
                  child: Text(parentCategory.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedParentCategoryId = value;
                });
              },
              hint: Text('None (will be a parent category)'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _addCategory();
              },
              child: Text('Add Category'),
            ),
          ],
        ),
      ),
    );
  }

  void _addCategory() {
    // final newCategory = Category(
    //   id: DateTime.now().toString(), // Generate a unique ID
    //   name: _nameController.text,
    //   parentId:
    //       _selectedParentCategoryId, // Set the selected parent ID (null if no parent selected)
    // );

    // ref
    //     .read(categoryNotifierProvider.notifier)
    //     .addCategory(newCategory)
    //     .then((_) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Category added')));
    //   Navigator.pop(context); // Go back after adding
    // }).catchError((error) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Error adding category')));
    // });
  }
}
