import 'package:flutter/material.dart';
import 'package:retailpi/core/widgets/padded_container.dart';
import 'package:retailpi/features/home/presentation/widgets/transaction_list.dart';

class RecentTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaddedContainer(
      child: Card.filled(
        child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Invoices'),
                    Tab(text: 'Quotations'),
                    Tab(text: 'Recent Scans'),
                  ],
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: TabBarView(
                    children: [
                      TransactionsList(type: 'Invoice'),
                      TransactionsList(type: 'Quotation'),
                      TransactionsList(type: 'Scan'),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
