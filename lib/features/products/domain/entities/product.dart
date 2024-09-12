class Product {
  String? id;
  int? productVariantCount;
  bool? isProductVariant;
  List<AttributeLineIds>? attributeLineIds;
  int? qtyAvailable;
  String? uomName;
  String? name;
  String? displayName;
  int? reorderingMinQty;
  int? reorderingMaxQty;
  bool? saleOk;
  int? listPrice;
  String? taxString;
  List<TaxId>? taxesId;

  Product({required this.name});
}

class AttributeLineIds {
  int? id;
  int? valueCount;
  int? sequence;
  AttributeId? attributeId;
  List<ValueIds>? valueIds;

  AttributeLineIds(
      {this.id,
      this.valueCount,
      this.sequence,
      this.attributeId,
      this.valueIds});
}

class AttributeId {
  int? id;
  String? displayName;

  AttributeId({this.id, this.displayName});
}

class TaxId {
  int? id;
  String? displayName;

  TaxId({this.id, this.displayName});
}

class ValueIds {
  int? id;
  String? displayName;
  int? color;

  ValueIds({this.id, this.displayName, this.color});
}
