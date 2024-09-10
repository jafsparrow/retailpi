import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/category/presentation/widgets/category_form.dart';
import '../providers/category_provider.dart';

class CategoryList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryNotifierProvider);

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index].name),
          subtitle: Text(categories[index].categoryPath),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryForm(
                  category: categories[index],
                ),
              ),
            )
          },
        );
      },
    );
  }
}
