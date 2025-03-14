class ProductVariant {
  final String id;
  final String name; //name from template.
  final String displayName; // combined name of varint attributes.
  int? listPrice;
  int? standardPrice;

  String? defaultCode;
  bool? barcode;

  final int? qtyAvailable;
  int? reorderingMinQty;
  int? reorderingMaxQty;

  String? productTmplId;

  List<ProductTemplateVariantValueId>? productTemplateVariantValueIds;
  List<String>? saleTaxes;

  // ProductCategory? category; //need to confirm if I really need category for variant.
  bool? saleOk;
  bool? purchaseOk;
  bool? active;
  bool
      isProductVariant; // this is for fagging the item as part of other variant.

  ProductVariant({
    required this.id,
    required this.name,
    required this.displayName,
    required this.qtyAvailable,
    this.isProductVariant = false,
  });
}

class ProductTemplateVariantValueId {
  int? id;
  String? displayName;

  ProductTemplateVariantValueId({this.id, this.displayName});
}

class ProductCategory {
  int? id;
  String? displayName;

  ProductCategory({this.id, this.displayName});
}
