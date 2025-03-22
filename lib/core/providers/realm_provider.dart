// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:realm/realm.dart';
// import 'package:retailpi/core/realm_models/product_related.dart';
// import 'package:retailpi/features/pricelists/models/pricelist.dart';
// import 'package:retailpi/features/products/presentation/widgets/product_list_item.dart';

// final realmProvider = Provider<Realm>((ref) {
//   final config = Configuration.local([
//     ProductTemplateRealm.schema,
//     ProductVariantRealm.schema,
//     CategoryRealm.schema,
//     PriceListRealm.schema,
//     PriceListRuleRealm.schema,
//     PosCategoryRealm.schema,
//     UomRealm.schema,
//     TaxRealm.schema,
//     ChargeRealm.schema,
//     UomCategoryRealm.schema,
//   ], schemaVersion: 9);
//   final realm = Realm(config);
//   return realm;
// });
