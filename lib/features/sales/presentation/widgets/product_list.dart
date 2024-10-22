import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductList extends ConsumerWidget {
  ProductList({super.key});
  final List<String> product = [
    '4" upvc pipes',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc',
    'Elbow 4 upvc',
    'Tee 4 upvc'
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              title: Text(product[index]),
              trailing: SizedBox(
                width: 30,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              // This creates a separator between the items
              color: Colors.grey,
              thickness: 1,
            );
          },
        ),
      ),
    );
  }
}
