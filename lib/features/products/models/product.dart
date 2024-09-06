import 'package:realm/realm.dart';

part 'product.realm.dart';

@RealmModel()
class _ProductTemplate {
  late String name;

  late String? categoryId;
  late String defaultCode;
  late num standaredPrice;
  late num listPrice;
  late String? uomId;
  late String? type;
  late bool? saleOk;
  late String? saleDescription;
  late String companyId;
  late String image;
  late List<String?> taxIds;
  late DateTime updatedAt;
  late String? note;
  late String? printName;
  late bool? printerOverride;
  late String? printer;
  late bool active;
  late List<String> tags;
}

@RealmModel()
class _Product {
  late String templateId;
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
}
