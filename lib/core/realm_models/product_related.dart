import 'package:realm/realm.dart';

part 'product_related.realm.dart';

@RealmModel()
class _ProductVariantRealm {
  @PrimaryKey()
  late ObjectId id;
  late _ProductTemplateRealm? productTemplate;
  late String companyId;
  late String defaultCode;
  late String? barcode;
  // combination index is to uniquely identify the variants combinations.
  late String? combinationIndex;

  late Map<String, String> attributes;

  late num listPrice;
  late String sku;
  late num stock;

  late Map<String, num> pricelist;
  // late RealmList<Pricelist> pricelists;
}

@RealmModel()
class _ProductTemplateRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late _CategoryRealm? category; // Reference to the category
  late String defaultCode;
  late num standaredPrice;
  late num listPrice;
  late String? uomId;
  late String? type;
  late bool? saleOk;
  late String? saleDescription;
  late String companyId;
  late String? image;
  late List<String?> taxIds;
  late DateTime updatedAt;
  late String? note;
  late String? printName;
  late bool? printerOverride;
  late String? printer;
  late bool active;
  late List<String> tags;

  // late RealmList<_Product> variants;
}

@RealmModel()
class _CategoryRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  _CategoryRealm? parentCategory; // Reference to the parent category
  late String categoryPath; // Path like 'parent/child/grandchild'
}

@RealmModel()
class _VariantRealm {
  late String id;
  late String defaultCode;
  late String barcode;
  late num qtyAvailable;
  late List<String?> sellerIds;
  late List<_VariantAttributesRealm> attributes;
}

@RealmModel()
class _VariantAttributesRealm {
  late String someThing;
}
