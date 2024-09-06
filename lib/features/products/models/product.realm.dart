// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  Product(
    String name,
    String defaultCode,
    num standaredPrice,
    num listPrice,
    String companyId,
    String image,
    DateTime updatedAt,
    bool active, {
    String? barcode,
    String? uomId,
    String? type,
    bool? saleOk,
    String? saleDescription,
    Iterable<String?> taxIds = const [],
    String? note,
    String? printName,
    bool? printerOverride,
    String? printer,
    String? categoryId,
    bool? isActive,
    Iterable<String> tags = const [],
    Map<String, num> pricelist = const {},
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'defaultCode', defaultCode);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'standaredPrice', standaredPrice);
    RealmObjectBase.set(this, 'listPrice', listPrice);
    RealmObjectBase.set(this, 'uomId', uomId);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'saleOk', saleOk);
    RealmObjectBase.set(this, 'saleDescription', saleDescription);
    RealmObjectBase.set(this, 'companyId', companyId);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set<RealmList<String?>>(
        this, 'taxIds', RealmList<String?>(taxIds));
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'printName', printName);
    RealmObjectBase.set(this, 'printerOverride', printerOverride);
    RealmObjectBase.set(this, 'printer', printer);
    RealmObjectBase.set(this, 'categoryId', categoryId);
    RealmObjectBase.set(this, 'isActive', isActive);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set<RealmMap<num>>(
        this, 'pricelist', RealmMap<num>(pricelist));
    RealmObjectBase.set(this, 'active', active);
  }

  Product._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get defaultCode =>
      RealmObjectBase.get<String>(this, 'defaultCode') as String;
  @override
  set defaultCode(String value) =>
      RealmObjectBase.set(this, 'defaultCode', value);

  @override
  String? get barcode =>
      RealmObjectBase.get<String>(this, 'barcode') as String?;
  @override
  set barcode(String? value) => RealmObjectBase.set(this, 'barcode', value);

  @override
  num get standaredPrice =>
      RealmObjectBase.get<num>(this, 'standaredPrice') as num;
  @override
  set standaredPrice(num value) =>
      RealmObjectBase.set(this, 'standaredPrice', value);

  @override
  num get listPrice => RealmObjectBase.get<num>(this, 'listPrice') as num;
  @override
  set listPrice(num value) => RealmObjectBase.set(this, 'listPrice', value);

  @override
  String? get uomId => RealmObjectBase.get<String>(this, 'uomId') as String?;
  @override
  set uomId(String? value) => RealmObjectBase.set(this, 'uomId', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  bool? get saleOk => RealmObjectBase.get<bool>(this, 'saleOk') as bool?;
  @override
  set saleOk(bool? value) => RealmObjectBase.set(this, 'saleOk', value);

  @override
  String? get saleDescription =>
      RealmObjectBase.get<String>(this, 'saleDescription') as String?;
  @override
  set saleDescription(String? value) =>
      RealmObjectBase.set(this, 'saleDescription', value);

  @override
  String get companyId =>
      RealmObjectBase.get<String>(this, 'companyId') as String;
  @override
  set companyId(String value) => RealmObjectBase.set(this, 'companyId', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  RealmList<String?> get taxIds =>
      RealmObjectBase.get<String?>(this, 'taxIds') as RealmList<String?>;
  @override
  set taxIds(covariant RealmList<String?> value) =>
      throw RealmUnsupportedSetError();

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  String? get printName =>
      RealmObjectBase.get<String>(this, 'printName') as String?;
  @override
  set printName(String? value) => RealmObjectBase.set(this, 'printName', value);

  @override
  bool? get printerOverride =>
      RealmObjectBase.get<bool>(this, 'printerOverride') as bool?;
  @override
  set printerOverride(bool? value) =>
      RealmObjectBase.set(this, 'printerOverride', value);

  @override
  String? get printer =>
      RealmObjectBase.get<String>(this, 'printer') as String?;
  @override
  set printer(String? value) => RealmObjectBase.set(this, 'printer', value);

  @override
  String? get categoryId =>
      RealmObjectBase.get<String>(this, 'categoryId') as String?;
  @override
  set categoryId(String? value) =>
      RealmObjectBase.set(this, 'categoryId', value);

  @override
  bool? get isActive => RealmObjectBase.get<bool>(this, 'isActive') as bool?;
  @override
  set isActive(bool? value) => RealmObjectBase.set(this, 'isActive', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmMap<num> get pricelist =>
      RealmObjectBase.get<num>(this, 'pricelist') as RealmMap<num>;
  @override
  set pricelist(covariant RealmMap<num> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
  @override
  set active(bool value) => RealmObjectBase.set(this, 'active', value);

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObjectBase.getChanges<Product>(this);

  @override
  Stream<RealmObjectChanges<Product>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Product>(this, keyPaths);

  @override
  Product freeze() => RealmObjectBase.freezeObject<Product>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
      'defaultCode': defaultCode.toEJson(),
      'barcode': barcode.toEJson(),
      'standaredPrice': standaredPrice.toEJson(),
      'listPrice': listPrice.toEJson(),
      'uomId': uomId.toEJson(),
      'type': type.toEJson(),
      'saleOk': saleOk.toEJson(),
      'saleDescription': saleDescription.toEJson(),
      'companyId': companyId.toEJson(),
      'image': image.toEJson(),
      'taxIds': taxIds.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'note': note.toEJson(),
      'printName': printName.toEJson(),
      'printerOverride': printerOverride.toEJson(),
      'printer': printer.toEJson(),
      'categoryId': categoryId.toEJson(),
      'isActive': isActive.toEJson(),
      'tags': tags.toEJson(),
      'pricelist': pricelist.toEJson(),
      'active': active.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
        'defaultCode': EJsonValue defaultCode,
        'standaredPrice': EJsonValue standaredPrice,
        'listPrice': EJsonValue listPrice,
        'companyId': EJsonValue companyId,
        'image': EJsonValue image,
        'updatedAt': EJsonValue updatedAt,
        'active': EJsonValue active,
      } =>
        Product(
          fromEJson(name),
          fromEJson(defaultCode),
          fromEJson(standaredPrice),
          fromEJson(listPrice),
          fromEJson(companyId),
          fromEJson(image),
          fromEJson(updatedAt),
          fromEJson(active),
          barcode: fromEJson(ejson['barcode']),
          uomId: fromEJson(ejson['uomId']),
          type: fromEJson(ejson['type']),
          saleOk: fromEJson(ejson['saleOk']),
          saleDescription: fromEJson(ejson['saleDescription']),
          taxIds: fromEJson(ejson['taxIds']),
          note: fromEJson(ejson['note']),
          printName: fromEJson(ejson['printName']),
          printerOverride: fromEJson(ejson['printerOverride']),
          printer: fromEJson(ejson['printer']),
          categoryId: fromEJson(ejson['categoryId']),
          isActive: fromEJson(ejson['isActive']),
          tags: fromEJson(ejson['tags']),
          pricelist: fromEJson(ejson['pricelist']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('defaultCode', RealmPropertyType.string),
      SchemaProperty('barcode', RealmPropertyType.string, optional: true),
      SchemaProperty('standaredPrice', RealmPropertyType.double),
      SchemaProperty('listPrice', RealmPropertyType.double),
      SchemaProperty('uomId', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('saleOk', RealmPropertyType.bool, optional: true),
      SchemaProperty('saleDescription', RealmPropertyType.string,
          optional: true),
      SchemaProperty('companyId', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('taxIds', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('printName', RealmPropertyType.string, optional: true),
      SchemaProperty('printerOverride', RealmPropertyType.bool, optional: true),
      SchemaProperty('printer', RealmPropertyType.string, optional: true),
      SchemaProperty('categoryId', RealmPropertyType.string, optional: true),
      SchemaProperty('isActive', RealmPropertyType.bool, optional: true),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('pricelist', RealmPropertyType.double,
          collectionType: RealmCollectionType.map),
      SchemaProperty('active', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
