import 'package:flutter/material.dart';
import 'package:retailpi/features/category/domain/entities/category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Category> _categories = [];
  List<Category> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    // Sample data
    _categories = [
      Category(
          id: '1', name: 'Electronics', isActive: true, parentCategory: null),
      Category(id: '2', name: 'Clothing', isActive: true, parentCategory: null),
      Category(id: '3', name: 'Books', isActive: false, parentCategory: null),
      Category(
          id: '4',
          name: 'Smartphones',
          isActive: true,
          parentCategory: _categories.isNotEmpty ? _categories[0] : null),
      Category(
          id: '5',
          name: 'T-shirts',
          isActive: true,
          parentCategory: _categories.length > 1 ? _categories[1] : null),
    ];
    _filteredCategories = List.from(_categories);

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filterCategories();
    });
  }

  void _filterCategories() {
    if (_searchQuery.isEmpty) {
      _filteredCategories = List.from(_categories);
    } else {
      _filteredCategories = _categories
          .where((category) =>
              category.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  void _addCategory() {
    _showCategoryDialog(null);
  }

  void _editCategory(Category category) {
    _showCategoryDialog(category);
  }

  void _showCategoryDialog(Category? category) {
    final isEditing = category != null;
    final nameController =
        TextEditingController(text: isEditing ? category.name : '');
    bool isActive = isEditing ? category.isActive : true;
    Category? parentCategory = isEditing ? category.parentCategory : null;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(isEditing ? 'Edit Category' : 'Add Category'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Category Name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('Active:'),
                        Switch(
                          value: isActive,
                          onChanged: (value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<Category?>(
                      value: parentCategory,
                      decoration: const InputDecoration(
                        labelText: 'Parent Category',
                      ),
                      items: [
                        const DropdownMenuItem<Category?>(
                          value: null,
                          child: Text('None'),
                        ),
                        ..._categories
                            .where(
                                (c) => c.id != (isEditing ? category.id : ''))
                            .map((c) => DropdownMenuItem<Category?>(
                                  value: c,
                                  child: Text(c.name),
                                ))
                            .toList(),
                      ],
                      onChanged: (value) {
                        setState(() {
                          parentCategory = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter a category name')),
                      );
                      return;
                    }

                    if (isEditing) {
                      final updatedCategory = category.copyWith(
                        name: nameController.text,
                        isActive: isActive,
                        parentCategory: parentCategory,
                      );

                      setState(() {
                        final index =
                            _categories.indexWhere((c) => c.id == category.id);
                        if (index != -1) {
                          _categories[index] = updatedCategory;
                          _filterCategories();
                        }
                      });
                    } else {
                      final newCategory = Category(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: nameController.text,
                        isActive: isActive,
                        parentCategory: parentCategory,
                      );

                      setState(() {
                        _categories.add(newCategory);
                        _filterCategories();
                      });
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(isEditing ? 'Update' : 'Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('Categories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Categories',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filteredCategories.isEmpty
                ? const Center(
                    child: Text('No categories found'),
                  )
                : ListView.builder(
                    itemCount: _filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = _filteredCategories[index];
                      return ListTile(
                        title: Text(category.name),
                        subtitle: Text(
                          category.parentCategory != null
                              ? 'Parent: ${category.parentCategory!.name}'
                              : 'No parent category',
                        ),
                        leading: Icon(
                          Icons.category,
                          color: category.isActive ? Colors.green : Colors.grey,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editCategory(category),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCategory,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:retailpi/features/category/presentation/widgets/category_form.dart';
// import 'package:retailpi/features/category/presentation/widgets/category_list.dart';

// class CategoryPage extends ConsumerStatefulWidget {
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }

// class _CategoryPageState extends ConsumerState<CategoryPage> {
//   @override
//   void initState() {
//     super.initState();
//     // ref
//     //     .read(categoryListProvider.notifier)
//     //     .loadCategories(); // Load categories initially
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Categories')),
//       body: Column(
//         children: [
//           // SearchCategory(), // Search bar widget
//           Expanded(child: CategoryList()), // Category list widgetR
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CategoryForm(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
