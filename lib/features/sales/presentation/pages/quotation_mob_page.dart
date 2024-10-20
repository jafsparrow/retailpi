import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/utils/constants.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/presentation/state/providers/sales_quotation_provider.dart';
import 'package:retailpi/features/sales/presentation/widgets/sales_quotation_line.dart';

class SalesQuotationMobileScreen extends ConsumerStatefulWidget {
  const SalesQuotationMobileScreen({super.key});

  @override
  _QuotationMobileScreenState createState() => _QuotationMobileScreenState();
}

class _QuotationMobileScreenState
    extends ConsumerState<SalesQuotationMobileScreen> {
  final List<FocusNode> _productNameFocusNodes = [];
  late bool hasCustomerSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    final exisitngQuotationLines =
        ref.read(salesQuotationProvider).quotationLines;
    if (exisitngQuotationLines.isNotEmpty) {
      for (var item in exisitngQuotationLines) {
        _productNameFocusNodes.add(FocusNode());
      }
    }
    super.initState();
  }

  // Method to handle adding new line
  void _addLine() {
    final salesQuotationNotifier = ref.read(salesQuotationProvider.notifier);

    _productNameFocusNodes.add(FocusNode());

    salesQuotationNotifier.addLineToQuotation();

    // Request focus for the last added line (productName TextField)
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_productNameFocusNodes.isNotEmpty) {
        FocusScope.of(context).requestFocus(_productNameFocusNodes.last);
      }
    });
  }

  // Method to handle tabbing out or pressing enter
  void _handleFieldExit(int index) {
    final salesQuotation = ref.read(salesQuotationProvider);
    if (index == salesQuotation.quotationLines.length - 1) {
      // If we're on the last line, add a new line when user exits
      _addLine();
    }
  }

  @override
  Widget build(BuildContext context) {
    final salesQuotation = ref.watch(salesQuotationProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(salesQuotation, context),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppConst.kBodyPadding, right: AppConst.kBodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    _buildQuotationLineList(salesQuotation),
                    Text('hello word'),
                    Text('tab 2'),
                  ],
                ),
              ),
              _colorScrollButtonHorizontal()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FullScreenDialog(),
                fullscreenDialog: true, // Makes the dialog full screen
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        // bottomSheet: _buildQuotationSummary(salesQuotation),
      ),
    );
  }

  Widget _buildQuotationLineList(SalesQuotation salesQuotation) {
    return ListView.builder(
      itemCount: salesQuotation.quotationLines.length + 1,
      itemBuilder: (context, index) {
        if (index == salesQuotation.quotationLines.length) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _addLine,
                child: const Text('Add Line'),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: _addLine,
                child: const Text('Add Line'),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: _addLine,
                child: const Text('Add Line'),
              ),
            ],
          );
        } else {
          final line = ref.watch(salesQuotationProvider).quotationLines[index];
          // print('*********checking at quotation page.*****');

          // print(line.productName);
          // print(line.unitPrice);
          // print('*********checking at quotation page.*****');
          return SalesQuotationLineWidget(
            index: index,
            onTabOut: _handleFieldExit,
            productNameFocusNode: _productNameFocusNodes[index],
          );
        }
      },
    );
  }

  AppBar _buildAppBar(SalesQuotation salesQuotation, BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Flexible(
            child: Text(
              hasCustomerSelected
                  ? 'Customer name'
                  : 'Select Customer ddddddddddddddddddddddddddddd',
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right))
        ],
      ),
      actions: _buildAppBarActions(context),
      bottom: TabBar(
        tabs: [
          Tab(text: 'Items'),
          Tab(text: 'Optional'),
          Tab(text: 'Terms'),
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      if (!hasCustomerSelected)
        IconButton(
          onPressed: () {
            setState(() {
              hasCustomerSelected = true;
            });
          },
          icon: Icon(Icons.verified_user_outlined),
        ),
      _buildAppBarPopUpMenu(context),
    ];
  }

  PopupMenuButton<String> _buildAppBarPopUpMenu(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value),
                ),
              ),
            },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(
                value: 'helloovalue',
                child: Text('Templates'),
              ),
              const PopupMenuItem(value: 'second', child: Text('Meta Data')),
              const PopupMenuItem(value: 'third', child: Text('stuff')),
            ]);
  }

  Widget _colorScrollButtonHorizontal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(12, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.00),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: () {
                // Add your button logic here
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 200,
                      child: buildSummartyBottomSheet(),
                    );
                  },
                );
              },
              child: Text('Button ${index + 1}'),
            ),
          );
        }),
      ),
    );
  }

  Widget buildSummartyBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Total: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '30 OMR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text('Discount Applied: 0.0'),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Taxed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '30 OMR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            TextButton(onPressed: () {}, child: Text('Discount')),
            TextButton(onPressed: () {}, child: Text('Print')),
            FilledButton(onPressed: () {}, child: Text('Confirm')),
          ],
        ),
      ],
    );
  }

  Widget customerSubsection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jafar',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 18,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 18,
                ))
          ],
        ),
        Text('Address Line 1 , Line 2'),
        Text('9338393')
      ],
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close Dialog'),
        ),
      ),
    );
  }
}
