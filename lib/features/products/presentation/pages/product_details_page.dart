import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(text: 'Basic Info'),
          //     Tab(text: 'Tags'),
          //     Tab(text: 'Details'),
          //   ],
          // ),
          actions: [
            IconButton(
              onPressed: () {
                context.push('/product-edit', extra: product);
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: Column(
          children: [
            // Product Image and Name Section
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Product Photo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'product.imageUrls![0]',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported, size: 80),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Product Name
                  Expanded(
                    child: Text(
                      product.name,
                      // style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            const TabBar(
              tabs: [
                Tab(text: 'Basic Info'),
                Tab(
                  text: 'Settings',
                ),
                Tab(text: 'QR'),
              ],
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  // Basic Info Tab
                  ProductBasinInfo(
                    product: product,
                  ),
                  // Tags Tab
                  _buildTagsTab(),
                  // Details Tab
                  _buildDetailsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Basic Info Tab Content
  Widget _buildBasicInfoTab() {
    return Container();
    // return ListView.builder(
    //   padding: const EdgeInsets.all(16.0),
    //   itemCount: basicInfo.length,
    //   itemBuilder: (context, index) {
    //     String key = basicInfo.keys.elementAt(index);
    //     String value = basicInfo[key].toString();
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(key, style: const TextStyle(fontWeight: FontWeight.bold)),
    //           Text(value),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  // Tags Tab Content
  Widget _buildTagsTab() {
    return Container();
    // return ListView(
    //   padding: const EdgeInsets.all(16.0),
    //   children: tags
    //       .map((tag) => Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 8.0),
    //             child: Chip(label: Text(tag)),
    //           ))
    //       .toList(),
    // );
  }

  // Details Tab Content
  Widget _buildDetailsTab() {
    return Container();
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Text(
    //     details,
    //     style: const TextStyle(fontSize: 16),
    //   ),
    // );
  }
}

class ProductBasinInfo extends StatelessWidget {
  final Product product;
  const ProductBasinInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(product.name),
        Text(product.defaultCode ?? ''),
        Text(product.standardPrice.toString() ?? ''),
        Text(product.listPrice.toString() ?? ''),
        _buildTagsListChips(product)
      ],
    );
  }

  Widget _buildTagsListChips(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Chip(
        label: Text(
          'label',
        ),
        onDeleted: () {},
      ),
    );
  }
}
