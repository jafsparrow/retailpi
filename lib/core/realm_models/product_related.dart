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
  late _UomRealm saleUom;
  late _UomRealm purchaseUom;
  late String? type;
  late bool? saleOk;
  late String? saleDescription;
  late String companyId;
  late String? image;

  late List<_TaxRealm> salesTaxes; // List of sales taxes applied to the product
  late List<_TaxRealm>
      purchaseTaxes; // List of purchase taxes applied to the product

  late List<_ChargeRealm> salesCharges; // List of fixed charges for sales
  late List<_ChargeRealm>
      purchaseCharges; // List of fixed charges for purchases

  late DateTime updatedAt;
  late String? note;
  late String? printName;
  late bool? printerOverride;
  late String? printer;
  late bool active;
  late List<String>? tags;

  late List<_PriceListRealm>
      pricelists; // List of pricelists applicable to this product

  late List<_ProductVariantRealm> variants; // List of product variants
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

@RealmModel()
class _UomCategoryRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  List<_UomRealm>? uoms;
}

@RealmModel()
class _UomRealm {
  @PrimaryKey()
  late ObjectId id;
  late _UomCategoryRealm uomCategory;
  late String
      uomType; // odoo copy - reference/ bigger/smaller. Not sure where has it used in the code..
  late String name;
  late double factor;
  late double rounding;
  late bool active;
}

@RealmModel()
class _PriceListRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String currency;
  late List<_PriceListRuleRealm> rules;
}

@RealmModel()
class _PriceListRuleRealm {
  @PrimaryKey()
  late ObjectId id;
  late String ruleType; //fixed, percetage, calculated.
  late double? fixedPrice; // fixed price if ruletype is fixed.
  late double?
      percentageDiscount; // percentile value if ruletype is percentage.
  late String? formula; // Formula for calculated price (optional)

  // Optional min/max quantity or conditions for applying the rule
  late double? minQuantity;
  late double? maxQuantity;
}

@RealmModel()
class _ProductTagRealm {
  late ObjectId id;
  late String name;
}

@RealmModel()
class _TaxRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name; // Tax name, e.g., "VAT", "Sales Tax"
  late double rate; // Tax rate percentage, e.g., 15 for 15%
  late String type; // "sales" or "purchase"
  late String
      computation; // "inclusive" or "exclusive" meaning inluded in baseprice or not
  late String region; // Optional: Apply tax based on region
}

@RealmModel()
class _ChargeRealm {
  @PrimaryKey()
  late ObjectId id;
  late String
      name; // Name of the charge, e.g., "Handling Fee", "Service Charge"
  late double amount; // Fixed amount for the charge, e.g., 5.0 for $5
  late String
      type; // "sales" or "purchase", to indicate when this charge is applied
}
