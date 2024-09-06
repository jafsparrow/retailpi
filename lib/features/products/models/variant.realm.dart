// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
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
