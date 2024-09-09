import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  final Function(String) onSubmit;

  CategoryForm({required this.onSubmit});

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Category Name'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_controller.text);
            },
            child: Text('Add Category'),
          ),
        ],
      ),
    );
  }
}
