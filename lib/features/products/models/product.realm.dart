// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  Product(
    String name,
    String code,
    num cost,
    num price,
    DateTime updatedAt, {
    String? note,
    String? printName,
    bool? printerOverride,
    String? printer,
    String? categoryTag,
    bool? isActive,
    Iterable<String> tags = const [],
    Map<String, num> pricelist = const {},
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'cost', cost);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'printName', printName);
    RealmObjectBase.set(this, 'printerOverride', printerOverride);
    RealmObjectBase.set(this, 'printer', printer);
    RealmObjectBase.set(this, 'categoryTag', categoryTag);
    RealmObjectBase.set(this, 'isActive', isActive);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set<RealmMap<num>>(
        this, 'pricelist', RealmMap<num>(pricelist));
  }

  Product._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;
  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  num get cost => RealmObjectBase.get<num>(this, 'cost') as num;
  @override
  set cost(num value) => RealmObjectBase.set(this, 'cost', value);

  @override
  num get price => RealmObjectBase.get<num>(this, 'price') as num;
  @override
  set price(num value) => RealmObjectBase.set(this, 'price', value);

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
  String? get categoryTag =>
      RealmObjectBase.get<String>(this, 'categoryTag') as String?;
  @override
  set categoryTag(String? value) =>
      RealmObjectBase.set(this, 'categoryTag', value);

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
      'code': code.toEJson(),
      'cost': cost.toEJson(),
      'price': price.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'note': note.toEJson(),
      'printName': printName.toEJson(),
      'printerOverride': printerOverride.toEJson(),
      'printer': printer.toEJson(),
      'categoryTag': categoryTag.toEJson(),
      'isActive': isActive.toEJson(),
      'tags': tags.toEJson(),
      'pricelist': pricelist.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
        'code': EJsonValue code,
        'cost': EJsonValue cost,
        'price': EJsonValue price,
        'updatedAt': EJsonValue updatedAt,
      } =>
        Product(
          fromEJson(name),
          fromEJson(code),
          fromEJson(cost),
          fromEJson(price),
          fromEJson(updatedAt),
          note: fromEJson(ejson['note']),
          printName: fromEJson(ejson['printName']),
          printerOverride: fromEJson(ejson['printerOverride']),
          printer: fromEJson(ejson['printer']),
          categoryTag: fromEJson(ejson['categoryTag']),
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
      SchemaProperty('code', RealmPropertyType.string),
      SchemaProperty('cost', RealmPropertyType.double),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('printName', RealmPropertyType.string, optional: true),
      SchemaProperty('printerOverride', RealmPropertyType.bool, optional: true),
      SchemaProperty('printer', RealmPropertyType.string, optional: true),
      SchemaProperty('categoryTag', RealmPropertyType.string, optional: true),
      SchemaProperty('isActive', RealmPropertyType.bool, optional: true),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('pricelist', RealmPropertyType.double,
          collectionType: RealmCollectionType.map),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
