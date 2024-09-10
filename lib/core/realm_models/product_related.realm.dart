// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_related.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  Product(
    ObjectId id,
    String companyId,
    String defaultCode,
    num listPrice,
    String sku,
    num stock, {
    ProductTemplate? productTemplate,
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

  Product._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ProductTemplate? get productTemplate =>
      RealmObjectBase.get<ProductTemplate>(this, 'productTemplate')
          as ProductTemplate?;
  @override
  set productTemplate(covariant ProductTemplate? value) =>
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

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
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
        Product(
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
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('productTemplate', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductTemplate'),
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

class ProductTemplate extends _ProductTemplate
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductTemplate(
    ObjectId id,
    String name,
    String defaultCode,
    num standaredPrice,
    num listPrice,
    String companyId,
    DateTime updatedAt,
    bool active, {
    Category? category,
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
  Category? get category =>
      RealmObjectBase.get<Category>(this, 'category') as Category?;
  @override
  set category(covariant Category? value) =>
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

  static EJsonValue _toEJson(ProductTemplate value) => value.toEJson();
  static ProductTemplate _fromEJson(EJsonValue ejson) {
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
        ProductTemplate(
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
    RealmObjectBase.registerFactory(ProductTemplate._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ProductTemplate, 'ProductTemplate', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'Category'),
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

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String name,
    String categoryPath, {
    Category? parentCategory,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'parentCategory', parentCategory);
    RealmObjectBase.set(this, 'categoryPath', categoryPath);
  }

  Category._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Category? get parentCategory =>
      RealmObjectBase.get<Category>(this, 'parentCategory') as Category?;
  @override
  set parentCategory(covariant Category? value) =>
      RealmObjectBase.set(this, 'parentCategory', value);

  @override
  String get categoryPath =>
      RealmObjectBase.get<String>(this, 'categoryPath') as String;
  @override
  set categoryPath(String value) =>
      RealmObjectBase.set(this, 'categoryPath', value);

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Stream<RealmObjectChanges<Category>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Category>(this, keyPaths);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'parentCategory': parentCategory.toEJson(),
      'categoryPath': categoryPath.toEJson(),
    };
  }

  static EJsonValue _toEJson(Category value) => value.toEJson();
  static Category _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'categoryPath': EJsonValue categoryPath,
      } =>
        Category(
          fromEJson(id),
          fromEJson(name),
          fromEJson(categoryPath),
          parentCategory: fromEJson(ejson['parentCategory']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Category._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Category, 'Category', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('parentCategory', RealmPropertyType.object,
          optional: true, linkTarget: 'Category'),
      SchemaProperty('categoryPath', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Variant extends _Variant with RealmEntity, RealmObjectBase, RealmObject {
  Variant(
    String id,
    String defaultCode,
    String barcode,
    num qtyAvailable, {
    Iterable<String?> sellerIds = const [],
    Iterable<VariantAttributes> attributes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'defaultCode', defaultCode);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'qtyAvailable', qtyAvailable);
    RealmObjectBase.set<RealmList<String?>>(
        this, 'sellerIds', RealmList<String?>(sellerIds));
    RealmObjectBase.set<RealmList<VariantAttributes>>(
        this, 'attributes', RealmList<VariantAttributes>(attributes));
  }

  Variant._();

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
  RealmList<VariantAttributes> get attributes =>
      RealmObjectBase.get<VariantAttributes>(this, 'attributes')
          as RealmList<VariantAttributes>;
  @override
  set attributes(covariant RealmList<VariantAttributes> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Variant>> get changes =>
      RealmObjectBase.getChanges<Variant>(this);

  @override
  Stream<RealmObjectChanges<Variant>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Variant>(this, keyPaths);

  @override
  Variant freeze() => RealmObjectBase.freezeObject<Variant>(this);

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

  static EJsonValue _toEJson(Variant value) => value.toEJson();
  static Variant _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'defaultCode': EJsonValue defaultCode,
        'barcode': EJsonValue barcode,
        'qtyAvailable': EJsonValue qtyAvailable,
      } =>
        Variant(
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
    RealmObjectBase.registerFactory(Variant._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Variant, 'Variant', [
      SchemaProperty('id', RealmPropertyType.string),
      SchemaProperty('defaultCode', RealmPropertyType.string),
      SchemaProperty('barcode', RealmPropertyType.string),
      SchemaProperty('qtyAvailable', RealmPropertyType.double),
      SchemaProperty('sellerIds', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('attributes', RealmPropertyType.object,
          linkTarget: 'VariantAttributes',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class VariantAttributes extends _VariantAttributes
    with RealmEntity, RealmObjectBase, RealmObject {
  VariantAttributes(
    String someThing,
  ) {
    RealmObjectBase.set(this, 'someThing', someThing);
  }

  VariantAttributes._();

  @override
  String get someThing =>
      RealmObjectBase.get<String>(this, 'someThing') as String;
  @override
  set someThing(String value) => RealmObjectBase.set(this, 'someThing', value);

  @override
  Stream<RealmObjectChanges<VariantAttributes>> get changes =>
      RealmObjectBase.getChanges<VariantAttributes>(this);

  @override
  Stream<RealmObjectChanges<VariantAttributes>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<VariantAttributes>(this, keyPaths);

  @override
  VariantAttributes freeze() =>
      RealmObjectBase.freezeObject<VariantAttributes>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'someThing': someThing.toEJson(),
    };
  }

  static EJsonValue _toEJson(VariantAttributes value) => value.toEJson();
  static VariantAttributes _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'someThing': EJsonValue someThing,
      } =>
        VariantAttributes(
          fromEJson(someThing),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(VariantAttributes._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, VariantAttributes, 'VariantAttributes', [
      SchemaProperty('someThing', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
