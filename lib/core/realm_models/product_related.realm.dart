// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'product_related.dart';

// // **************************************************************************
// // RealmObjectGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// class ProductVariantRealm extends _ProductVariantRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   ProductVariantRealm(
//     ObjectId id,
//     String companyId,
//     String defaultCode,
//     num listPrice,
//     String sku,
//     num stock, {
//     ProductTemplateRealm? productTemplate,
//     String? barcode,
//     String? combinationIndex,
//     Map<String, String> attributes = const {},
//     String? batchNumber,
//     DateTime? expiryDate,
//     DateTime? productionDate,
//     String? mainImage,
//     Iterable<String> scrollImages = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'productTemplate', productTemplate);
//     RealmObjectBase.set(this, 'companyId', companyId);
//     RealmObjectBase.set(this, 'defaultCode', defaultCode);
//     RealmObjectBase.set(this, 'barcode', barcode);
//     RealmObjectBase.set(this, 'combinationIndex', combinationIndex);
//     RealmObjectBase.set<RealmMap<String>>(
//         this, 'attributes', RealmMap<String>(attributes));
//     RealmObjectBase.set(this, 'listPrice', listPrice);
//     RealmObjectBase.set(this, 'sku', sku);
//     RealmObjectBase.set(this, 'stock', stock);
//     RealmObjectBase.set(this, 'batchNumber', batchNumber);
//     RealmObjectBase.set(this, 'expiryDate', expiryDate);
//     RealmObjectBase.set(this, 'productionDate', productionDate);
//     RealmObjectBase.set(this, 'mainImage', mainImage);
//     RealmObjectBase.set<RealmList<String>>(
//         this, 'scrollImages', RealmList<String>(scrollImages));
//   }

//   ProductVariantRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   ProductTemplateRealm? get productTemplate =>
//       RealmObjectBase.get<ProductTemplateRealm>(this, 'productTemplate')
//           as ProductTemplateRealm?;
//   @override
//   set productTemplate(covariant ProductTemplateRealm? value) =>
//       RealmObjectBase.set(this, 'productTemplate', value);

//   @override
//   String get companyId =>
//       RealmObjectBase.get<String>(this, 'companyId') as String;
//   @override
//   set companyId(String value) => RealmObjectBase.set(this, 'companyId', value);

//   @override
//   String get defaultCode =>
//       RealmObjectBase.get<String>(this, 'defaultCode') as String;
//   @override
//   set defaultCode(String value) =>
//       RealmObjectBase.set(this, 'defaultCode', value);

//   @override
//   String? get barcode =>
//       RealmObjectBase.get<String>(this, 'barcode') as String?;
//   @override
//   set barcode(String? value) => RealmObjectBase.set(this, 'barcode', value);

//   @override
//   String? get combinationIndex =>
//       RealmObjectBase.get<String>(this, 'combinationIndex') as String?;
//   @override
//   set combinationIndex(String? value) =>
//       RealmObjectBase.set(this, 'combinationIndex', value);

//   @override
//   RealmMap<String> get attributes =>
//       RealmObjectBase.get<String>(this, 'attributes') as RealmMap<String>;
//   @override
//   set attributes(covariant RealmMap<String> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   num get listPrice => RealmObjectBase.get<num>(this, 'listPrice') as num;
//   @override
//   set listPrice(num value) => RealmObjectBase.set(this, 'listPrice', value);

//   @override
//   String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
//   @override
//   set sku(String value) => RealmObjectBase.set(this, 'sku', value);

//   @override
//   num get stock => RealmObjectBase.get<num>(this, 'stock') as num;
//   @override
//   set stock(num value) => RealmObjectBase.set(this, 'stock', value);

//   @override
//   String? get batchNumber =>
//       RealmObjectBase.get<String>(this, 'batchNumber') as String?;
//   @override
//   set batchNumber(String? value) =>
//       RealmObjectBase.set(this, 'batchNumber', value);

//   @override
//   DateTime? get expiryDate =>
//       RealmObjectBase.get<DateTime>(this, 'expiryDate') as DateTime?;
//   @override
//   set expiryDate(DateTime? value) =>
//       RealmObjectBase.set(this, 'expiryDate', value);

//   @override
//   DateTime? get productionDate =>
//       RealmObjectBase.get<DateTime>(this, 'productionDate') as DateTime?;
//   @override
//   set productionDate(DateTime? value) =>
//       RealmObjectBase.set(this, 'productionDate', value);

//   @override
//   String? get mainImage =>
//       RealmObjectBase.get<String>(this, 'mainImage') as String?;
//   @override
//   set mainImage(String? value) => RealmObjectBase.set(this, 'mainImage', value);

//   @override
//   RealmList<String> get scrollImages =>
//       RealmObjectBase.get<String>(this, 'scrollImages') as RealmList<String>;
//   @override
//   set scrollImages(covariant RealmList<String> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<ProductVariantRealm>> get changes =>
//       RealmObjectBase.getChanges<ProductVariantRealm>(this);

//   @override
//   Stream<RealmObjectChanges<ProductVariantRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<ProductVariantRealm>(this, keyPaths);

