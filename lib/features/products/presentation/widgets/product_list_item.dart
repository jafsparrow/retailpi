import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String productName;
  final String productCode;
  final num productPrice;
  final VoidCallback onEdit;
  final VoidCallback onClick;

  const ProductListItem(
      {Key? key,
      required this.productName,
      required this.productCode,
      required this.productPrice,
      required this.onEdit,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        children: [
          // Product name and code (left side)
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4.0),
                InkWell(
                  onTap: onClick,
                  child: Text(
                    'Code: $productCode',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Price (center right)
          Expanded(
            flex: 1,
            child: Text(
              '${productPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
              textAlign: TextAlign.right,
            ),
          ),

          // Edit button (far right)
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
