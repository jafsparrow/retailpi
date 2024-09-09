import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/features/category/data/models/category.dart';
import 'package:retailpi/features/pricelists/models/pricelist.dart';
import 'package:retailpi/features/products/models/product.dart';

final realmProvider = Provider<Realm>((ref) {
  final config = Configuration.local(
      [Product.schema, Category.schema, PriceList.schema],
      schemaVersion: 6);
  final realm = Realm(config);
  return realm;
});
