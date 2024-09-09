import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_provider.dart';

class SearchCategory extends ConsumerWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search Categories',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ref
                  .read(categoryNotifierProvider.notifier)
                  .searchCategory(_searchController.text);
            },
          ),
        ),
        onChanged: (query) {
          ref.read(categoryNotifierProvider.notifier).searchCategory(query);
        },
      ),
    );
  }
}