//   @override
//   ProductVariantRealm freeze() =>
//       RealmObjectBase.freezeObject<ProductVariantRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'productTemplate': productTemplate.toEJson(),
//       'companyId': companyId.toEJson(),
//       'defaultCode': defaultCode.toEJson(),
//       'barcode': barcode.toEJson(),
//       'combinationIndex': combinationIndex.toEJson(),
//       'attributes': attributes.toEJson(),
//       'listPrice': listPrice.toEJson(),
//       'sku': sku.toEJson(),
//       'stock': stock.toEJson(),
//       'batchNumber': batchNumber.toEJson(),
//       'expiryDate': expiryDate.toEJson(),
//       'productionDate': productionDate.toEJson(),
//       'mainImage': mainImage.toEJson(),
//       'scrollImages': scrollImages.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(ProductVariantRealm value) => value.toEJson();
//   static ProductVariantRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'companyId': EJsonValue companyId,
//         'defaultCode': EJsonValue defaultCode,
//         'listPrice': EJsonValue listPrice,
//         'sku': EJsonValue sku,
//         'stock': EJsonValue stock,
//       } =>
//         ProductVariantRealm(
//           fromEJson(id),
//           fromEJson(companyId),
//           fromEJson(defaultCode),
//           fromEJson(listPrice),
//           fromEJson(sku),
//           fromEJson(stock),
//           productTemplate: fromEJson(ejson['productTemplate']),
//           barcode: fromEJson(ejson['barcode']),
//           combinationIndex: fromEJson(ejson['combinationIndex']),
//           attributes: fromEJson(ejson['attributes']),
//           batchNumber: fromEJson(ejson['batchNumber']),
//           expiryDate: fromEJson(ejson['expiryDate']),
//           productionDate: fromEJson(ejson['productionDate']),
//           mainImage: fromEJson(ejson['mainImage']),
//           scrollImages: fromEJson(ejson['scrollImages']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(ProductVariantRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, ProductVariantRealm, 'ProductVariantRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('productTemplate', RealmPropertyType.object,
//           optional: true, linkTarget: 'ProductTemplateRealm'),
//       SchemaProperty('companyId', RealmPropertyType.string),
//       SchemaProperty('defaultCode', RealmPropertyType.string),
//       SchemaProperty('barcode', RealmPropertyType.string, optional: true),
//       SchemaProperty('combinationIndex', RealmPropertyType.string,
//           optional: true),
//       SchemaProperty('attributes', RealmPropertyType.string,
//           collectionType: RealmCollectionType.map),
//       SchemaProperty('listPrice', RealmPropertyType.double),
//       SchemaProperty('sku', RealmPropertyType.string),
//       SchemaProperty('stock', RealmPropertyType.double),
//       SchemaProperty('batchNumber', RealmPropertyType.string, optional: true),
//       SchemaProperty('expiryDate', RealmPropertyType.timestamp, optional: true),
//       SchemaProperty('productionDate', RealmPropertyType.timestamp,
//           optional: true),
//       SchemaProperty('mainImage', RealmPropertyType.string, optional: true),
//       SchemaProperty('scrollImages', RealmPropertyType.string,
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class ProductTemplateRealm extends _ProductTemplateRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   ProductTemplateRealm(
//     ObjectId id,
//     String name,
//     String defaultCode,
//     num standaredPrice,
//     num listPrice,
//     String companyId,
//     DateTime updatedAt,
//     bool active, {
//     CategoryRealm? category,
//     PosCategoryRealm? posCategory,
//     UomRealm? saleUom,
//     UomRealm? purchaseUom,
//     String? type,
//     bool? saleOk,
//     String? saleDescription,
//     String? image,
//     Iterable<TaxRealm> salesTaxes = const [],
//     Iterable<TaxRealm> purchaseTaxes = const [],
//     Iterable<ChargeRealm> salesCharges = const [],
//     Iterable<ChargeRealm> purchaseCharges = const [],
//     String? note,
//     String? printName,
//     bool? printerOverride,
//     String? printer,
//     Iterable<String> tags = const [],
//     Iterable<String> searchMatchTerms = const [],
//     Iterable<PriceListRealm> pricelists = const [],
//     Iterable<ProductVariantRealm> variants = const [],
//     bool? availableInPos,
//     bool? toWeight,
//     String? createdUserId,
//     String? brand,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'category', category);
//     RealmObjectBase.set(this, 'posCategory', posCategory);
//     RealmObjectBase.set(this, 'defaultCode', defaultCode);
//     RealmObjectBase.set(this, 'standaredPrice', standaredPrice);
//     RealmObjectBase.set(this, 'listPrice', listPrice);
//     RealmObjectBase.set(this, 'saleUom', saleUom);
//     RealmObjectBase.set(this, 'purchaseUom', purchaseUom);
//     RealmObjectBase.set(this, 'type', type);
//     RealmObjectBase.set(this, 'saleOk', saleOk);
//     RealmObjectBase.set(this, 'saleDescription', saleDescription);
//     RealmObjectBase.set(this, 'companyId', companyId);
//     RealmObjectBase.set(this, 'image', image);
//     RealmObjectBase.set<RealmList<TaxRealm>>(
//         this, 'salesTaxes', RealmList<TaxRealm>(salesTaxes));
//     RealmObjectBase.set<RealmList<TaxRealm>>(
//         this, 'purchaseTaxes', RealmList<TaxRealm>(purchaseTaxes));
//     RealmObjectBase.set<RealmList<ChargeRealm>>(
//         this, 'salesCharges', RealmList<ChargeRealm>(salesCharges));
//     RealmObjectBase.set<RealmList<ChargeRealm>>(
//         this, 'purchaseCharges', RealmList<ChargeRealm>(purchaseCharges));
//     RealmObjectBase.set(this, 'updatedAt', updatedAt);
//     RealmObjectBase.set(this, 'note', note);
//     RealmObjectBase.set(this, 'printName', printName);
//     RealmObjectBase.set(this, 'printerOverride', printerOverride);
//     RealmObjectBase.set(this, 'printer', printer);
//     RealmObjectBase.set(this, 'active', active);
//     RealmObjectBase.set<RealmList<String>>(
//         this, 'tags', RealmList<String>(tags));
//     RealmObjectBase.set<RealmList<String>>(
//         this, 'searchMatchTerms', RealmList<String>(searchMatchTerms));
//     RealmObjectBase.set<RealmList<PriceListRealm>>(
//         this, 'pricelists', RealmList<PriceListRealm>(pricelists));
//     RealmObjectBase.set<RealmList<ProductVariantRealm>>(
//         this, 'variants', RealmList<ProductVariantRealm>(variants));
//     RealmObjectBase.set(this, 'availableInPos', availableInPos);
//     RealmObjectBase.set(this, 'toWeight', toWeight);
//     RealmObjectBase.set(this, 'createdUserId', createdUserId);
//     RealmObjectBase.set(this, 'brand', brand);
//   }

//   ProductTemplateRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   CategoryRealm? get category =>
//       RealmObjectBase.get<CategoryRealm>(this, 'category') as CategoryRealm?;
//   @override
//   set category(covariant CategoryRealm? value) =>
//       RealmObjectBase.set(this, 'category', value);

//   @override
//   PosCategoryRealm? get posCategory =>
//       RealmObjectBase.get<PosCategoryRealm>(this, 'posCategory')
//           as PosCategoryRealm?;
//   @override
//   set posCategory(covariant PosCategoryRealm? value) =>
//       RealmObjectBase.set(this, 'posCategory', value);

//   @override
//   String get defaultCode =>
//       RealmObjectBase.get<String>(this, 'defaultCode') as String;
//   @override
//   set defaultCode(String value) =>
//       RealmObjectBase.set(this, 'defaultCode', value);

//   @override
//   num get standaredPrice =>
//       RealmObjectBase.get<num>(this, 'standaredPrice') as num;
//   @override
//   set standaredPrice(num value) =>
//       RealmObjectBase.set(this, 'standaredPrice', value);

//   @override
//   num get listPrice => RealmObjectBase.get<num>(this, 'listPrice') as num;
//   @override
//   set listPrice(num value) => RealmObjectBase.set(this, 'listPrice', value);

//   @override
//   UomRealm? get saleUom =>
//       RealmObjectBase.get<UomRealm>(this, 'saleUom') as UomRealm?;
//   @override
//   set saleUom(covariant UomRealm? value) =>
//       RealmObjectBase.set(this, 'saleUom', value);

//   @override
//   UomRealm? get purchaseUom =>
//       RealmObjectBase.get<UomRealm>(this, 'purchaseUom') as UomRealm?;
//   @override
//   set purchaseUom(covariant UomRealm? value) =>
//       RealmObjectBase.set(this, 'purchaseUom', value);

//   @override
//   String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
//   @override
//   set type(String? value) => RealmObjectBase.set(this, 'type', value);

//   @override
//   bool? get saleOk => RealmObjectBase.get<bool>(this, 'saleOk') as bool?;
//   @override
//   set saleOk(bool? value) => RealmObjectBase.set(this, 'saleOk', value);

//   @override
//   String? get saleDescription =>
//       RealmObjectBase.get<String>(this, 'saleDescription') as String?;
//   @override
//   set saleDescription(String? value) =>
//       RealmObjectBase.set(this, 'saleDescription', value);

//   @override
//   String get companyId =>
//       RealmObjectBase.get<String>(this, 'companyId') as String;
//   @override
//   set companyId(String value) => RealmObjectBase.set(this, 'companyId', value);

//   @override
//   String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
//   @override
//   set image(String? value) => RealmObjectBase.set(this, 'image', value);

//   @override
//   RealmList<TaxRealm> get salesTaxes =>
//       RealmObjectBase.get<TaxRealm>(this, 'salesTaxes') as RealmList<TaxRealm>;
//   @override
//   set salesTaxes(covariant RealmList<TaxRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<TaxRealm> get purchaseTaxes =>
//       RealmObjectBase.get<TaxRealm>(this, 'purchaseTaxes')
//           as RealmList<TaxRealm>;
//   @override
//   set purchaseTaxes(covariant RealmList<TaxRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<ChargeRealm> get salesCharges =>
//       RealmObjectBase.get<ChargeRealm>(this, 'salesCharges')
//           as RealmList<ChargeRealm>;
//   @override
//   set salesCharges(covariant RealmList<ChargeRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<ChargeRealm> get purchaseCharges =>
//       RealmObjectBase.get<ChargeRealm>(this, 'purchaseCharges')
//           as RealmList<ChargeRealm>;
//   @override
//   set purchaseCharges(covariant RealmList<ChargeRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   DateTime get updatedAt =>
//       RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
//   @override
//   set updatedAt(DateTime value) =>
//       RealmObjectBase.set(this, 'updatedAt', value);

//   @override
//   String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
//   @override
//   set note(String? value) => RealmObjectBase.set(this, 'note', value);

//   @override
//   String? get printName =>
//       RealmObjectBase.get<String>(this, 'printName') as String?;
//   @override
//   set printName(String? value) => RealmObjectBase.set(this, 'printName', value);

//   @override
//   bool? get printerOverride =>
//       RealmObjectBase.get<bool>(this, 'printerOverride') as bool?;
//   @override
//   set printerOverride(bool? value) =>
//       RealmObjectBase.set(this, 'printerOverride', value);

//   @override
//   String? get printer =>
//       RealmObjectBase.get<String>(this, 'printer') as String?;
//   @override
//   set printer(String? value) => RealmObjectBase.set(this, 'printer', value);

//   @override
//   bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
//   @override
//   set active(bool value) => RealmObjectBase.set(this, 'active', value);

//   @override
//   RealmList<String> get tags =>
//       RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
//   @override
//   set tags(covariant RealmList<String> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<String> get searchMatchTerms =>
//       RealmObjectBase.get<String>(this, 'searchMatchTerms')
//           as RealmList<String>;
//   @override
//   set searchMatchTerms(covariant RealmList<String> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<PriceListRealm> get pricelists =>
//       RealmObjectBase.get<PriceListRealm>(this, 'pricelists')
//           as RealmList<PriceListRealm>;
//   @override
//   set pricelists(covariant RealmList<PriceListRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<ProductVariantRealm> get variants =>
//       RealmObjectBase.get<ProductVariantRealm>(this, 'variants')
//           as RealmList<ProductVariantRealm>;
//   @override
//   set variants(covariant RealmList<ProductVariantRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   bool? get availableInPos =>
//       RealmObjectBase.get<bool>(this, 'availableInPos') as bool?;
//   @override
//   set availableInPos(bool? value) =>
//       RealmObjectBase.set(this, 'availableInPos', value);

//   @override
//   bool? get toWeight => RealmObjectBase.get<bool>(this, 'toWeight') as bool?;
//   @override
//   set toWeight(bool? value) => RealmObjectBase.set(this, 'toWeight', value);

//   @override
//   String? get createdUserId =>
//       RealmObjectBase.get<String>(this, 'createdUserId') as String?;
//   @override
//   set createdUserId(String? value) =>
//       RealmObjectBase.set(this, 'createdUserId', value);

//   @override
//   String? get brand => RealmObjectBase.get<String>(this, 'brand') as String?;
//   @override
//   set brand(String? value) => RealmObjectBase.set(this, 'brand', value);

//   @override
//   Stream<RealmObjectChanges<ProductTemplateRealm>> get changes =>
//       RealmObjectBase.getChanges<ProductTemplateRealm>(this);

//   @override
//   Stream<RealmObjectChanges<ProductTemplateRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<ProductTemplateRealm>(this, keyPaths);

//   @override
//   ProductTemplateRealm freeze() =>
//       RealmObjectBase.freezeObject<ProductTemplateRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'category': category.toEJson(),
//       'posCategory': posCategory.toEJson(),
//       'defaultCode': defaultCode.toEJson(),
//       'standaredPrice': standaredPrice.toEJson(),
//       'listPrice': listPrice.toEJson(),
//       'saleUom': saleUom.toEJson(),
//       'purchaseUom': purchaseUom.toEJson(),
//       'type': type.toEJson(),
//       'saleOk': saleOk.toEJson(),
//       'saleDescription': saleDescription.toEJson(),
//       'companyId': companyId.toEJson(),
//       'image': image.toEJson(),
//       'salesTaxes': salesTaxes.toEJson(),
//       'purchaseTaxes': purchaseTaxes.toEJson(),
//       'salesCharges': salesCharges.toEJson(),
//       'purchaseCharges': purchaseCharges.toEJson(),
//       'updatedAt': updatedAt.toEJson(),
//       'note': note.toEJson(),
//       'printName': printName.toEJson(),
//       'printerOverride': printerOverride.toEJson(),
//       'printer': printer.toEJson(),
//       'active': active.toEJson(),
//       'tags': tags.toEJson(),
//       'searchMatchTerms': searchMatchTerms.toEJson(),
//       'pricelists': pricelists.toEJson(),
//       'variants': variants.toEJson(),
//       'availableInPos': availableInPos.toEJson(),
//       'toWeight': toWeight.toEJson(),
//       'createdUserId': createdUserId.toEJson(),
//       'brand': brand.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(ProductTemplateRealm value) => value.toEJson();
//   static ProductTemplateRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'defaultCode': EJsonValue defaultCode,
//         'standaredPrice': EJsonValue standaredPrice,
//         'listPrice': EJsonValue listPrice,
//         'companyId': EJsonValue companyId,
//         'updatedAt': EJsonValue updatedAt,
//         'active': EJsonValue active,
//       } =>
//         ProductTemplateRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(defaultCode),
//           fromEJson(standaredPrice),
//           fromEJson(listPrice),
//           fromEJson(companyId),
//           fromEJson(updatedAt),
//           fromEJson(active),
//           category: fromEJson(ejson['category']),
//           posCategory: fromEJson(ejson['posCategory']),
//           saleUom: fromEJson(ejson['saleUom']),
//           purchaseUom: fromEJson(ejson['purchaseUom']),
//           type: fromEJson(ejson['type']),
//           saleOk: fromEJson(ejson['saleOk']),
//           saleDescription: fromEJson(ejson['saleDescription']),
//           image: fromEJson(ejson['image']),
//           salesTaxes: fromEJson(ejson['salesTaxes']),
//           purchaseTaxes: fromEJson(ejson['purchaseTaxes']),
//           salesCharges: fromEJson(ejson['salesCharges']),
//           purchaseCharges: fromEJson(ejson['purchaseCharges']),
//           note: fromEJson(ejson['note']),
//           printName: fromEJson(ejson['printName']),
//           printerOverride: fromEJson(ejson['printerOverride']),
//           printer: fromEJson(ejson['printer']),
//           tags: fromEJson(ejson['tags']),
//           searchMatchTerms: fromEJson(ejson['searchMatchTerms']),
//           pricelists: fromEJson(ejson['pricelists']),
//           variants: fromEJson(ejson['variants']),
//           availableInPos: fromEJson(ejson['availableInPos']),
//           toWeight: fromEJson(ejson['toWeight']),
//           createdUserId: fromEJson(ejson['createdUserId']),
//           brand: fromEJson(ejson['brand']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(ProductTemplateRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, ProductTemplateRealm, 'ProductTemplateRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('category', RealmPropertyType.object,
//           optional: true, linkTarget: 'CategoryRealm'),
//       SchemaProperty('posCategory', RealmPropertyType.object,
//           optional: true, linkTarget: 'PosCategoryRealm'),
//       SchemaProperty('defaultCode', RealmPropertyType.string),
//       SchemaProperty('standaredPrice', RealmPropertyType.double),
//       SchemaProperty('listPrice', RealmPropertyType.double),
//       SchemaProperty('saleUom', RealmPropertyType.object,
//           optional: true, linkTarget: 'UomRealm'),
//       SchemaProperty('purchaseUom', RealmPropertyType.object,
//           optional: true, linkTarget: 'UomRealm'),
//       SchemaProperty('type', RealmPropertyType.string, optional: true),
//       SchemaProperty('saleOk', RealmPropertyType.bool, optional: true),
//       SchemaProperty('saleDescription', RealmPropertyType.string,
//           optional: true),
//       SchemaProperty('companyId', RealmPropertyType.string),
//       SchemaProperty('image', RealmPropertyType.string, optional: true),
//       SchemaProperty('salesTaxes', RealmPropertyType.object,
//           linkTarget: 'TaxRealm', collectionType: RealmCollectionType.list),
//       SchemaProperty('purchaseTaxes', RealmPropertyType.object,
//           linkTarget: 'TaxRealm', collectionType: RealmCollectionType.list),
//       SchemaProperty('salesCharges', RealmPropertyType.object,
//           linkTarget: 'ChargeRealm', collectionType: RealmCollectionType.list),
//       SchemaProperty('purchaseCharges', RealmPropertyType.object,
//           linkTarget: 'ChargeRealm', collectionType: RealmCollectionType.list),
//       SchemaProperty('updatedAt', RealmPropertyType.timestamp),
//       SchemaProperty('note', RealmPropertyType.string, optional: true),
//       SchemaProperty('printName', RealmPropertyType.string, optional: true),
//       SchemaProperty('printerOverride', RealmPropertyType.bool, optional: true),
//       SchemaProperty('printer', RealmPropertyType.string, optional: true),
//       SchemaProperty('active', RealmPropertyType.bool),
//       SchemaProperty('tags', RealmPropertyType.string,
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('searchMatchTerms', RealmPropertyType.string,
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('pricelists', RealmPropertyType.object,
//           linkTarget: 'PriceListRealm',
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('variants', RealmPropertyType.object,
//           linkTarget: 'ProductVariantRealm',
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('availableInPos', RealmPropertyType.bool, optional: true),
//       SchemaProperty('toWeight', RealmPropertyType.bool, optional: true),
//       SchemaProperty('createdUserId', RealmPropertyType.string, optional: true),
//       SchemaProperty('brand', RealmPropertyType.string, optional: true),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class CategoryRealm extends _CategoryRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   CategoryRealm(
//     ObjectId id,
//     String name,
//     String categoryPath, {
//     CategoryRealm? parentCategory,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'parentCategory', parentCategory);
//     RealmObjectBase.set(this, 'categoryPath', categoryPath);
//   }

//   CategoryRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   CategoryRealm? get parentCategory =>
//       RealmObjectBase.get<CategoryRealm>(this, 'parentCategory')
//           as CategoryRealm?;
//   @override
//   set parentCategory(covariant CategoryRealm? value) =>
//       RealmObjectBase.set(this, 'parentCategory', value);

//   @override
//   String get categoryPath =>
//       RealmObjectBase.get<String>(this, 'categoryPath') as String;
//   @override
//   set categoryPath(String value) =>
//       RealmObjectBase.set(this, 'categoryPath', value);

//   @override
//   Stream<RealmObjectChanges<CategoryRealm>> get changes =>
//       RealmObjectBase.getChanges<CategoryRealm>(this);

//   @override
//   Stream<RealmObjectChanges<CategoryRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<CategoryRealm>(this, keyPaths);

//   @override
//   CategoryRealm freeze() => RealmObjectBase.freezeObject<CategoryRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'parentCategory': parentCategory.toEJson(),
//       'categoryPath': categoryPath.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(CategoryRealm value) => value.toEJson();
//   static CategoryRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'categoryPath': EJsonValue categoryPath,
//       } =>
//         CategoryRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(categoryPath),
//           parentCategory: fromEJson(ejson['parentCategory']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(CategoryRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, CategoryRealm, 'CategoryRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('parentCategory', RealmPropertyType.object,
//           optional: true, linkTarget: 'CategoryRealm'),
//       SchemaProperty('categoryPath', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PosCategoryRealm extends _PosCategoryRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PosCategoryRealm(
//     ObjectId id,
//     String name,
//     int sequence,
//     bool active, {
//     PosCategoryRealm? parentCategory,
//     Iterable<PosCategoryRealm> childCategories = const [],
//     Iterable<ProductTemplateRealm> products = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'parentCategory', parentCategory);
//     RealmObjectBase.set<RealmList<PosCategoryRealm>>(
//         this, 'childCategories', RealmList<PosCategoryRealm>(childCategories));
//     RealmObjectBase.set(this, 'sequence', sequence);
//     RealmObjectBase.set<RealmList<ProductTemplateRealm>>(
//         this, 'products', RealmList<ProductTemplateRealm>(products));
//     RealmObjectBase.set(this, 'active', active);
//   }

//   PosCategoryRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   PosCategoryRealm? get parentCategory =>
//       RealmObjectBase.get<PosCategoryRealm>(this, 'parentCategory')
//           as PosCategoryRealm?;
//   @override
//   set parentCategory(covariant PosCategoryRealm? value) =>
//       RealmObjectBase.set(this, 'parentCategory', value);

//   @override
//   RealmList<PosCategoryRealm> get childCategories =>
//       RealmObjectBase.get<PosCategoryRealm>(this, 'childCategories')
//           as RealmList<PosCategoryRealm>;
//   @override
//   set childCategories(covariant RealmList<PosCategoryRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   int get sequence => RealmObjectBase.get<int>(this, 'sequence') as int;
//   @override
//   set sequence(int value) => RealmObjectBase.set(this, 'sequence', value);

//   @override
//   RealmList<ProductTemplateRealm> get products =>
//       RealmObjectBase.get<ProductTemplateRealm>(this, 'products')
//           as RealmList<ProductTemplateRealm>;
//   @override
//   set products(covariant RealmList<ProductTemplateRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
//   @override
//   set active(bool value) => RealmObjectBase.set(this, 'active', value);

//   @override
//   Stream<RealmObjectChanges<PosCategoryRealm>> get changes =>
//       RealmObjectBase.getChanges<PosCategoryRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PosCategoryRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PosCategoryRealm>(this, keyPaths);

//   @override
//   PosCategoryRealm freeze() =>
//       RealmObjectBase.freezeObject<PosCategoryRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'parentCategory': parentCategory.toEJson(),
//       'childCategories': childCategories.toEJson(),
//       'sequence': sequence.toEJson(),
//       'products': products.toEJson(),
//       'active': active.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PosCategoryRealm value) => value.toEJson();
//   static PosCategoryRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'sequence': EJsonValue sequence,
//         'active': EJsonValue active,
//       } =>
//         PosCategoryRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(sequence),
//           fromEJson(active),
//           parentCategory: fromEJson(ejson['parentCategory']),
//           childCategories: fromEJson(ejson['childCategories']),
//           products: fromEJson(ejson['products']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PosCategoryRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PosCategoryRealm, 'PosCategoryRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('parentCategory', RealmPropertyType.object,
//           optional: true, linkTarget: 'PosCategoryRealm'),
//       SchemaProperty('childCategories', RealmPropertyType.object,
//           linkTarget: 'PosCategoryRealm',
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('sequence', RealmPropertyType.int),
//       SchemaProperty('products', RealmPropertyType.object,
//           linkTarget: 'ProductTemplateRealm',
//           collectionType: RealmCollectionType.list),
//       SchemaProperty('active', RealmPropertyType.bool),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class VariantRealm extends _VariantRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   VariantRealm(
//     String id,
//     String defaultCode,
//     String barcode,
//     num qtyAvailable, {
//     Iterable<String?> sellerIds = const [],
//     Iterable<VariantAttributesRealm> attributes = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'defaultCode', defaultCode);
//     RealmObjectBase.set(this, 'barcode', barcode);
//     RealmObjectBase.set(this, 'qtyAvailable', qtyAvailable);
//     RealmObjectBase.set<RealmList<String?>>(
//         this, 'sellerIds', RealmList<String?>(sellerIds));
//     RealmObjectBase.set<RealmList<VariantAttributesRealm>>(
//         this, 'attributes', RealmList<VariantAttributesRealm>(attributes));
//   }

//   VariantRealm._();

//   @override
//   String get id => RealmObjectBase.get<String>(this, 'id') as String;
//   @override
//   set id(String value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get defaultCode =>
//       RealmObjectBase.get<String>(this, 'defaultCode') as String;
//   @override
//   set defaultCode(String value) =>
//       RealmObjectBase.set(this, 'defaultCode', value);

//   @override
//   String get barcode => RealmObjectBase.get<String>(this, 'barcode') as String;
//   @override
//   set barcode(String value) => RealmObjectBase.set(this, 'barcode', value);

//   @override
//   num get qtyAvailable => RealmObjectBase.get<num>(this, 'qtyAvailable') as num;
//   @override
//   set qtyAvailable(num value) =>
//       RealmObjectBase.set(this, 'qtyAvailable', value);

//   @override
//   RealmList<String?> get sellerIds =>
//       RealmObjectBase.get<String?>(this, 'sellerIds') as RealmList<String?>;
//   @override
//   set sellerIds(covariant RealmList<String?> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   RealmList<VariantAttributesRealm> get attributes =>
//       RealmObjectBase.get<VariantAttributesRealm>(this, 'attributes')
//           as RealmList<VariantAttributesRealm>;
//   @override
//   set attributes(covariant RealmList<VariantAttributesRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<VariantRealm>> get changes =>
//       RealmObjectBase.getChanges<VariantRealm>(this);

//   @override
//   Stream<RealmObjectChanges<VariantRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<VariantRealm>(this, keyPaths);

//   @override
//   VariantRealm freeze() => RealmObjectBase.freezeObject<VariantRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'defaultCode': defaultCode.toEJson(),
//       'barcode': barcode.toEJson(),
//       'qtyAvailable': qtyAvailable.toEJson(),
//       'sellerIds': sellerIds.toEJson(),
//       'attributes': attributes.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(VariantRealm value) => value.toEJson();
//   static VariantRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'defaultCode': EJsonValue defaultCode,
//         'barcode': EJsonValue barcode,
//         'qtyAvailable': EJsonValue qtyAvailable,
//       } =>
//         VariantRealm(
//           fromEJson(id),
//           fromEJson(defaultCode),
//           fromEJson(barcode),
//           fromEJson(qtyAvailable),
//           sellerIds: fromEJson(ejson['sellerIds']),
//           attributes: fromEJson(ejson['attributes']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(VariantRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, VariantRealm, 'VariantRealm', [
//       SchemaProperty('id', RealmPropertyType.string),
//       SchemaProperty('defaultCode', RealmPropertyType.string),
//       SchemaProperty('barcode', RealmPropertyType.string),
//       SchemaProperty('qtyAvailable', RealmPropertyType.double),
//       SchemaProperty('sellerIds', RealmPropertyType.string,
//           optional: true, collectionType: RealmCollectionType.list),
//       SchemaProperty('attributes', RealmPropertyType.object,
//           linkTarget: 'VariantAttributesRealm',
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class VariantAttributesRealm extends _VariantAttributesRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   VariantAttributesRealm(
//     String someThing,
//   ) {
//     RealmObjectBase.set(this, 'someThing', someThing);
//   }

//   VariantAttributesRealm._();

//   @override
//   String get someThing =>
//       RealmObjectBase.get<String>(this, 'someThing') as String;
//   @override
//   set someThing(String value) => RealmObjectBase.set(this, 'someThing', value);

//   @override
//   Stream<RealmObjectChanges<VariantAttributesRealm>> get changes =>
//       RealmObjectBase.getChanges<VariantAttributesRealm>(this);

//   @override
//   Stream<RealmObjectChanges<VariantAttributesRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<VariantAttributesRealm>(this, keyPaths);

//   @override
//   VariantAttributesRealm freeze() =>
//       RealmObjectBase.freezeObject<VariantAttributesRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'someThing': someThing.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(VariantAttributesRealm value) => value.toEJson();
//   static VariantAttributesRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'someThing': EJsonValue someThing,
//       } =>
//         VariantAttributesRealm(
//           fromEJson(someThing),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(VariantAttributesRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(ObjectType.realmObject, VariantAttributesRealm,
//         'VariantAttributesRealm', [
//       SchemaProperty('someThing', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class UomCategoryRealm extends _UomCategoryRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   UomCategoryRealm(
//     ObjectId id,
//     String name, {
//     Iterable<UomRealm> uoms = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set<RealmList<UomRealm>>(
//         this, 'uoms', RealmList<UomRealm>(uoms));
//   }

//   UomCategoryRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   RealmList<UomRealm> get uoms =>
//       RealmObjectBase.get<UomRealm>(this, 'uoms') as RealmList<UomRealm>;
//   @override
//   set uoms(covariant RealmList<UomRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<UomCategoryRealm>> get changes =>
//       RealmObjectBase.getChanges<UomCategoryRealm>(this);

//   @override
//   Stream<RealmObjectChanges<UomCategoryRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<UomCategoryRealm>(this, keyPaths);

//   @override
//   UomCategoryRealm freeze() =>
//       RealmObjectBase.freezeObject<UomCategoryRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'uoms': uoms.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(UomCategoryRealm value) => value.toEJson();
//   static UomCategoryRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//       } =>
//         UomCategoryRealm(
//           fromEJson(id),
//           fromEJson(name),
//           uoms: fromEJson(ejson['uoms']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(UomCategoryRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, UomCategoryRealm, 'UomCategoryRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('uoms', RealmPropertyType.object,
//           linkTarget: 'UomRealm', collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class UomRealm extends _UomRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   UomRealm(
//     ObjectId id,
//     String uomType,
//     String name,
//     double factor,
//     double rounding,
//     bool active, {
//     UomCategoryRealm? uomCategory,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'uomCategory', uomCategory);
//     RealmObjectBase.set(this, 'uomType', uomType);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'factor', factor);
//     RealmObjectBase.set(this, 'rounding', rounding);
//     RealmObjectBase.set(this, 'active', active);
//   }

//   UomRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   UomCategoryRealm? get uomCategory =>
//       RealmObjectBase.get<UomCategoryRealm>(this, 'uomCategory')
//           as UomCategoryRealm?;
//   @override
//   set uomCategory(covariant UomCategoryRealm? value) =>
//       RealmObjectBase.set(this, 'uomCategory', value);

//   @override
//   String get uomType => RealmObjectBase.get<String>(this, 'uomType') as String;
//   @override
//   set uomType(String value) => RealmObjectBase.set(this, 'uomType', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   double get factor => RealmObjectBase.get<double>(this, 'factor') as double;
//   @override
//   set factor(double value) => RealmObjectBase.set(this, 'factor', value);

//   @override
//   double get rounding =>
//       RealmObjectBase.get<double>(this, 'rounding') as double;
//   @override
//   set rounding(double value) => RealmObjectBase.set(this, 'rounding', value);

//   @override
//   bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
//   @override
//   set active(bool value) => RealmObjectBase.set(this, 'active', value);

//   @override
//   Stream<RealmObjectChanges<UomRealm>> get changes =>
//       RealmObjectBase.getChanges<UomRealm>(this);

//   @override
//   Stream<RealmObjectChanges<UomRealm>> changesFor([List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<UomRealm>(this, keyPaths);

//   @override
//   UomRealm freeze() => RealmObjectBase.freezeObject<UomRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'uomCategory': uomCategory.toEJson(),
//       'uomType': uomType.toEJson(),
//       'name': name.toEJson(),
//       'factor': factor.toEJson(),
//       'rounding': rounding.toEJson(),
//       'active': active.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(UomRealm value) => value.toEJson();
//   static UomRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'uomType': EJsonValue uomType,
//         'name': EJsonValue name,
//         'factor': EJsonValue factor,
//         'rounding': EJsonValue rounding,
//         'active': EJsonValue active,
//       } =>
//         UomRealm(
//           fromEJson(id),
//           fromEJson(uomType),
//           fromEJson(name),
//           fromEJson(factor),
//           fromEJson(rounding),
//           fromEJson(active),
//           uomCategory: fromEJson(ejson['uomCategory']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(UomRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(ObjectType.realmObject, UomRealm, 'UomRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('uomCategory', RealmPropertyType.object,
//           optional: true, linkTarget: 'UomCategoryRealm'),
//       SchemaProperty('uomType', RealmPropertyType.string),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('factor', RealmPropertyType.double),
//       SchemaProperty('rounding', RealmPropertyType.double),
//       SchemaProperty('active', RealmPropertyType.bool),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PriceListRealm extends _PriceListRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PriceListRealm(
//     ObjectId id,
//     String name,
//     String currency, {
//     Iterable<PriceListRuleRealm> rules = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'currency', currency);
//     RealmObjectBase.set<RealmList<PriceListRuleRealm>>(
//         this, 'rules', RealmList<PriceListRuleRealm>(rules));
//   }

//   PriceListRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   String get currency =>
//       RealmObjectBase.get<String>(this, 'currency') as String;
//   @override
//   set currency(String value) => RealmObjectBase.set(this, 'currency', value);

//   @override
//   RealmList<PriceListRuleRealm> get rules =>
//       RealmObjectBase.get<PriceListRuleRealm>(this, 'rules')
//           as RealmList<PriceListRuleRealm>;
//   @override
//   set rules(covariant RealmList<PriceListRuleRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<PriceListRealm>> get changes =>
//       RealmObjectBase.getChanges<PriceListRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PriceListRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PriceListRealm>(this, keyPaths);

//   @override
//   PriceListRealm freeze() => RealmObjectBase.freezeObject<PriceListRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'currency': currency.toEJson(),
//       'rules': rules.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PriceListRealm value) => value.toEJson();
//   static PriceListRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'currency': EJsonValue currency,
//       } =>
//         PriceListRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(currency),
//           rules: fromEJson(ejson['rules']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PriceListRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PriceListRealm, 'PriceListRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('currency', RealmPropertyType.string),
//       SchemaProperty('rules', RealmPropertyType.object,
//           linkTarget: 'PriceListRuleRealm',
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PriceListRuleRealm extends _PriceListRuleRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PriceListRuleRealm(
//     ObjectId id,
//     String ruleType, {
//     double? fixedPrice,
//     double? percentageDiscount,
//     String? formula,
//     double? minQuantity,
//     double? maxQuantity,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'ruleType', ruleType);
//     RealmObjectBase.set(this, 'fixedPrice', fixedPrice);
//     RealmObjectBase.set(this, 'percentageDiscount', percentageDiscount);
//     RealmObjectBase.set(this, 'formula', formula);
//     RealmObjectBase.set(this, 'minQuantity', minQuantity);
//     RealmObjectBase.set(this, 'maxQuantity', maxQuantity);
//   }

//   PriceListRuleRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get ruleType =>
//       RealmObjectBase.get<String>(this, 'ruleType') as String;
//   @override
//   set ruleType(String value) => RealmObjectBase.set(this, 'ruleType', value);

//   @override
//   double? get fixedPrice =>
//       RealmObjectBase.get<double>(this, 'fixedPrice') as double?;
//   @override
//   set fixedPrice(double? value) =>
//       RealmObjectBase.set(this, 'fixedPrice', value);

//   @override
//   double? get percentageDiscount =>
//       RealmObjectBase.get<double>(this, 'percentageDiscount') as double?;
//   @override
//   set percentageDiscount(double? value) =>
//       RealmObjectBase.set(this, 'percentageDiscount', value);

//   @override
//   String? get formula =>
//       RealmObjectBase.get<String>(this, 'formula') as String?;
//   @override
//   set formula(String? value) => RealmObjectBase.set(this, 'formula', value);

//   @override
//   double? get minQuantity =>
//       RealmObjectBase.get<double>(this, 'minQuantity') as double?;
//   @override
//   set minQuantity(double? value) =>
//       RealmObjectBase.set(this, 'minQuantity', value);

//   @override
//   double? get maxQuantity =>
//       RealmObjectBase.get<double>(this, 'maxQuantity') as double?;
//   @override
//   set maxQuantity(double? value) =>
//       RealmObjectBase.set(this, 'maxQuantity', value);

//   @override
//   Stream<RealmObjectChanges<PriceListRuleRealm>> get changes =>
//       RealmObjectBase.getChanges<PriceListRuleRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PriceListRuleRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PriceListRuleRealm>(this, keyPaths);

//   @override
//   PriceListRuleRealm freeze() =>
//       RealmObjectBase.freezeObject<PriceListRuleRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'ruleType': ruleType.toEJson(),
//       'fixedPrice': fixedPrice.toEJson(),
//       'percentageDiscount': percentageDiscount.toEJson(),
//       'formula': formula.toEJson(),
//       'minQuantity': minQuantity.toEJson(),
//       'maxQuantity': maxQuantity.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PriceListRuleRealm value) => value.toEJson();
//   static PriceListRuleRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'ruleType': EJsonValue ruleType,
//       } =>
//         PriceListRuleRealm(
//           fromEJson(id),
//           fromEJson(ruleType),
//           fixedPrice: fromEJson(ejson['fixedPrice']),
//           percentageDiscount: fromEJson(ejson['percentageDiscount']),
//           formula: fromEJson(ejson['formula']),
//           minQuantity: fromEJson(ejson['minQuantity']),
//           maxQuantity: fromEJson(ejson['maxQuantity']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PriceListRuleRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PriceListRuleRealm, 'PriceListRuleRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('ruleType', RealmPropertyType.string),
//       SchemaProperty('fixedPrice', RealmPropertyType.double, optional: true),
//       SchemaProperty('percentageDiscount', RealmPropertyType.double,
//           optional: true),
//       SchemaProperty('formula', RealmPropertyType.string, optional: true),
//       SchemaProperty('minQuantity', RealmPropertyType.double, optional: true),
//       SchemaProperty('maxQuantity', RealmPropertyType.double, optional: true),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class ProductTagRealm extends _ProductTagRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   ProductTagRealm(
//     ObjectId id,
//     String name,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//   }

//   ProductTagRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   Stream<RealmObjectChanges<ProductTagRealm>> get changes =>
//       RealmObjectBase.getChanges<ProductTagRealm>(this);

//   @override
//   Stream<RealmObjectChanges<ProductTagRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<ProductTagRealm>(this, keyPaths);

//   @override
//   ProductTagRealm freeze() =>
//       RealmObjectBase.freezeObject<ProductTagRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(ProductTagRealm value) => value.toEJson();
//   static ProductTagRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//       } =>
//         ProductTagRealm(
//           fromEJson(id),
//           fromEJson(name),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(ProductTagRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, ProductTagRealm, 'ProductTagRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid),
//       SchemaProperty('name', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class TaxRealm extends _TaxRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   TaxRealm(
//     ObjectId id,
//     String name,
//     double rate,
//     String type,
//     String computation,
//     String region,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'rate', rate);
//     RealmObjectBase.set(this, 'type', type);
//     RealmObjectBase.set(this, 'computation', computation);
//     RealmObjectBase.set(this, 'region', region);
//   }

//   TaxRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   double get rate => RealmObjectBase.get<double>(this, 'rate') as double;
//   @override
//   set rate(double value) => RealmObjectBase.set(this, 'rate', value);

//   @override
//   String get type => RealmObjectBase.get<String>(this, 'type') as String;
//   @override
//   set type(String value) => RealmObjectBase.set(this, 'type', value);

//   @override
//   String get computation =>
//       RealmObjectBase.get<String>(this, 'computation') as String;
//   @override
//   set computation(String value) =>
//       RealmObjectBase.set(this, 'computation', value);

//   @override
//   String get region => RealmObjectBase.get<String>(this, 'region') as String;
//   @override
//   set region(String value) => RealmObjectBase.set(this, 'region', value);

//   @override
//   Stream<RealmObjectChanges<TaxRealm>> get changes =>
//       RealmObjectBase.getChanges<TaxRealm>(this);

//   @override
//   Stream<RealmObjectChanges<TaxRealm>> changesFor([List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<TaxRealm>(this, keyPaths);

//   @override
//   TaxRealm freeze() => RealmObjectBase.freezeObject<TaxRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'rate': rate.toEJson(),
//       'type': type.toEJson(),
//       'computation': computation.toEJson(),
//       'region': region.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(TaxRealm value) => value.toEJson();
//   static TaxRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'rate': EJsonValue rate,
//         'type': EJsonValue type,
//         'computation': EJsonValue computation,
//         'region': EJsonValue region,
//       } =>
//         TaxRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(rate),
//           fromEJson(type),
//           fromEJson(computation),
//           fromEJson(region),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(TaxRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(ObjectType.realmObject, TaxRealm, 'TaxRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('rate', RealmPropertyType.double),
//       SchemaProperty('type', RealmPropertyType.string),
//       SchemaProperty('computation', RealmPropertyType.string),
//       SchemaProperty('region', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class ChargeRealm extends _ChargeRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   ChargeRealm(
//     ObjectId id,
//     String name,
//     double amount,
//     String type,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'amount', amount);
//     RealmObjectBase.set(this, 'type', type);
//   }

//   ChargeRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
//   @override
//   set amount(double value) => RealmObjectBase.set(this, 'amount', value);

//   @override
//   String get type => RealmObjectBase.get<String>(this, 'type') as String;
//   @override
//   set type(String value) => RealmObjectBase.set(this, 'type', value);

//   @override
//   Stream<RealmObjectChanges<ChargeRealm>> get changes =>
//       RealmObjectBase.getChanges<ChargeRealm>(this);

//   @override
//   Stream<RealmObjectChanges<ChargeRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<ChargeRealm>(this, keyPaths);

//   @override
//   ChargeRealm freeze() => RealmObjectBase.freezeObject<ChargeRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'amount': amount.toEJson(),
//       'type': type.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(ChargeRealm value) => value.toEJson();
//   static ChargeRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'amount': EJsonValue amount,
//         'type': EJsonValue type,
//       } =>
//         ChargeRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(amount),
//           fromEJson(type),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(ChargeRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, ChargeRealm, 'ChargeRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('amount', RealmPropertyType.double),
//       SchemaProperty('type', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class SalesDocumentRealm extends _SalesDocumentRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   SalesDocumentRealm(
//     ObjectId id,
//     String customer,
//     DateTime date,
//     double totalAmount,
//     String documentType,
//     String status, {
//     Iterable<SalesLineItemRealm> lineItems = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'customer', customer);
//     RealmObjectBase.set(this, 'date', date);
//     RealmObjectBase.set(this, 'totalAmount', totalAmount);
//     RealmObjectBase.set(this, 'documentType', documentType);
//     RealmObjectBase.set(this, 'status', status);
//     RealmObjectBase.set<RealmList<SalesLineItemRealm>>(
//         this, 'lineItems', RealmList<SalesLineItemRealm>(lineItems));
//   }

//   SalesDocumentRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get customer =>
//       RealmObjectBase.get<String>(this, 'customer') as String;
//   @override
//   set customer(String value) => RealmObjectBase.set(this, 'customer', value);

//   @override
//   DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
//   @override
//   set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

//   @override
//   double get totalAmount =>
//       RealmObjectBase.get<double>(this, 'totalAmount') as double;
//   @override
//   set totalAmount(double value) =>
//       RealmObjectBase.set(this, 'totalAmount', value);

//   @override
//   String get documentType =>
//       RealmObjectBase.get<String>(this, 'documentType') as String;
//   @override
//   set documentType(String value) =>
//       RealmObjectBase.set(this, 'documentType', value);

//   @override
//   String get status => RealmObjectBase.get<String>(this, 'status') as String;
//   @override
//   set status(String value) => RealmObjectBase.set(this, 'status', value);

//   @override
//   RealmList<SalesLineItemRealm> get lineItems =>
//       RealmObjectBase.get<SalesLineItemRealm>(this, 'lineItems')
//           as RealmList<SalesLineItemRealm>;
//   @override
//   set lineItems(covariant RealmList<SalesLineItemRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<SalesDocumentRealm>> get changes =>
//       RealmObjectBase.getChanges<SalesDocumentRealm>(this);

//   @override
//   Stream<RealmObjectChanges<SalesDocumentRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<SalesDocumentRealm>(this, keyPaths);

//   @override
//   SalesDocumentRealm freeze() =>
//       RealmObjectBase.freezeObject<SalesDocumentRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'customer': customer.toEJson(),
//       'date': date.toEJson(),
//       'totalAmount': totalAmount.toEJson(),
//       'documentType': documentType.toEJson(),
//       'status': status.toEJson(),
//       'lineItems': lineItems.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(SalesDocumentRealm value) => value.toEJson();
//   static SalesDocumentRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'customer': EJsonValue customer,
//         'date': EJsonValue date,
//         'totalAmount': EJsonValue totalAmount,
//         'documentType': EJsonValue documentType,
//         'status': EJsonValue status,
//       } =>
//         SalesDocumentRealm(
//           fromEJson(id),
//           fromEJson(customer),
//           fromEJson(date),
//           fromEJson(totalAmount),
//           fromEJson(documentType),
//           fromEJson(status),
//           lineItems: fromEJson(ejson['lineItems']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(SalesDocumentRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, SalesDocumentRealm, 'SalesDocumentRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('customer', RealmPropertyType.string),
//       SchemaProperty('date', RealmPropertyType.timestamp),
//       SchemaProperty('totalAmount', RealmPropertyType.double),
//       SchemaProperty('documentType', RealmPropertyType.string),
//       SchemaProperty('status', RealmPropertyType.string),
//       SchemaProperty('lineItems', RealmPropertyType.object,
//           linkTarget: 'SalesLineItemRealm',
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class SalesLineItemRealm extends _SalesLineItemRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   SalesLineItemRealm(
//     ObjectId id,
//     ObjectId salesDocumentId,
//     String product,
//     double priceUnit,
//     int quantity,
//     double total,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'salesDocumentId', salesDocumentId);
//     RealmObjectBase.set(this, 'product', product);
//     RealmObjectBase.set(this, 'priceUnit', priceUnit);
//     RealmObjectBase.set(this, 'quantity', quantity);
//     RealmObjectBase.set(this, 'total', total);
//   }

//   SalesLineItemRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   ObjectId get salesDocumentId =>
//       RealmObjectBase.get<ObjectId>(this, 'salesDocumentId') as ObjectId;
//   @override
//   set salesDocumentId(ObjectId value) =>
//       RealmObjectBase.set(this, 'salesDocumentId', value);

//   @override
//   String get product => RealmObjectBase.get<String>(this, 'product') as String;
//   @override
//   set product(String value) => RealmObjectBase.set(this, 'product', value);

//   @override
//   double get priceUnit =>
//       RealmObjectBase.get<double>(this, 'priceUnit') as double;
//   @override
//   set priceUnit(double value) => RealmObjectBase.set(this, 'priceUnit', value);

//   @override
//   int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
//   @override
//   set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

//   @override
//   double get total => RealmObjectBase.get<double>(this, 'total') as double;
//   @override
//   set total(double value) => RealmObjectBase.set(this, 'total', value);

//   @override
//   Stream<RealmObjectChanges<SalesLineItemRealm>> get changes =>
//       RealmObjectBase.getChanges<SalesLineItemRealm>(this);

//   @override
//   Stream<RealmObjectChanges<SalesLineItemRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<SalesLineItemRealm>(this, keyPaths);

//   @override
//   SalesLineItemRealm freeze() =>
//       RealmObjectBase.freezeObject<SalesLineItemRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'salesDocumentId': salesDocumentId.toEJson(),
//       'product': product.toEJson(),
//       'priceUnit': priceUnit.toEJson(),
//       'quantity': quantity.toEJson(),
//       'total': total.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(SalesLineItemRealm value) => value.toEJson();
//   static SalesLineItemRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'salesDocumentId': EJsonValue salesDocumentId,
//         'product': EJsonValue product,
//         'priceUnit': EJsonValue priceUnit,
//         'quantity': EJsonValue quantity,
//         'total': EJsonValue total,
//       } =>
//         SalesLineItemRealm(
//           fromEJson(id),
//           fromEJson(salesDocumentId),
//           fromEJson(product),
//           fromEJson(priceUnit),
//           fromEJson(quantity),
//           fromEJson(total),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(SalesLineItemRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, SalesLineItemRealm, 'SalesLineItemRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('salesDocumentId', RealmPropertyType.objectid),
//       SchemaProperty('product', RealmPropertyType.string),
//       SchemaProperty('priceUnit', RealmPropertyType.double),
//       SchemaProperty('quantity', RealmPropertyType.int),
//       SchemaProperty('total', RealmPropertyType.double),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class InvoiceRealm extends _InvoiceRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   InvoiceRealm(
//     ObjectId id,
//     ObjectId salesDocumentId,
//     DateTime date,
//     double totalAmount,
//     double taxAmount,
//     double paidAmount,
//     String invoiceStatus,
//     String paymentStatus, {
//     PartnerRealm? partner,
//     DateTime? dueDate,
//     Iterable<InvoiceLineItemRealm> lineItems = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'salesDocumentId', salesDocumentId);
//     RealmObjectBase.set(this, 'partner', partner);
//     RealmObjectBase.set(this, 'date', date);
//     RealmObjectBase.set(this, 'dueDate', dueDate);
//     RealmObjectBase.set(this, 'totalAmount', totalAmount);
//     RealmObjectBase.set(this, 'taxAmount', taxAmount);
//     RealmObjectBase.set(this, 'paidAmount', paidAmount);
//     RealmObjectBase.set(this, 'invoiceStatus', invoiceStatus);
//     RealmObjectBase.set(this, 'paymentStatus', paymentStatus);
//     RealmObjectBase.set<RealmList<InvoiceLineItemRealm>>(
//         this, 'lineItems', RealmList<InvoiceLineItemRealm>(lineItems));
//   }

//   InvoiceRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   ObjectId get salesDocumentId =>
//       RealmObjectBase.get<ObjectId>(this, 'salesDocumentId') as ObjectId;
//   @override
//   set salesDocumentId(ObjectId value) =>
//       RealmObjectBase.set(this, 'salesDocumentId', value);

//   @override
//   PartnerRealm? get partner =>
//       RealmObjectBase.get<PartnerRealm>(this, 'partner') as PartnerRealm?;
//   @override
//   set partner(covariant PartnerRealm? value) =>
//       RealmObjectBase.set(this, 'partner', value);

//   @override
//   DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
//   @override
//   set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

//   @override
//   DateTime? get dueDate =>
//       RealmObjectBase.get<DateTime>(this, 'dueDate') as DateTime?;
//   @override
//   set dueDate(DateTime? value) => RealmObjectBase.set(this, 'dueDate', value);

//   @override
//   double get totalAmount =>
//       RealmObjectBase.get<double>(this, 'totalAmount') as double;
//   @override
//   set totalAmount(double value) =>
//       RealmObjectBase.set(this, 'totalAmount', value);

//   @override
//   double get taxAmount =>
//       RealmObjectBase.get<double>(this, 'taxAmount') as double;
//   @override
//   set taxAmount(double value) => RealmObjectBase.set(this, 'taxAmount', value);

//   @override
//   double get paidAmount =>
//       RealmObjectBase.get<double>(this, 'paidAmount') as double;
//   @override
//   set paidAmount(double value) =>
//       RealmObjectBase.set(this, 'paidAmount', value);

//   @override
//   String get invoiceStatus =>
//       RealmObjectBase.get<String>(this, 'invoiceStatus') as String;
//   @override
//   set invoiceStatus(String value) =>
//       RealmObjectBase.set(this, 'invoiceStatus', value);

//   @override
//   String get paymentStatus =>
//       RealmObjectBase.get<String>(this, 'paymentStatus') as String;
//   @override
//   set paymentStatus(String value) =>
//       RealmObjectBase.set(this, 'paymentStatus', value);

//   @override
//   RealmList<InvoiceLineItemRealm> get lineItems =>
//       RealmObjectBase.get<InvoiceLineItemRealm>(this, 'lineItems')
//           as RealmList<InvoiceLineItemRealm>;
//   @override
//   set lineItems(covariant RealmList<InvoiceLineItemRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<InvoiceRealm>> get changes =>
//       RealmObjectBase.getChanges<InvoiceRealm>(this);

//   @override
//   Stream<RealmObjectChanges<InvoiceRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<InvoiceRealm>(this, keyPaths);

//   @override
//   InvoiceRealm freeze() => RealmObjectBase.freezeObject<InvoiceRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'salesDocumentId': salesDocumentId.toEJson(),
//       'partner': partner.toEJson(),
//       'date': date.toEJson(),
//       'dueDate': dueDate.toEJson(),
//       'totalAmount': totalAmount.toEJson(),
//       'taxAmount': taxAmount.toEJson(),
//       'paidAmount': paidAmount.toEJson(),
//       'invoiceStatus': invoiceStatus.toEJson(),
//       'paymentStatus': paymentStatus.toEJson(),
//       'lineItems': lineItems.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(InvoiceRealm value) => value.toEJson();
//   static InvoiceRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'salesDocumentId': EJsonValue salesDocumentId,
//         'date': EJsonValue date,
//         'totalAmount': EJsonValue totalAmount,
//         'taxAmount': EJsonValue taxAmount,
//         'paidAmount': EJsonValue paidAmount,
//         'invoiceStatus': EJsonValue invoiceStatus,
//         'paymentStatus': EJsonValue paymentStatus,
//       } =>
//         InvoiceRealm(
//           fromEJson(id),
//           fromEJson(salesDocumentId),
//           fromEJson(date),
//           fromEJson(totalAmount),
//           fromEJson(taxAmount),
//           fromEJson(paidAmount),
//           fromEJson(invoiceStatus),
//           fromEJson(paymentStatus),
//           partner: fromEJson(ejson['partner']),
//           dueDate: fromEJson(ejson['dueDate']),
//           lineItems: fromEJson(ejson['lineItems']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(InvoiceRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, InvoiceRealm, 'InvoiceRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('salesDocumentId', RealmPropertyType.objectid),
//       SchemaProperty('partner', RealmPropertyType.object,
//           optional: true, linkTarget: 'PartnerRealm'),
//       SchemaProperty('date', RealmPropertyType.timestamp),
//       SchemaProperty('dueDate', RealmPropertyType.timestamp, optional: true),
//       SchemaProperty('totalAmount', RealmPropertyType.double),
//       SchemaProperty('taxAmount', RealmPropertyType.double),
//       SchemaProperty('paidAmount', RealmPropertyType.double),
//       SchemaProperty('invoiceStatus', RealmPropertyType.string),
//       SchemaProperty('paymentStatus', RealmPropertyType.string),
//       SchemaProperty('lineItems', RealmPropertyType.object,
//           linkTarget: 'InvoiceLineItemRealm',
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class InvoiceLineItemRealm extends _InvoiceLineItemRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   InvoiceLineItemRealm(
//     ObjectId id,
//     ObjectId invoiceId,
//     String product,
//     double priceUnit,
//     int quantity,
//     double total,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'invoiceId', invoiceId);
//     RealmObjectBase.set(this, 'product', product);
//     RealmObjectBase.set(this, 'priceUnit', priceUnit);
//     RealmObjectBase.set(this, 'quantity', quantity);
//     RealmObjectBase.set(this, 'total', total);
//   }

//   InvoiceLineItemRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   ObjectId get invoiceId =>
//       RealmObjectBase.get<ObjectId>(this, 'invoiceId') as ObjectId;
//   @override
//   set invoiceId(ObjectId value) =>
//       RealmObjectBase.set(this, 'invoiceId', value);

//   @override
//   String get product => RealmObjectBase.get<String>(this, 'product') as String;
//   @override
//   set product(String value) => RealmObjectBase.set(this, 'product', value);

//   @override
//   double get priceUnit =>
//       RealmObjectBase.get<double>(this, 'priceUnit') as double;
//   @override
//   set priceUnit(double value) => RealmObjectBase.set(this, 'priceUnit', value);

//   @override
//   int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
//   @override
//   set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

//   @override
//   double get total => RealmObjectBase.get<double>(this, 'total') as double;
//   @override
//   set total(double value) => RealmObjectBase.set(this, 'total', value);

//   @override
//   Stream<RealmObjectChanges<InvoiceLineItemRealm>> get changes =>
//       RealmObjectBase.getChanges<InvoiceLineItemRealm>(this);

//   @override
//   Stream<RealmObjectChanges<InvoiceLineItemRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<InvoiceLineItemRealm>(this, keyPaths);

//   @override
//   InvoiceLineItemRealm freeze() =>
//       RealmObjectBase.freezeObject<InvoiceLineItemRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'invoiceId': invoiceId.toEJson(),
//       'product': product.toEJson(),
//       'priceUnit': priceUnit.toEJson(),
//       'quantity': quantity.toEJson(),
//       'total': total.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(InvoiceLineItemRealm value) => value.toEJson();
//   static InvoiceLineItemRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'invoiceId': EJsonValue invoiceId,
//         'product': EJsonValue product,
//         'priceUnit': EJsonValue priceUnit,
//         'quantity': EJsonValue quantity,
//         'total': EJsonValue total,
//       } =>
//         InvoiceLineItemRealm(
//           fromEJson(id),
//           fromEJson(invoiceId),
//           fromEJson(product),
//           fromEJson(priceUnit),
//           fromEJson(quantity),
//           fromEJson(total),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(InvoiceLineItemRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, InvoiceLineItemRealm, 'InvoiceLineItemRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('invoiceId', RealmPropertyType.objectid),
//       SchemaProperty('product', RealmPropertyType.string),
//       SchemaProperty('priceUnit', RealmPropertyType.double),
//       SchemaProperty('quantity', RealmPropertyType.int),
//       SchemaProperty('total', RealmPropertyType.double),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class JournalEntryRealm extends _JournalEntryRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   JournalEntryRealm(
//     ObjectId id,
//     ObjectId moveId,
//     ObjectId accountId,
//     ObjectId partnerId,
//     String description,
//     double debit,
//     double credit,
//     DateTime date,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'moveId', moveId);
//     RealmObjectBase.set(this, 'accountId', accountId);
//     RealmObjectBase.set(this, 'partnerId', partnerId);
//     RealmObjectBase.set(this, 'description', description);
//     RealmObjectBase.set(this, 'debit', debit);
//     RealmObjectBase.set(this, 'credit', credit);
//     RealmObjectBase.set(this, 'date', date);
//   }

//   JournalEntryRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   ObjectId get moveId =>
//       RealmObjectBase.get<ObjectId>(this, 'moveId') as ObjectId;
//   @override
//   set moveId(ObjectId value) => RealmObjectBase.set(this, 'moveId', value);

//   @override
//   ObjectId get accountId =>
//       RealmObjectBase.get<ObjectId>(this, 'accountId') as ObjectId;
//   @override
//   set accountId(ObjectId value) =>
//       RealmObjectBase.set(this, 'accountId', value);

//   @override
//   ObjectId get partnerId =>
//       RealmObjectBase.get<ObjectId>(this, 'partnerId') as ObjectId;
//   @override
//   set partnerId(ObjectId value) =>
//       RealmObjectBase.set(this, 'partnerId', value);

//   @override
//   String get description =>
//       RealmObjectBase.get<String>(this, 'description') as String;
//   @override
//   set description(String value) =>
//       RealmObjectBase.set(this, 'description', value);

//   @override
//   double get debit => RealmObjectBase.get<double>(this, 'debit') as double;
//   @override
//   set debit(double value) => RealmObjectBase.set(this, 'debit', value);

//   @override
//   double get credit => RealmObjectBase.get<double>(this, 'credit') as double;
//   @override
//   set credit(double value) => RealmObjectBase.set(this, 'credit', value);

//   @override
//   DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
//   @override
//   set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

//   @override
//   Stream<RealmObjectChanges<JournalEntryRealm>> get changes =>
//       RealmObjectBase.getChanges<JournalEntryRealm>(this);

//   @override
//   Stream<RealmObjectChanges<JournalEntryRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<JournalEntryRealm>(this, keyPaths);

//   @override
//   JournalEntryRealm freeze() =>
//       RealmObjectBase.freezeObject<JournalEntryRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'moveId': moveId.toEJson(),
//       'accountId': accountId.toEJson(),
//       'partnerId': partnerId.toEJson(),
//       'description': description.toEJson(),
//       'debit': debit.toEJson(),
//       'credit': credit.toEJson(),
//       'date': date.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(JournalEntryRealm value) => value.toEJson();
//   static JournalEntryRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'moveId': EJsonValue moveId,
//         'accountId': EJsonValue accountId,
//         'partnerId': EJsonValue partnerId,
//         'description': EJsonValue description,
//         'debit': EJsonValue debit,
//         'credit': EJsonValue credit,
//         'date': EJsonValue date,
//       } =>
//         JournalEntryRealm(
//           fromEJson(id),
//           fromEJson(moveId),
//           fromEJson(accountId),
//           fromEJson(partnerId),
//           fromEJson(description),
//           fromEJson(debit),
//           fromEJson(credit),
//           fromEJson(date),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(JournalEntryRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, JournalEntryRealm, 'JournalEntryRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('moveId', RealmPropertyType.objectid),
//       SchemaProperty('accountId', RealmPropertyType.objectid),
//       SchemaProperty('partnerId', RealmPropertyType.objectid),
//       SchemaProperty('description', RealmPropertyType.string),
//       SchemaProperty('debit', RealmPropertyType.double),
//       SchemaProperty('credit', RealmPropertyType.double),
//       SchemaProperty('date', RealmPropertyType.timestamp),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class AccountRealm extends _AccountRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   AccountRealm(
//     ObjectId id,
//     String name,
//     String code,
//     String type,
//     double balance, {
//     AccountRealm? parentAccount,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'code', code);
//     RealmObjectBase.set(this, 'type', type);
//     RealmObjectBase.set(this, 'parentAccount', parentAccount);
//     RealmObjectBase.set(this, 'balance', balance);
//   }

//   AccountRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   String get code => RealmObjectBase.get<String>(this, 'code') as String;
//   @override
//   set code(String value) => RealmObjectBase.set(this, 'code', value);

//   @override
//   String get type => RealmObjectBase.get<String>(this, 'type') as String;
//   @override
//   set type(String value) => RealmObjectBase.set(this, 'type', value);

//   @override
//   AccountRealm? get parentAccount =>
//       RealmObjectBase.get<AccountRealm>(this, 'parentAccount') as AccountRealm?;
//   @override
//   set parentAccount(covariant AccountRealm? value) =>
//       RealmObjectBase.set(this, 'parentAccount', value);

//   @override
//   double get balance => RealmObjectBase.get<double>(this, 'balance') as double;
//   @override
//   set balance(double value) => RealmObjectBase.set(this, 'balance', value);

//   @override
//   Stream<RealmObjectChanges<AccountRealm>> get changes =>
//       RealmObjectBase.getChanges<AccountRealm>(this);

//   @override
//   Stream<RealmObjectChanges<AccountRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<AccountRealm>(this, keyPaths);

//   @override
//   AccountRealm freeze() => RealmObjectBase.freezeObject<AccountRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'code': code.toEJson(),
//       'type': type.toEJson(),
//       'parentAccount': parentAccount.toEJson(),
//       'balance': balance.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(AccountRealm value) => value.toEJson();
//   static AccountRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'code': EJsonValue code,
//         'type': EJsonValue type,
//         'balance': EJsonValue balance,
//       } =>
//         AccountRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(code),
//           fromEJson(type),
//           fromEJson(balance),
//           parentAccount: fromEJson(ejson['parentAccount']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(AccountRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, AccountRealm, 'AccountRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('code', RealmPropertyType.string),
//       SchemaProperty('type', RealmPropertyType.string),
//       SchemaProperty('parentAccount', RealmPropertyType.object,
//           optional: true, linkTarget: 'AccountRealm'),
//       SchemaProperty('balance', RealmPropertyType.double),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PaymentRealm extends _PaymentRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PaymentRealm(
//     ObjectId paymentId,
//     ObjectId invoiceId,
//     ObjectId partnerId,
//     double amount,
//     DateTime date,
//     ObjectId journalEntryId,
//   ) {
//     RealmObjectBase.set(this, 'paymentId', paymentId);
//     RealmObjectBase.set(this, 'invoiceId', invoiceId);
//     RealmObjectBase.set(this, 'partnerId', partnerId);
//     RealmObjectBase.set(this, 'amount', amount);
//     RealmObjectBase.set(this, 'date', date);
//     RealmObjectBase.set(this, 'journalEntryId', journalEntryId);
//   }

//   PaymentRealm._();

//   @override
//   ObjectId get paymentId =>
//       RealmObjectBase.get<ObjectId>(this, 'paymentId') as ObjectId;
//   @override
//   set paymentId(ObjectId value) =>
//       RealmObjectBase.set(this, 'paymentId', value);

//   @override
//   ObjectId get invoiceId =>
//       RealmObjectBase.get<ObjectId>(this, 'invoiceId') as ObjectId;
//   @override
//   set invoiceId(ObjectId value) =>
//       RealmObjectBase.set(this, 'invoiceId', value);

//   @override
//   ObjectId get partnerId =>
//       RealmObjectBase.get<ObjectId>(this, 'partnerId') as ObjectId;
//   @override
//   set partnerId(ObjectId value) =>
//       RealmObjectBase.set(this, 'partnerId', value);

//   @override
//   double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
//   @override
//   set amount(double value) => RealmObjectBase.set(this, 'amount', value);

//   @override
//   DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
//   @override
//   set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

//   @override
//   ObjectId get journalEntryId =>
//       RealmObjectBase.get<ObjectId>(this, 'journalEntryId') as ObjectId;
//   @override
//   set journalEntryId(ObjectId value) =>
//       RealmObjectBase.set(this, 'journalEntryId', value);

//   @override
//   Stream<RealmObjectChanges<PaymentRealm>> get changes =>
//       RealmObjectBase.getChanges<PaymentRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PaymentRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PaymentRealm>(this, keyPaths);

//   @override
//   PaymentRealm freeze() => RealmObjectBase.freezeObject<PaymentRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'paymentId': paymentId.toEJson(),
//       'invoiceId': invoiceId.toEJson(),
//       'partnerId': partnerId.toEJson(),
//       'amount': amount.toEJson(),
//       'date': date.toEJson(),
//       'journalEntryId': journalEntryId.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PaymentRealm value) => value.toEJson();
//   static PaymentRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'paymentId': EJsonValue paymentId,
//         'invoiceId': EJsonValue invoiceId,
//         'partnerId': EJsonValue partnerId,
//         'amount': EJsonValue amount,
//         'date': EJsonValue date,
//         'journalEntryId': EJsonValue journalEntryId,
//       } =>
//         PaymentRealm(
//           fromEJson(paymentId),
//           fromEJson(invoiceId),
//           fromEJson(partnerId),
//           fromEJson(amount),
//           fromEJson(date),
//           fromEJson(journalEntryId),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PaymentRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PaymentRealm, 'PaymentRealm', [
//       SchemaProperty('paymentId', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('invoiceId', RealmPropertyType.objectid),
//       SchemaProperty('partnerId', RealmPropertyType.objectid),
//       SchemaProperty('amount', RealmPropertyType.double),
//       SchemaProperty('date', RealmPropertyType.timestamp),
//       SchemaProperty('journalEntryId', RealmPropertyType.objectid),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PartnerRealm extends _PartnerRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PartnerRealm(
//     ObjectId id,
//     String name,
//     bool isCompany,
//     int customerRank,
//     int supplierRank, {
//     String? email,
//     String? phone,
//     AddressRealm? address,
//     Iterable<InvoiceRealm> invoices = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'isCompany', isCompany);
//     RealmObjectBase.set(this, 'customerRank', customerRank);
//     RealmObjectBase.set(this, 'supplierRank', supplierRank);
//     RealmObjectBase.set(this, 'email', email);
//     RealmObjectBase.set(this, 'phone', phone);
//     RealmObjectBase.set(this, 'address', address);
//     RealmObjectBase.set<RealmList<InvoiceRealm>>(
//         this, 'invoices', RealmList<InvoiceRealm>(invoices));
//   }

//   PartnerRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   bool get isCompany => RealmObjectBase.get<bool>(this, 'isCompany') as bool;
//   @override
//   set isCompany(bool value) => RealmObjectBase.set(this, 'isCompany', value);

//   @override
//   int get customerRank => RealmObjectBase.get<int>(this, 'customerRank') as int;
//   @override
//   set customerRank(int value) =>
//       RealmObjectBase.set(this, 'customerRank', value);

//   @override
//   int get supplierRank => RealmObjectBase.get<int>(this, 'supplierRank') as int;
//   @override
//   set supplierRank(int value) =>
//       RealmObjectBase.set(this, 'supplierRank', value);

//   @override
//   String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
//   @override
//   set email(String? value) => RealmObjectBase.set(this, 'email', value);

//   @override
//   String? get phone => RealmObjectBase.get<String>(this, 'phone') as String?;
//   @override
//   set phone(String? value) => RealmObjectBase.set(this, 'phone', value);

//   @override
//   AddressRealm? get address =>
//       RealmObjectBase.get<AddressRealm>(this, 'address') as AddressRealm?;
//   @override
//   set address(covariant AddressRealm? value) =>
//       RealmObjectBase.set(this, 'address', value);

//   @override
//   RealmList<InvoiceRealm> get invoices =>
//       RealmObjectBase.get<InvoiceRealm>(this, 'invoices')
//           as RealmList<InvoiceRealm>;
//   @override
//   set invoices(covariant RealmList<InvoiceRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<PartnerRealm>> get changes =>
//       RealmObjectBase.getChanges<PartnerRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PartnerRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PartnerRealm>(this, keyPaths);

//   @override
//   PartnerRealm freeze() => RealmObjectBase.freezeObject<PartnerRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'isCompany': isCompany.toEJson(),
//       'customerRank': customerRank.toEJson(),
//       'supplierRank': supplierRank.toEJson(),
//       'email': email.toEJson(),
//       'phone': phone.toEJson(),
//       'address': address.toEJson(),
//       'invoices': invoices.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PartnerRealm value) => value.toEJson();
//   static PartnerRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'isCompany': EJsonValue isCompany,
//         'customerRank': EJsonValue customerRank,
//         'supplierRank': EJsonValue supplierRank,
//       } =>
//         PartnerRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(isCompany),
//           fromEJson(customerRank),
//           fromEJson(supplierRank),
//           email: fromEJson(ejson['email']),
//           phone: fromEJson(ejson['phone']),
//           address: fromEJson(ejson['address']),
//           invoices: fromEJson(ejson['invoices']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PartnerRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PartnerRealm, 'PartnerRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('isCompany', RealmPropertyType.bool),
//       SchemaProperty('customerRank', RealmPropertyType.int),
//       SchemaProperty('supplierRank', RealmPropertyType.int),
//       SchemaProperty('email', RealmPropertyType.string, optional: true),
//       SchemaProperty('phone', RealmPropertyType.string, optional: true),
//       SchemaProperty('address', RealmPropertyType.object,
//           optional: true, linkTarget: 'AddressRealm'),
//       SchemaProperty('invoices', RealmPropertyType.object,
//           linkTarget: 'InvoiceRealm', collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class AddressRealm extends _AddressRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   AddressRealm(
//     ObjectId id,
//     String street,
//     String city,
//     String country,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'street', street);
//     RealmObjectBase.set(this, 'city', city);
//     RealmObjectBase.set(this, 'country', country);
//   }

//   AddressRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get street => RealmObjectBase.get<String>(this, 'street') as String;
//   @override
//   set street(String value) => RealmObjectBase.set(this, 'street', value);

//   @override
//   String get city => RealmObjectBase.get<String>(this, 'city') as String;
//   @override
//   set city(String value) => RealmObjectBase.set(this, 'city', value);

//   @override
//   String get country => RealmObjectBase.get<String>(this, 'country') as String;
//   @override
//   set country(String value) => RealmObjectBase.set(this, 'country', value);

//   @override
//   Stream<RealmObjectChanges<AddressRealm>> get changes =>
//       RealmObjectBase.getChanges<AddressRealm>(this);

//   @override
//   Stream<RealmObjectChanges<AddressRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<AddressRealm>(this, keyPaths);

//   @override
//   AddressRealm freeze() => RealmObjectBase.freezeObject<AddressRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'street': street.toEJson(),
//       'city': city.toEJson(),
//       'country': country.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(AddressRealm value) => value.toEJson();
//   static AddressRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'street': EJsonValue street,
//         'city': EJsonValue city,
//         'country': EJsonValue country,
//       } =>
//         AddressRealm(
//           fromEJson(id),
//           fromEJson(street),
//           fromEJson(city),
//           fromEJson(country),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(AddressRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, AddressRealm, 'AddressRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid),
//       SchemaProperty('street', RealmPropertyType.string),
//       SchemaProperty('city', RealmPropertyType.string),
//       SchemaProperty('country', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class PartnerCompanyRealm extends _PartnerCompanyRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   PartnerCompanyRealm(
//     ObjectId id,
//     String name, {
//     Iterable<PartnerRealm> partners = const [],
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set<RealmList<PartnerRealm>>(
//         this, 'partners', RealmList<PartnerRealm>(partners));
//   }

//   PartnerCompanyRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   RealmList<PartnerRealm> get partners =>
//       RealmObjectBase.get<PartnerRealm>(this, 'partners')
//           as RealmList<PartnerRealm>;
//   @override
//   set partners(covariant RealmList<PartnerRealm> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<PartnerCompanyRealm>> get changes =>
//       RealmObjectBase.getChanges<PartnerCompanyRealm>(this);

//   @override
//   Stream<RealmObjectChanges<PartnerCompanyRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<PartnerCompanyRealm>(this, keyPaths);

//   @override
//   PartnerCompanyRealm freeze() =>
//       RealmObjectBase.freezeObject<PartnerCompanyRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'partners': partners.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(PartnerCompanyRealm value) => value.toEJson();
//   static PartnerCompanyRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//       } =>
//         PartnerCompanyRealm(
//           fromEJson(id),
//           fromEJson(name),
//           partners: fromEJson(ejson['partners']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(PartnerCompanyRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, PartnerCompanyRealm, 'PartnerCompanyRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('partners', RealmPropertyType.object,
//           linkTarget: 'PartnerRealm', collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class UserRealm extends _UserRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   UserRealm(
//     ObjectId id,
//     String email,
//     String passwordHash,
//     String role,
//     String companyId,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'email', email);
//     RealmObjectBase.set(this, 'passwordHash', passwordHash);
//     RealmObjectBase.set(this, 'role', role);
//     RealmObjectBase.set(this, 'companyId', companyId);
//   }

//   UserRealm._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get email => RealmObjectBase.get<String>(this, 'email') as String;
//   @override
//   set email(String value) => RealmObjectBase.set(this, 'email', value);

//   @override
//   String get passwordHash =>
//       RealmObjectBase.get<String>(this, 'passwordHash') as String;
//   @override
//   set passwordHash(String value) =>
//       RealmObjectBase.set(this, 'passwordHash', value);

//   @override
//   String get role => RealmObjectBase.get<String>(this, 'role') as String;
//   @override
//   set role(String value) => RealmObjectBase.set(this, 'role', value);

//   @override
//   String get companyId =>
//       RealmObjectBase.get<String>(this, 'companyId') as String;
//   @override
//   set companyId(String value) => RealmObjectBase.set(this, 'companyId', value);

//   @override
//   Stream<RealmObjectChanges<UserRealm>> get changes =>
//       RealmObjectBase.getChanges<UserRealm>(this);

//   @override
//   Stream<RealmObjectChanges<UserRealm>> changesFor([List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<UserRealm>(this, keyPaths);

//   @override
//   UserRealm freeze() => RealmObjectBase.freezeObject<UserRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'email': email.toEJson(),
//       'passwordHash': passwordHash.toEJson(),
//       'role': role.toEJson(),
//       'companyId': companyId.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(UserRealm value) => value.toEJson();
//   static UserRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'email': EJsonValue email,
//         'passwordHash': EJsonValue passwordHash,
//         'role': EJsonValue role,
//         'companyId': EJsonValue companyId,
//       } =>
//         UserRealm(
//           fromEJson(id),
//           fromEJson(email),
//           fromEJson(passwordHash),
//           fromEJson(role),
//           fromEJson(companyId),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(UserRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(ObjectType.realmObject, UserRealm, 'UserRealm', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('email', RealmPropertyType.string),
//       SchemaProperty('passwordHash', RealmPropertyType.string),
//       SchemaProperty('role', RealmPropertyType.string),
//       SchemaProperty('companyId', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class RoleRealm extends _RoleRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   RoleRealm(
//     String name, {
//     Iterable<String> permissions = const [],
//   }) {
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set<RealmList<String>>(
//         this, 'permissions', RealmList<String>(permissions));
//   }

//   RoleRealm._();

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   RealmList<String> get permissions =>
//       RealmObjectBase.get<String>(this, 'permissions') as RealmList<String>;
//   @override
//   set permissions(covariant RealmList<String> value) =>
//       throw RealmUnsupportedSetError();

//   @override
//   Stream<RealmObjectChanges<RoleRealm>> get changes =>
//       RealmObjectBase.getChanges<RoleRealm>(this);

//   @override
//   Stream<RealmObjectChanges<RoleRealm>> changesFor([List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<RoleRealm>(this, keyPaths);

//   @override
//   RoleRealm freeze() => RealmObjectBase.freezeObject<RoleRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'name': name.toEJson(),
//       'permissions': permissions.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(RoleRealm value) => value.toEJson();
//   static RoleRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'name': EJsonValue name,
//       } =>
//         RoleRealm(
//           fromEJson(name),
//           permissions: fromEJson(ejson['permissions']),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(RoleRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(ObjectType.realmObject, RoleRealm, 'RoleRealm', [
//       SchemaProperty('name', RealmPropertyType.string, primaryKey: true),
//       SchemaProperty('permissions', RealmPropertyType.string,
//           collectionType: RealmCollectionType.list),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }

// class CompanyRealm extends _CompanyRealm
//     with RealmEntity, RealmObjectBase, RealmObject {
//   CompanyRealm(
//     String id,
//     String name,
//     String currency,
//   ) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'currency', currency);
//   }

//   CompanyRealm._();

//   @override
//   String get id => RealmObjectBase.get<String>(this, 'id') as String;
//   @override
//   set id(String value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get name => RealmObjectBase.get<String>(this, 'name') as String;
//   @override
//   set name(String value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   String get currency =>
//       RealmObjectBase.get<String>(this, 'currency') as String;
//   @override
//   set currency(String value) => RealmObjectBase.set(this, 'currency', value);

//   @override
//   Stream<RealmObjectChanges<CompanyRealm>> get changes =>
//       RealmObjectBase.getChanges<CompanyRealm>(this);

//   @override
//   Stream<RealmObjectChanges<CompanyRealm>> changesFor(
//           [List<String>? keyPaths]) =>
//       RealmObjectBase.getChangesFor<CompanyRealm>(this, keyPaths);

//   @override
//   CompanyRealm freeze() => RealmObjectBase.freezeObject<CompanyRealm>(this);

//   EJsonValue toEJson() {
//     return <String, dynamic>{
//       'id': id.toEJson(),
//       'name': name.toEJson(),
//       'currency': currency.toEJson(),
//     };
//   }

//   static EJsonValue _toEJson(CompanyRealm value) => value.toEJson();
//   static CompanyRealm _fromEJson(EJsonValue ejson) {
//     if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
//     return switch (ejson) {
//       {
//         'id': EJsonValue id,
//         'name': EJsonValue name,
//         'currency': EJsonValue currency,
//       } =>
//         CompanyRealm(
//           fromEJson(id),
//           fromEJson(name),
//           fromEJson(currency),
//         ),
//       _ => raiseInvalidEJson(ejson),
//     };
//   }

//   static final schema = () {
//     RealmObjectBase.registerFactory(CompanyRealm._);
//     register(_toEJson, _fromEJson);
//     return const SchemaObject(
//         ObjectType.realmObject, CompanyRealm, 'CompanyRealm', [
//       SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string),
//       SchemaProperty('currency', RealmPropertyType.string),
//     ]);
//   }();

//   @override
//   SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
// }
