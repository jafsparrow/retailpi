// data/repositories/quotation_repository_impl.dart

import 'package:retailpi/features/sales/data/mapper/sales_quotation_mapper.dart';
import 'package:retailpi/features/sales/data/sources/realm_sales_quotation_data_source.dart';
import 'package:retailpi/features/sales/domain/repositories/sales_quotation_repository.dart';
import '../../domain/entities/sales_quotation.dart';

class QuotationRepositoryImpl implements SalesQuotationRepository {
  final RealmSalesQuotationDataSource realmSalesQuotationDataSource;
  QuotationRepositoryImpl(this.realmSalesQuotationDataSource);

  @override
  Future<void> createQuotation(SalesQuotation quotation) async {
    throw UnimplementedError();
    // final mappedToRealmQuotation = SalesQuotationMapper.toRealm(quotation);
    // realmSalesQuotationDataSource.createQuotation(mappedToRealmQuotation);
  }

  // @override
  // Future<void> addLineToQuotation(String quotationId, SalesQuotationLine line) async {
  //   final quotation = realm.find<SalesQuotation>(quotationId);
  //   if (quotation != null) {
  //     realm.write(() {
  //       quotation.quotationLines.add(line); // Add the line
  //       quotation.totalAmount = quotation.calculateTotalAmount();
  //     });
  //   }
  // }

  @override
  Future<List<SalesQuotation>> getQuotations() async {
    throw UnimplementedError();
    // final realmQutations = realmSalesQuotationDataSource.getQuotations();
    // final mappedToRealmQuotations = realmQutations.map((item) {
    //   return SalesQuotationMapper.toDomain(item);
    // }).toList();

    // return mappedToRealmQuotations;
  }

  @override
  Future<SalesQuotation?> getQuotationById(String id) async {
    throw UnimplementedError();
    // final realmQuotation = realmSalesQuotationDataSource.getQuotationById(id);
    // if (realmQuotation != null) {
    //   final mappedQuotation = SalesQuotationMapper.toDomain(realmQuotation);
    //   return mappedQuotation;
    // }
  }
}
