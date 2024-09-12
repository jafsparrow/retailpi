class ProductVariant {
  final String id;
  final String name; //name from template.
  final String displayName; // combined name of varint attributes.
  final int? qtyAvailable;
  int? reorderingMinQty;
  int? reorderingMaxQty;
  String? productTmplId;
  int? listPrice;
  List<ProductTemplateVariantValueId>? productTemplateVariantValueIds;
  ProductCategory? category;
  bool? saleOk;
  bool? purchaseOk;
  bool? active;
  List<String>? taxesId;

  int? standardPrice;
  String? defaultCode;

  bool? barcode;

  ProductVariant(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.qtyAvailable});
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
