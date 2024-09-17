// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_related.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductVariantRealm extends _ProductVariantRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductVariantRealm(
    ObjectId id,
    String companyId,
    String defaultCode,
    num listPrice,
    String sku,
    num stock, {
    ProductTemplateRealm? productTemplate,
    String? barcode,
    String? combinationIndex,
    Map<String, String> attributes = const {},
    Map<String, num> pricelist = const {},
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'productTemplate', productTemplate);
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

  ProductVariantRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ProductTemplateRealm? get productTemplate =>
      RealmObjectBase.get<ProductTemplateRealm>(this, 'productTemplate')
          as ProductTemplateRealm?;
  @override
  set productTemplate(covariant ProductTemplateRealm? value) =>
      RealmObjectBase.set(this, 'productTemplate', value);

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
  Stream<RealmObjectChanges<ProductVariantRealm>> get changes =>
      RealmObjectBase.getChanges<ProductVariantRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductVariantRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductVariantRealm>(this, keyPaths);

  @override
  ProductVariantRealm freeze() =>
      RealmObjectBase.freezeObject<ProductVariantRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'productTemplate': productTemplate.toEJson(),
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

  static EJsonValue _toEJson(ProductVariantRealm value) => value.toEJson();
  static ProductVariantRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'companyId': EJsonValue companyId,
        'defaultCode': EJsonValue defaultCode,
        'listPrice': EJsonValue listPrice,
        'sku': EJsonValue sku,
        'stock': EJsonValue stock,
      } =>
        ProductVariantRealm(
          fromEJson(id),
          fromEJson(companyId),
          fromEJson(defaultCode),
          fromEJson(listPrice),
          fromEJson(sku),
          fromEJson(stock),
          productTemplate: fromEJson(ejson['productTemplate']),
          barcode: fromEJson(ejson['barcode']),
          combinationIndex: fromEJson(ejson['combinationIndex']),
          attributes: fromEJson(ejson['attributes']),
          pricelist: fromEJson(ejson['pricelist']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductVariantRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ProductVariantRealm, 'ProductVariantRealm', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('productTemplate', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductTemplateRealm'),
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

class ProductTemplateRealm extends _ProductTemplateRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductTemplateRealm(
    ObjectId id,
    String name,
    String defaultCode,
    num standaredPrice,
    num listPrice,
    String companyId,
    DateTime updatedAt,
    bool active, {
    CategoryRealm? category,
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
    RealmObjectBase.set(this, 'category', category);
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

  ProductTemplateRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  CategoryRealm? get category =>
      RealmObjectBase.get<CategoryRealm>(this, 'category') as CategoryRealm?;
  @override
  set category(covariant CategoryRealm? value) =>
      RealmObjectBase.set(this, 'category', value);

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
  Stream<RealmObjectChanges<ProductTemplateRealm>> get changes =>
      RealmObjectBase.getChanges<ProductTemplateRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductTemplateRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductTemplateRealm>(this, keyPaths);

  @override
  ProductTemplateRealm freeze() =>
      RealmObjectBase.freezeObject<ProductTemplateRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'category': category.toEJson(),
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

  static EJsonValue _toEJson(ProductTemplateRealm value) => value.toEJson();
  static ProductTemplateRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'defaultCode': EJsonValue defaultCode,
        'standaredPrice': EJsonValue standaredPrice,
        'listPrice': EJsonValue listPrice,
        'companyId': EJsonValue companyId,
        'updatedAt': EJsonValue updatedAt,
        'active': EJsonValue active,
      } =>
        ProductTemplateRealm(
          fromEJson(id),
          fromEJson(name),
          fromEJson(defaultCode),
          fromEJson(standaredPrice),
          fromEJson(listPrice),
          fromEJson(companyId),
          fromEJson(updatedAt),
          fromEJson(active),
          category: fromEJson(ejson['category']),
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
    RealmObjectBase.registerFactory(ProductTemplateRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ProductTemplateRealm, 'ProductTemplateRealm', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'CategoryRealm'),
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

class CategoryRealm extends _CategoryRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  CategoryRealm(
    ObjectId id,
    String name,
    String categoryPath, {
    CategoryRealm? parentCategory,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'parentCategory', parentCategory);
    RealmObjectBase.set(this, 'categoryPath', categoryPath);
  }

  CategoryRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  CategoryRealm? get parentCategory =>
      RealmObjectBase.get<CategoryRealm>(this, 'parentCategory')
          as CategoryRealm?;
  @override
  set parentCategory(covariant CategoryRealm? value) =>
      RealmObjectBase.set(this, 'parentCategory', value);

  @override
  String get categoryPath =>
      RealmObjectBase.get<String>(this, 'categoryPath') as String;
  @override
  set categoryPath(String value) =>
      RealmObjectBase.set(this, 'categoryPath', value);

  @override
  Stream<RealmObjectChanges<CategoryRealm>> get changes =>
      RealmObjectBase.getChanges<CategoryRealm>(this);

  @override
  Stream<RealmObjectChanges<CategoryRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CategoryRealm>(this, keyPaths);

  @override
  CategoryRealm freeze() => RealmObjectBase.freezeObject<CategoryRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'parentCategory': parentCategory.toEJson(),
      'categoryPath': categoryPath.toEJson(),
    };
  }

  static EJsonValue _toEJson(CategoryRealm value) => value.toEJson();
  static CategoryRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'categoryPath': EJsonValue categoryPath,
      } =>
        CategoryRealm(
          fromEJson(id),
          fromEJson(name),
          fromEJson(categoryPath),
          parentCategory: fromEJson(ejson['parentCategory']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CategoryRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, CategoryRealm, 'CategoryRealm', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('parentCategory', RealmPropertyType.object,
          optional: true, linkTarget: 'CategoryRealm'),
      SchemaProperty('categoryPath', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class VariantRealm extends _VariantRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  VariantRealm(
    String id,
    String defaultCode,
    String barcode,
    num qtyAvailable, {
    Iterable<String?> sellerIds = const [],
    Iterable<VariantAttributesRealm> attributes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'defaultCode', defaultCode);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'qtyAvailable', qtyAvailable);
    RealmObjectBase.set<RealmList<String?>>(
        this, 'sellerIds', RealmList<String?>(sellerIds));
    RealmObjectBase.set<RealmList<VariantAttributesRealm>>(
        this, 'attributes', RealmList<VariantAttributesRealm>(attributes));
  }

  VariantRealm._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get defaultCode =>
      RealmObjectBase.get<String>(this, 'defaultCode') as String;
  @override
  set defaultCode(String value) =>
      RealmObjectBase.set(this, 'defaultCode', value);

  @override
  String get barcode => RealmObjectBase.get<String>(this, 'barcode') as String;
  @override
  set barcode(String value) => RealmObjectBase.set(this, 'barcode', value);

  @override
  num get qtyAvailable => RealmObjectBase.get<num>(this, 'qtyAvailable') as num;
  @override
  set qtyAvailable(num value) =>
      RealmObjectBase.set(this, 'qtyAvailable', value);

  @override
  RealmList<String?> get sellerIds =>
      RealmObjectBase.get<String?>(this, 'sellerIds') as RealmList<String?>;
  @override
  set sellerIds(covariant RealmList<String?> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<VariantAttributesRealm> get attributes =>
      RealmObjectBase.get<VariantAttributesRealm>(this, 'attributes')
          as RealmList<VariantAttributesRealm>;
  @override
  set attributes(covariant RealmList<VariantAttributesRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<VariantRealm>> get changes =>
      RealmObjectBase.getChanges<VariantRealm>(this);

  @override
  Stream<RealmObjectChanges<VariantRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<VariantRealm>(this, keyPaths);

  @override
  VariantRealm freeze() => RealmObjectBase.freezeObject<VariantRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'defaultCode': defaultCode.toEJson(),
      'barcode': barcode.toEJson(),
      'qtyAvailable': qtyAvailable.toEJson(),
      'sellerIds': sellerIds.toEJson(),
      'attributes': attributes.toEJson(),
    };
  }

  static EJsonValue _toEJson(VariantRealm value) => value.toEJson();
  static VariantRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'defaultCode': EJsonValue defaultCode,
        'barcode': EJsonValue barcode,
        'qtyAvailable': EJsonValue qtyAvailable,
      } =>
        VariantRealm(
          fromEJson(id),
          fromEJson(defaultCode),
          fromEJson(barcode),
          fromEJson(qtyAvailable),
          sellerIds: fromEJson(ejson['sellerIds']),
          attributes: fromEJson(ejson['attributes']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(VariantRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, VariantRealm, 'VariantRealm', [
      SchemaProperty('id', RealmPropertyType.string),
      SchemaProperty('defaultCode', RealmPropertyType.string),
      SchemaProperty('barcode', RealmPropertyType.string),
      SchemaProperty('qtyAvailable', RealmPropertyType.double),
      SchemaProperty('sellerIds', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('attributes', RealmPropertyType.object,
          linkTarget: 'VariantAttributesRealm',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class VariantAttributesRealm extends _VariantAttributesRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  VariantAttributesRealm(
    String someThing,
  ) {
    RealmObjectBase.set(this, 'someThing', someThing);
  }

  VariantAttributesRealm._();

  @override
  String get someThing =>
      RealmObjectBase.get<String>(this, 'someThing') as String;
  @override
  set someThing(String value) => RealmObjectBase.set(this, 'someThing', value);

  @override
  Stream<RealmObjectChanges<VariantAttributesRealm>> get changes =>
      RealmObjectBase.getChanges<VariantAttributesRealm>(this);

  @override
  Stream<RealmObjectChanges<VariantAttributesRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<VariantAttributesRealm>(this, keyPaths);

  @override
  VariantAttributesRealm freeze() =>
      RealmObjectBase.freezeObject<VariantAttributesRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'someThing': someThing.toEJson(),
    };
  }

  static EJsonValue _toEJson(VariantAttributesRealm value) => value.toEJson();
  static VariantAttributesRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'someThing': EJsonValue someThing,
      } =>
        VariantAttributesRealm(
          fromEJson(someThing),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(VariantAttributesRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, VariantAttributesRealm,
        'VariantAttributesRealm', [
      SchemaProperty('someThing', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
