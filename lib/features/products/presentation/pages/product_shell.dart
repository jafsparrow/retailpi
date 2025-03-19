// Common layout with navigation bar
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductShell extends StatelessWidget {
  final Widget child;
  const ProductShell({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String location = GoRouterState.of(context).uri.toString();

    // // Mapping routes to their respective titles
    // String getTitle() {
    //   if (location.startsWith('/products')) return "Products";
    //   if (location.startsWith('/vendors')) return "Vendors";
    //   if (location.startsWith('/products/edit')) return "Edit Product";
    //   if (location.startsWith('/vendors/edit')) return "Edit Vendor";
    //   return "Billing System"; // Default Title
    // }

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                context.go('/products');
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Category'),
              onTap: () {
                context.go('/categories');
              },
            ),
            ListTile(
              leading: Icon(Icons.group_rounded),
              title: Text('Product Group'),
              onTap: () {
                context.go('/category');
              },
            ),
            ListTile(
              leading: Icon(Icons.tag),
              title: Text('Tags'),
              onTap: () {
                context.go('/tags');
              },
            ),
          ],
        ),
      ),
      // appBar: AppBar(title: Text(getTitle())),
      body: child,
    );
  }
}
