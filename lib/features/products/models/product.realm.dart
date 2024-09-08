// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductTemplate extends _ProductTemplate
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductTemplate(
    ObjectId id,
    String name,
    ObjectId categoryId,
    String defaultCode,
    num standaredPrice,
    num listPrice,
    String companyId,
    DateTime updatedAt,
    bool active, {
    String? uomId,
    String? type,
    bool? saleOk,
    String? saleDescription,
    String? image,
    Iterable<String?> taxIds = const [],
    String? note,
    String? printName,
    bool? printerOverride,
    String? printer,
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'categoryId', categoryId);
    RealmObjectBase.set(this, 'defaultCode', defaultCode);
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
    RealmObjectBase.set(this, 'active', active);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
  }

  ProductTemplate._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  ObjectId get categoryId =>
      RealmObjectBase.get<ObjectId>(this, 'categoryId') as ObjectId;
  @override
  set categoryId(ObjectId value) =>
      RealmObjectBase.set(this, 'categoryId', value);

  @override
  String get defaultCode =>
      RealmObjectBase.get<String>(this, 'defaultCode') as String;
  @override
  set defaultCode(String value) =>
      RealmObjectBase.set(this, 'defaultCode', value);

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
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

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
  bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
  @override
  set active(bool value) => RealmObjectBase.set(this, 'active', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ProductTemplate>> get changes =>
      RealmObjectBase.getChanges<ProductTemplate>(this);

  @override
  Stream<RealmObjectChanges<ProductTemplate>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductTemplate>(this, keyPaths);

  @override
  ProductTemplate freeze() =>
      RealmObjectBase.freezeObject<ProductTemplate>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'categoryId': categoryId.toEJson(),
      'defaultCode': defaultCode.toEJson(),
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
      'active': active.toEJson(),
      'tags': tags.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductTemplate value) => value.toEJson();
  static ProductTemplate _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'categoryId': EJsonValue categoryId,
        'defaultCode': EJsonValue defaultCode,
        'standaredPrice': EJsonValue standaredPrice,
        'listPrice': EJsonValue listPrice,
        'companyId': EJsonValue companyId,
        'updatedAt': EJsonValue updatedAt,
        'active': EJsonValue active,
      } =>
        ProductTemplate(
          fromEJson(id),
          fromEJson(name),
          fromEJson(categoryId),
          fromEJson(defaultCode),
          fromEJson(standaredPrice),
          fromEJson(listPrice),
          fromEJson(companyId),
          fromEJson(updatedAt),
          fromEJson(active),
          uomId: fromEJson(ejson['uomId']),
          type: fromEJson(ejson['type']),
          saleOk: fromEJson(ejson['saleOk']),
          saleDescription: fromEJson(ejson['saleDescription']),
          image: fromEJson(ejson['image']),
          taxIds: fromEJson(ejson['taxIds']),
          note: fromEJson(ejson['note']),
          printName: fromEJson(ejson['printName']),
          printerOverride: fromEJson(ejson['printerOverride']),
          printer: fromEJson(ejson['printer']),
          tags: fromEJson(ejson['tags']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductTemplate._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ProductTemplate, 'ProductTemplate', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('categoryId', RealmPropertyType.objectid),
      SchemaProperty('defaultCode', RealmPropertyType.string),
      SchemaProperty('standaredPrice', RealmPropertyType.double),
      SchemaProperty('listPrice', RealmPropertyType.double),
      SchemaProperty('uomId', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('saleOk', RealmPropertyType.bool, optional: true),
      SchemaProperty('saleDescription', RealmPropertyType.string,
          optional: true),
      SchemaProperty('companyId', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
      SchemaProperty('taxIds', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('printName', RealmPropertyType.string, optional: true),
      SchemaProperty('printerOverride', RealmPropertyType.bool, optional: true),
      SchemaProperty('printer', RealmPropertyType.string, optional: true),
      SchemaProperty('active', RealmPropertyType.bool),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  Product(
    ObjectId id,
    ObjectId templateId,
    String companyId,
    String defaultCode,
    num listPrice,
    String sku,
    num stock, {
    String? barcode,
    String? combinationIndex,
    Map<String, String> attributes = const {},
    Map<String, num> pricelist = const {},
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'templateId', templateId);
    RealmObjectBase.set(this, 'companyId', companyId);
    RealmObjectBase.set(this, 'defaultCode', defaultCode);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'combinationIndex', combinationIndex);
    RealmObjectBase.set<RealmMap<String>>(
        this, 'attributes', RealmMap<String>(attributes));
    RealmObjectBase.set(this, 'listPrice', listPrice);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'stock', stock);
    RealmObjectBase.set<RealmMap<num>>(
        this, 'pricelist', RealmMap<num>(pricelist));
  }

  Product._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ObjectId get templateId =>
      RealmObjectBase.get<ObjectId>(this, 'templateId') as ObjectId;
  @override
  set templateId(ObjectId value) =>
      RealmObjectBase.set(this, 'templateId', value);

  @override
  String get companyId =>
      RealmObjectBase.get<String>(this, 'companyId') as String;
  @override
  set companyId(String value) => RealmObjectBase.set(this, 'companyId', value);

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
  String? get combinationIndex =>
      RealmObjectBase.get<String>(this, 'combinationIndex') as String?;
  @override
  set combinationIndex(String? value) =>
      RealmObjectBase.set(this, 'combinationIndex', value);

  @override
  RealmMap<String> get attributes =>
      RealmObjectBase.get<String>(this, 'attributes') as RealmMap<String>;
  @override
  set attributes(covariant RealmMap<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  num get listPrice => RealmObjectBase.get<num>(this, 'listPrice') as num;
  @override
  set listPrice(num value) => RealmObjectBase.set(this, 'listPrice', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  num get stock => RealmObjectBase.get<num>(this, 'stock') as num;
  @override
  set stock(num value) => RealmObjectBase.set(this, 'stock', value);

  @override
  RealmMap<num> get pricelist =>
      RealmObjectBase.get<num>(this, 'pricelist') as RealmMap<num>;
  @override
  set pricelist(covariant RealmMap<num> value) =>
      throw RealmUnsupportedSetError();

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
      'id': id.toEJson(),
      'templateId': templateId.toEJson(),
      'companyId': companyId.toEJson(),
      'defaultCode': defaultCode.toEJson(),
      'barcode': barcode.toEJson(),
      'combinationIndex': combinationIndex.toEJson(),
      'attributes': attributes.toEJson(),
      'listPrice': listPrice.toEJson(),
      'sku': sku.toEJson(),
      'stock': stock.toEJson(),
      'pricelist': pricelist.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'templateId': EJsonValue templateId,
        'companyId': EJsonValue companyId,
        'defaultCode': EJsonValue defaultCode,
        'listPrice': EJsonValue listPrice,
        'sku': EJsonValue sku,
        'stock': EJsonValue stock,
      } =>
        Product(
          fromEJson(id),
          fromEJson(templateId),
          fromEJson(companyId),
          fromEJson(defaultCode),
          fromEJson(listPrice),
          fromEJson(sku),
          fromEJson(stock),
          barcode: fromEJson(ejson['barcode']),
          combinationIndex: fromEJson(ejson['combinationIndex']),
          attributes: fromEJson(ejson['attributes']),
          pricelist: fromEJson(ejson['pricelist']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('templateId', RealmPropertyType.objectid),
      SchemaProperty('companyId', RealmPropertyType.string),
      SchemaProperty('defaultCode', RealmPropertyType.string),
      SchemaProperty('barcode', RealmPropertyType.string, optional: true),
      SchemaProperty('combinationIndex', RealmPropertyType.string,
          optional: true),
      SchemaProperty('attributes', RealmPropertyType.string,
          collectionType: RealmCollectionType.map),
      SchemaProperty('listPrice', RealmPropertyType.double),
      SchemaProperty('sku', RealmPropertyType.string),
      SchemaProperty('stock', RealmPropertyType.double),
      SchemaProperty('pricelist', RealmPropertyType.double,
          collectionType: RealmCollectionType.map),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
