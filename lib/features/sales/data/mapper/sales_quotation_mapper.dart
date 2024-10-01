import 'package:realm/realm.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/entities/sales_quotation_line.dart';

class SalesQuotationMapper {
  // Convert domain to Realm model
  static SalesDocumentRealm toRealm(SalesQuotation domainQuotation) {
    return SalesDocumentRealm(
      ObjectId(), // quotationDate: domainQuotation.quotationDate,
      'customer',
      DateTime.now(),
      33.33,
      'dsldsf',
      'slskdf',
    );
  }

  // Convert Realm model to domain model
  static SalesQuotation toDomain(SalesDocumentRealm realmQuotation) {
    return SalesQuotation(
        quotationNumber: 'helo',
        quotationDate: DateTime.now(),
        createdByUserId: 'hellouserid',
        customerId: 'hellocutomerid',
        quotationLines:
            realmQuotation.lineItems.map((line) => toDomainLine(line)).toList(),
        totalAmount: realmQuotation.totalAmount,
        taxedTotal: 3.333);

    //     return SalesQuotation(
    //   quotationNumber: realmQuotation.quotationNumber,
    //   quotationDate: realmQuotation.quotationDate,
    //   createdByUserId: realmQuotation.createdByUserId,
    //   customerId: realmQuotation.customerId,
    //   quotationLines: realmQuotation.quotationLines
    //       .map((line) => toDomainLine(line))
    //       .toList(),
    //   totalAmount: realmQuotation.totalAmount,
    // );
  }

  // Helper functions for lines
  static SalesLineItemRealm toRealmLine(SalesQuotationLine domainLine) {
    return SalesLineItemRealm(ObjectId(), ObjectId(), 'helll', 2.2, 33, 333);

    //     return SalesLineItemRealm(
    //   productId: domainLine.productId,
    //   productName: domainLine.productName,
    //   quantity: domainLine.quantity,
    //   price: domainLine.price,
    //   discount: domainLine.discount,
    //   totalPrice: domainLine.totalPrice,
    // );
  }

  static SalesQuotationLine toDomainLine(SalesLineItemRealm realmLine) {
    return SalesQuotationLine(
      productId: realmLine.id.toString(),
      productName: 'later fill up',
      quantity: 33,
      unitPrice: 30.0,
      discount: 5,
      // totalPrice: 30,
    );
  }
}
