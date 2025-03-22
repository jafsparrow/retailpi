import 'package:retailpi/core/realm_models/product_related.dart';

class ProductVariantDTO {
  final String name; //name from template.
  final String displayName; // combined name of varint attributes.
  final int? qtyAvailable;
  int? reorderingMinQty;
  int? reorderingMaxQty;
  String? productTmplId;
  int? listPrice;
  List<ProductTemplateVariantValueIdDTO>? productTemplateVariantValueIds;
  bool? saleOk;
  bool? purchaseOk;
  bool? active;
  List<String>? taxesId;

  int? standardPrice;
  String? defaultCode;

  bool? barcode;

  ProductVariantDTO(
      {required this.name,
      required this.displayName,
      required this.qtyAvailable});

  // factory ProductVariantDTO.fromRealm(ProductVariantRealm productRealm) {
  //   return ProductVariantDTO(
  //       id: productRealm.id,
  //       name: productRealm.productTemplate!.name,
  //       displayName: productRealm.productTemplate!.name,
  //       qtyAvailable: 2);
  // }
}

class ProductTemplateVariantValueIdDTO {
  int? id;
  String? displayName;

  ProductTemplateVariantValueIdDTO({this.id, this.displayName});
}

class ProductCategoryDTO {
  int? id;
  String? displayName;

  ProductCategoryDTO({this.id, this.displayName});
}
