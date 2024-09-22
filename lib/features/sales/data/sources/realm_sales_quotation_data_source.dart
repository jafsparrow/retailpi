import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';

class RealmSalesQuotationDataSource {
  final Realm _realm;

  RealmSalesQuotationDataSource(this._realm);

  List<SalesDocumentRealm> getQuotations() {
    return _realm.all<SalesDocumentRealm>().toList();
  }

  // uploadStatements(dynamic data, CategoryRealm categoryrealm) {
  //   _realm.write(() {
  //     for (var item in data) {
  //       _realm.add(ProductTemplateRealm(
  //           ObjectId(),
  //           item['name']!,
  //           item['code ']!,
  //           item['cost']!,
  //           item['price']!,
  //           'companyId',
  //           DateTime.now(),
  //           true,
  //           category: categoryrealm));
  //     }
  //   });
  // }

  Future<void> createQuotations(
      List<SalesDocumentRealm> productTemplatess) async {
    _realm.write(() {
      _realm.deleteAll<ProductTemplateRealm>();
      for (var product in productTemplatess) {
        _realm.add(product);
      }
    });
  }

  Future<void> createQuotation(SalesDocumentRealm quotation) async {
    _realm.write(() {
      _realm.add<SalesDocumentRealm>(quotation);
    });
  }

  SalesDocumentRealm? getQuotationById(String id) {
    return _realm.find<SalesDocumentRealm>(ObjectId.fromHexString(id));
  }
  // List<SalesDocumentRealm> searchQuotation(String query,
  //     {int limit = 20, int offset = 0}) {
  //   final quotations = _realm
  //       .all<SalesDocumentRealm>()
  //       .query('name CONTAINS[c] \$0 OR defaultCode CONTAINS[c] \$0', [query])
  //       .skip(offset)
  //       .take(limit)
  //       .toList();

  //   return quotations;
  // }
}
