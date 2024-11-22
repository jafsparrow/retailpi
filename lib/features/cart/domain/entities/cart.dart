import 'package:retailpi/features/cart/domain/entities/cart_item.dart';

// domain/entities/sales_quotation.dart
class Cart {
  final String id;
  final DateTime createdDateTime;
  final String createdByUserId;
  final String customerId;
  final List<CartItem> cartItems;
  // final double totalAmount;
  // final double taxedTotal;

  Cart({
    required this.id,
    required this.createdDateTime,
    required this.createdByUserId,
    required this.customerId,
    required this.cartItems,
  });

  // Calculate the total quotation amount
  double calculateTotalAmount() {
    return cartItems.fold(
      0.0,
      (sum, line) => sum + line.totalPrice,
    );
  }

  Cart copyWith({
    String? id,
    DateTime? quotationDate,
    String? createdByUserId,
    String? customerId,
    List<CartItem>? carttItems,
    double? totalAmount,
    double? taxedTotal,
  }) {
    return Cart(
        id: id ?? this.id,
        createdDateTime: quotationDate ?? this.createdDateTime,
        createdByUserId: createdByUserId ?? this.createdByUserId,
        customerId: customerId ?? this.customerId,
        cartItems: carttItems ?? this.cartItems);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cartItems': cartItems.map((item) => item.toJson()).toList(),
        'createdDateTime': createdDateTime,
        'createdByUserId': createdByUserId,
        'customerId': customerId
      };

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      cartItems: (json['cartItems'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      createdDateTime: json['createdDateTime'],
      createdByUserId: '',
      customerId: '',
    );
  }
}


// class Cart {
//   late String id;

//   late DateTime quotationDate;
//   late String createdByUserId;
//   late List<CartLine> CarttItems;
//   late double totalAmount;

//   Cart({
//     required this.id,
//     required this.quotationDate,
//     required this.createdByUserId,
//     required this.CarttItems,
//     required this.totalAmount,
//   });

//   Cart.empty() {
//     id = generateid();
//     quotationDate = DateTime.now();
//     createdByUserId = "defaultUser"; // Should be assigned dynamically
//     CarttItems = [];
//     totalAmount = 0.0;
//   }

//   // Generate a quotation number based on date/time or other criteria
//   String generateid() {
//     return "QTN-${DateTime.now().millisecondsSinceEpoch}";
//   }

//   // Calculate the total quotation amount
//   void calculateTotalAmount() {
//     totalAmount = CarttItems.fold(
//       0.0,
//       (sum, line) => sum + line.totalPrice,
//     );
//   }

//   // Add a new line to the quotation
//   void addLine(CartLine line) {
//     CarttItems.add(line);
//     calculateTotalAmount();
//   }

//   // Remove a line from the quotation
//   void removeLine(int index) {
//     if (index >= 0 && index < CarttItems.length) {
//       CarttItems.removeAt(index);
//       calculateTotalAmount();
//     }
//   }
// }
