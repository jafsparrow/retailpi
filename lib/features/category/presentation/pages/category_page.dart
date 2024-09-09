import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/models/category.dart';
import 'package:retailpi/features/category/presentation/widgets/category_list.dart';
import '../providers/category_provider.dart';

class CategoryPage extends ConsumerStatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  final TextEditingController _categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ref
    //     .read(categoryListProvider.notifier)
    //     .loadCategories(); // Load categories initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_categoryController.text.isNotEmpty) {
                      ref.read(selectedCategoryIdProvider.notifier).state =
                          ObjectId.fromHexString('66de577acd2fe4048ae52db0');
                      var exampleChild = ref.watch(categoryByIdProvider);
                      if (exampleChild != null) {
                        final category = Category(ObjectId(),
                            _categoryController.text, _categoryController.text,
                            children: RealmList(
                                [exampleChild, exampleChild, exampleChild]));

                        ref
                            .read(categoryListProvider.notifier)
                            .addCategory(category);
                      }
                      _categoryController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          // SearchCategory(), // Search bar widget
          Expanded(child: CategoryList()), // Category list widgetR
        ],
      ),
    );
  }
}
