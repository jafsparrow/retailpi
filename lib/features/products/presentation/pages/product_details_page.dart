import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retailpi/core/widgets/padded_container.dart';
import 'package:retailpi/features/products/domain/entities/product.dart';
import 'package:retailpi/features/products/presentation/widgets/product_detail_screen/general_info.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product detail'),
      ),
      body: PaddedContainer(
        child: Column(
          children: [
            _buildProductCard(context),
            Expanded(child: _buildProductPageTabs(context))
          ],
        ),
      ),
    );
  }

  Widget _buildProductPageTabs(BuildContext context) {
    return DefaultTabController(
        length: 4, // Number of tabs
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.info), text: "General Info"),
                Tab(icon: Icon(Icons.shopping_cart), text: "Sale"),
                Tab(icon: Icon(Icons.inventory), text: "Inventory"),
                Tab(icon: Icon(Icons.qr_code), text: "Barcode"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // General Info Tab
                  ProductGeneralInfo(
                      description:
                          'A new way to introduce the drainage to your home',
                      costPrice: 2.9,
                      appliedTaxes: 2.1,
                      unitOfMeasure: 'NOs'),

                  // Sale Tab
                  Center(child: Text("Sale Content")),

                  // Inventory Tab
                  Center(child: Text("Inventory Content")),

                  // Barcode Tab
                  Center(child: Text("Barcode Content")),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildProductCard(BuildContext context) {
    return Card.filled(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " 4 upvc pipe",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text('PP110UP-ALFT'),
                Text('3.700 OMR')
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Placeholder(),
          ),
        ],
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
