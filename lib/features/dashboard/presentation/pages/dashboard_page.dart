// appbar
// with color transaprent.
// automaticallyimply leading false, to prevent user from going back as itis homepge.

// hookwidget for riverpod
// bottom for appbar.
// preffered size widget.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class DashboardScreen extends StatelessWidget {
  final int cartItemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _dashboardCard(context, "Products", Icons.shopping_cart, "/products"),
          _dashboardCard(
              context, "Sales Invoices", Icons.receipt, "/sales-invoices"),
          _dashboardCard(context, "Customers", Icons.people, "/customers"),
          _dashboardCard(context, "Vendors", Icons.store, "/vendors"),
          _dashboardCard(context, "POS", Icons.point_of_sale, "/pos"),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Dashboard"),
      actions: <Widget>[
        // Cart Icon with Badge showing number of items
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
            badgeContent: Text(
              cartItemCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart icon tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Cart Clicked"),
                ));
              },
            ),
          ),
        ),

        // Popup Menu Button for extra options (Scan, Add, etc.)
        PopupMenuButton<String>(
          onSelected: (String result) {
            switch (result) {
              case 'scan':
                // Handle Scan option
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Scan Selected"),
                ));
                break;
              case 'add':
                // Handle Add option
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Add Selected"),
                ));
                break;
              case 'settings':
                // Handle Settings option
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Settings Selected"),
                ));
                break;
            }
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'scan',
              child: ListTile(
                leading: Icon(Icons.qr_code_scanner),
                title: Text('Scan'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'add',
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text('Add'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'settings',
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _dashboardCard(
      BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => context.push(route), // Use context.go() for navigation
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50),
              SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
