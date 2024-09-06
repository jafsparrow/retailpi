import 'package:realm/realm.dart';
part 'variant.realm.dart';

@RealmModel()
class _Variant {
  late String id;
  late String defaultCode;
  late String barcode;
  late num qtyAvailable;
  late List<String?> sellerIds;
  late List<_VariantAttributes> attributes;
}

@RealmModel()
class _VariantAttributes {
  late String someThing;
}
