import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/features/products/presentation/pages/product_upload.dart';
import 'package:retailpi/features/products/presentation/providers/products_provider.dart';
import 'package:retailpi/features/cart/presentation/pages/cart_list_page.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/cart/presentation/widgets/cart_item_adjustment.dart';
import 'package:retailpi/features/sales/presentation/widgets/product_list.dart';
import 'package:retailpi/features/sales/presentation/widgets/search_suggestion.dart';

class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  bool _isSearching = false;
  bool _showSuggestions = false;
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
  void initState() {
    super.initState();

    // Start listening to changes.
    _searchController.addListener(_searchProduct);
  }

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width, // Adjust as needed
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(
              0, 1), // Adjust the position offset (below the target widget)
          child: Material(
            elevation: 4.0,
            child: Container(
              height: 200,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SearchSuggestion(onSuggestion: _setTheSearchText),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: _closeSuggestions,
                          icon: Icon(Icons.ac_unit))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      _showSuggestions = _isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _removeOverlay();
      }
      if (_showSuggestions) {
        _showOverlay(context);
      }
    });
  }

  void _closeSuggestions() {
    setState(() {
      _showSuggestions = false;
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _searchProduct() {
    ref
        .read(productStateNotifierProvider.notifier)
        .searchProducts(_searchController.text, limit: 50, offset: 0);
  }

  void _setTheSearchText(String query) {
    _searchController.text = _searchController.text + query;
  }

  @override
  Widget build(BuildContext context) {
    int cartCount = ref.watch(salesQuotationProvider).quotationLines.length;
    double cartTotal = ref.watch(salesQuotationProvider).totalAmount;
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: Column(
        children: [
          // tags selected for filtering;
          CompositedTransformTarget(
            link: _layerLink,
            child: Container(
              width: double.infinity,
              height: 0,
            ),
          ),
          _buildTagsSection(),

          // Product list section
          Expanded(
            child: ProductList(),
          ),
          // summary of the cart and caritems buttton
          if (cartCount != 0) _buildCardSummary(context, cartTotal)
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

  Container _buildCardSummary(BuildContext context, double cartTotal) {
    return Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 100,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Cart'),
                      SizedBox(
                        width: 10,
                      ),
                      VerticalDivider(),
                      Text(
                        cartTotal.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
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
                ref
                    .read(productStateNotifierProvider.notifier)
                    .searchProducts(query, limit: 50, offset: 0);
              },
            ),
      actions: [
        _isSearching
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: _toggleSearch,
              )
            : IconButton(
                icon: Icon(Icons.search),
                onPressed: _toggleSearch,
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
        PopupMenuButton(
          onSelected: (selectedValue) {
            FocusScope.of(context).requestFocus(
                FocusNode()); //[todo] : this is temporary fix for text field focus when user moved back to list page.

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadProductsPage()),
            );
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(child: Text('Upload Products'), value: 0),
          ],
        ),
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

  Widget _buildTagsSection() {
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
                    setState(
                      () {
                        chipData.removeAt(
                            index); // Remove chip on close button click
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _searchController.dispose();
    super.dispose();
  }
}
