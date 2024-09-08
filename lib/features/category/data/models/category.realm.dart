// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String name,
    String categoryPath, {
    Category? parentCategory,
    Iterable<Category> children = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'categoryPath', categoryPath);
    RealmObjectBase.set(this, 'parentCategory', parentCategory);
    RealmObjectBase.set<RealmList<Category>>(
        this, 'children', RealmList<Category>(children));
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
  String get categoryPath =>
      RealmObjectBase.get<String>(this, 'categoryPath') as String;
  @override
  set categoryPath(String value) =>
      RealmObjectBase.set(this, 'categoryPath', value);

  @override
  Category? get parentCategory =>
      RealmObjectBase.get<Category>(this, 'parentCategory') as Category?;
  @override
  set parentCategory(covariant Category? value) =>
      RealmObjectBase.set(this, 'parentCategory', value);

  @override
  RealmList<Category> get children =>
      RealmObjectBase.get<Category>(this, 'children') as RealmList<Category>;
  @override
  set children(covariant RealmList<Category> value) =>
      throw RealmUnsupportedSetError();

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
      'categoryPath': categoryPath.toEJson(),
      'parentCategory': parentCategory.toEJson(),
      'children': children.toEJson(),
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
          children: fromEJson(ejson['children']),
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
      SchemaProperty('categoryPath', RealmPropertyType.string),
      SchemaProperty('parentCategory', RealmPropertyType.object,
          optional: true, linkTarget: 'Category'),
      SchemaProperty('children', RealmPropertyType.object,
          linkTarget: 'Category', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
