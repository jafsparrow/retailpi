import 'package:realm/realm.dart';

part 'category.realm.dart';

@RealmModel()
class _Category {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String categoryPath;
  late ObjectId? parentId;
}
