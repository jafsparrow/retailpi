import 'package:retailpi/features/products/domain/entities/product_variant.dart';

class Product {
  String? id;
  String name;
  String? displayName;
  String? description;
  String? uomName; // unit of measurement
  String? purchaseUom;
  String? defaultCode;

  int listPrice;
  int standardPrice;

  String? type; //not sure at this point why do i need it.
  List<String>? imageUrls;
  int? productVariantCount; // this can be a getter for the count of variant.

  List<ProductVariant>? variants;
  List<AttributeLineIds>? attributeLineIds;
  int? qtyAvailable;

  int? reorderMinQuantity;
  int? reorderingMinQty;
  int? reorderingMaxQty;

  bool? saleOk;

  String? taxString; // [TODO] not sure what to do with this.
  List<TaxId>? salesTaxes;
  List<TaxId>? purchaseTaxes;

  String? companyId; // this might be needed for multi company configuration
  String? categoryId;
  String? posCategoryId; // just having it for the future as in odoo

// this feild is important to decide the stock and re order, if it has variant consider the variant too.
  bool?
      hasVariant; // need this bool just to confirm the only available variant entry is not a variant , it is just so the pos system to search the item quickly

  bool? availableInPos;
  bool? toWeight;
  bool? active;
  String? brand;

  DateTime? expiryDate;

  Product({
    required this.id,
    required this.name,
    this.categoryId,
    required this.listPrice,
    this.defaultCode,
    required this.standardPrice,
  });
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
