import 'package:realm/realm.dart';

part 'product.realm.dart';

@RealmModel()
class _Product {
  late String name;
  late String code;
  late num cost;
  late num price;
  late DateTime updatedAt;
  late String? note;
  late String? printName;
  late bool? printerOverride;
  late String? printer;
  late String? categoryTag;
  late bool? isActive;
  late List<String> tags;
  late Map<String, num> pricelist;
}
