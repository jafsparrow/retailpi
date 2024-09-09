import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/models/category.dart';
import 'package:retailpi/features/category/presentation/widgets/category_form.dart';
import 'package:retailpi/features/category/presentation/widgets/category_list.dart';
import '../providers/category_provider.dart';

class CategoryPage extends ConsumerStatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
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
          // SearchCategory(), // Search bar widget
          Expanded(child: CategoryList()), // Category list widgetR
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryForm(
                onSubmit: (val) {},
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
