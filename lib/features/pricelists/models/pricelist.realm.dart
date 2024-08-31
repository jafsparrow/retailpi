// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricelist.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PriceList extends _PriceList
    with RealmEntity, RealmObjectBase, RealmObject {
  PriceList(
    String title,
  ) {
    RealmObjectBase.set(this, 'title', title);
  }

  PriceList._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<PriceList>> get changes =>
      RealmObjectBase.getChanges<PriceList>(this);

  @override
  Stream<RealmObjectChanges<PriceList>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PriceList>(this, keyPaths);

  @override
  PriceList freeze() => RealmObjectBase.freezeObject<PriceList>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'title': title.toEJson(),
    };
  }

  static EJsonValue _toEJson(PriceList value) => value.toEJson();
  static PriceList _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'title': EJsonValue title,
      } =>
        PriceList(
          fromEJson(title),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PriceList._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, PriceList, 'PriceList', [
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
