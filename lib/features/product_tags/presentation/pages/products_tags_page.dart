import 'package:flutter/material.dart';
import 'package:retailpi/features/product_tags/domain/entities/product_tag.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';

class ProductTagsPage extends StatefulWidget {
  const ProductTagsPage({Key? key}) : super(key: key);

  @override
  _ProductTagsPageState createState() => _ProductTagsPageState();
}

class _ProductTagsPageState extends State<ProductTagsPage> {
  List<ProductTag> _tags = [];
  List<Product> _allProducts = [];

  @override
  void initState() {
    super.initState();
    // Sample data
    _allProducts = [
      Product(
          id: '1',
          name: 'iPhone 13',
          defaultCode: 'APPL-001',
          standardPrice: 700,
          listPrice: 999),
      Product(
          id: '2',
          name: 'Samsung Galaxy S22',
          defaultCode: 'SAMS-001',
          standardPrice: 650,
          listPrice: 899),
      Product(
          id: '3',
          name: 'AirPods Pro',
          defaultCode: 'APPL-002',
          standardPrice: 180,
          listPrice: 249),
      Product(
          id: '4',
          name: 'MacBook Pro',
          defaultCode: 'APPL-003',
          standardPrice: 12000,
          listPrice: 14990),
      Product(
          id: '5',
          name: 'iPad Air',
          defaultCode: 'APPL-004',
          standardPrice: 4500,
          listPrice: 5990),
      Product(
          id: '6',
          name: 'Pixel 7',
          defaultCode: 'GOOG-001',
          standardPrice: 5500,
          listPrice: 699),
      Product(
          id: '7',
          name: 'Sony WH-1000XM4',
          defaultCode: 'SONY-001',
          standardPrice: 250,
          listPrice: 349),
    ];

    _tags = [
      ProductTag(
        id: '1',
        name: 'Apple Products',
        products: _allProducts
            .where((p) => p.defaultCode?.startsWith('APPL') ?? false)
            .toList(),
      ),
      ProductTag(
        id: '2',
        name: 'Smartphones',
        products: _allProducts
            .where((p) =>
                p.name.contains('iPhone') ||
                p.name.contains('Galaxy') ||
                p.name.contains('Pixel'))
            .toList(),
      ),
      ProductTag(
        id: '3',
        name: 'Audio',
        products: _allProducts
            .where((p) => p.name.contains('AirPods') || p.name.contains('Sony'))
            .toList(),
      ),
    ];
  }

  void _addTag() {
    _showTagDialog(null);
  }

  void _editTag(ProductTag tag) {
    _showTagDialog(tag);
  }

  void _showTagDialog(ProductTag? tag) {
    final isEditing = tag != null;
    final nameController =
        TextEditingController(text: isEditing ? tag.name : '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Tag' : 'Add Tag'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Tag Name',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a tag name')),
                  );
                  return;
                }

                setState(() {
                  if (isEditing) {
                    final index = _tags.indexWhere((t) => t.id == tag.id);
                    if (index != -1) {
                      _tags[index] = tag.copyWith(name: nameController.text);
                    }
                  } else {
                    _tags.add(
                      ProductTag(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: nameController.text,
                        products: [],
                      ),
                    );
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text(isEditing ? 'Update' : 'Add'),
            ),
          ],
        );
      },
    );
  }

  void _showTagProductsScreen(ProductTag tag) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => TagProductsScreen(
          tag: tag,
          allProducts: _allProducts,
          onUpdate: (updatedTag) {
            setState(() {
              final index = _tags.indexWhere((t) => t.id == tag.id);
              if (index != -1) {
                _tags[index] = updatedTag;
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('Product Tags'),
      ),
      body: _tags.isEmpty
          ? const Center(
              child: Text('No tags found. Add a new tag to get started.'),
            )
          : ListView.builder(
              itemCount: _tags.length,
              itemBuilder: (context, index) {
                final tag = _tags[index];
                return ListTile(
                  title: Text(tag.name),
                  subtitle: Text('${tag.products.length} products'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editTag(tag),
                  ),
                  onTap: () => _showTagProductsScreen(tag),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTag,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TagProductsScreen extends StatefulWidget {
  final ProductTag tag;
  final List<Product> allProducts;
  final Function(ProductTag) onUpdate;

  const TagProductsScreen({
    Key? key,
    required this.tag,
    required this.allProducts,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _TagProductsScreenState createState() => _TagProductsScreenState();
}

class _TagProductsScreenState extends State<TagProductsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Product> _tagProducts;
  late TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tagProducts = List.from(widget.tag.products);
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  bool _isProductInTag(Product product) {
    return _tagProducts.any((p) => p.id == product.id);
  }

  void _addProductToTag(Product product) {
    if (!_isProductInTag(product)) {
      setState(() {
        _tagProducts.add(product);
      });
    }
  }

  void _removeProductFromTag(Product product) {
    setState(() {
      _tagProducts.removeWhere((p) => p.id == product.id);
    });
  }

  List<Product> _getFilteredProducts() {
    if (_searchQuery.isEmpty) {
      return widget.allProducts;
    }

    return widget.allProducts
        .where((product) =>
            product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            product.defaultCode!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  List<Product> _getFilteredTagProducts() {
    if (_searchQuery.isEmpty) {
      return _tagProducts;
    }

    return _tagProducts
        .where((product) =>
            product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            product.defaultCode!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  Widget _buildProductItem(Product product, bool isInTag, bool isRemovable) {
    return ListTile(
      title: Text(product.name),
      subtitle: Row(
        children: [
          Expanded(
            child: Text('Code: ${product.defaultCode}'),
          ),
          Text(
            'Standard: \$${product.standardPrice?.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'List: \$${product.listPrice?.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: isRemovable
          ? IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => _removeProductFromTag(product),
            )
          : (isInTag
              ? const Icon(Icons.check_circle, color: Colors.green)
              : IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () => _addProductToTag(product),
                )),
      tileColor: isInTag ? Colors.grey.withOpacity(0.1) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _getFilteredProducts();
    final filteredTagProducts = _getFilteredTagProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tag.name}'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tagged Products'),
            Tab(text: 'Add Products'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.onUpdate(
                widget.tag.copyWith(products: _tagProducts),
              );
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('SAVE'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Tagged Products
                filteredTagProducts.isEmpty
                    ? const Center(
                        child: Text('No products in this tag yet'),
                      )
                    : ListView.builder(
                        itemCount: filteredTagProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredTagProducts[index];
                          return _buildProductItem(product, true, true);
                        },
                      ),

                // Tab 2: All Products (for adding)
                ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    final isInTag = _isProductInTag(product);
                    return _buildProductItem(product, isInTag, false);
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Selected Products: ${_tagProducts.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
