// SalesQuotationLine class with discount feature
class SalesQuotationLine {
  String? productId;
  String? productName;
  double quantity;
  double price;
  double totalPrice;
  double discount; // new field for discounts

  SalesQuotationLine({
    this.productId,
    this.productName,
    this.quantity = 1,
    this.price = 0.0,
    this.totalPrice = 0.0,
    this.discount = 0.0, // default discount is 0%
  });

  // Calculate total price considering the discount
  void calculateTotalPrice() {
    final discountedPrice =
        price - (price * discount / 100); // percentage discount
    totalPrice = discountedPrice * quantity;
  }
}
