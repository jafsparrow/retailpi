import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/sales/presentation/pages/cart_list_page.dart';
import 'package:retailpi/features/sales/presentation/widgets/product_list.dart';

class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  List<String> chipData = ['Chip 1', 'Chip 2', 'Chip 3', 'Chip 4', 'Chip 5'];
  List<int> activeOrder = [
    33,
    34,
    35,
    36,
    733,
    34,
    35,
    36,
    733,
    34,
    35,
    36,
    733,
    34,
    35,
    36,
    733
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // tags selected for filtering;
          _buildTagsSection(),

          // Product list section
          Expanded(
            child: ProductList(),
          ),
          // summary of the cart and caritems buttton
          Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Card(
                    child: TextButton(onPressed: () {}, child: Text('Pay')),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Card(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => CartListPage(),
                            ),
                          );
                        },
                        child: Text('Cart'),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ), //body,
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    print('First FAB Pressed');
                  },
                  heroTag: 'fab1', // Unique hero tag for each FAB
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16), // Gap between buttons
                FloatingActionButton(
                  onPressed: () {
                    print('Second FAB Pressed');
                  },
                  heroTag: 'fab2',
                  child: Icon(Icons.edit),
                ),
                SizedBox(height: 16), // Gap between buttons
                FloatingActionButton(
                  onPressed: () {
                    print('Third FAB Pressed');
                  },
                  heroTag: 'fab3',
                  child: Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: !_isSearching
          ? Text('App Bar Title') // Show title when not searching
          : TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              autofocus: true, // Automatically focuses the input
              onChanged: (query) {
                // Handle search query
                print(query);
              },
            ),
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _searchController.clear();
              }
              _isSearching = !_isSearching; // Toggle search mode
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.qr_code),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildActiveOrdersBottomSheet();
                  });
            },
            icon: Icon(Icons.grid_3x3)),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert)
      ],
    );
  }

  Widget _buildActiveOrdersBottomSheet() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: _buildActiveOrdersGrid(),
    );
  }

  Widget _buildActiveOrdersGrid() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: activeOrder.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {},
            child: Text(activeOrder[index].toString()),
          );
        });
  }

  _buildTagsSection() {
    return Container(
        width: double.infinity,
        height: 80,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chipData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Chip(
                      label: Text(chipData[index]),
                      deleteIcon: Icon(Icons.close),
                      onDeleted: () {
                        setState(() {
                          chipData.removeAt(
                              index); // Remove chip on close button click
                        });
                      }),
                );
              }),
        )));
  }
}
