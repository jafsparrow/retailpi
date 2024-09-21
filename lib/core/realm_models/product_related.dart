import 'package:realm/realm.dart';

part 'product_related.realm.dart';

@RealmModel()
class _ProductVariantRealm {
  @PrimaryKey()
  late ObjectId id;
  late _ProductTemplateRealm? productTemplate;
  late String companyId;
  late String defaultCode;
  late String? barcode;
  // combination index is to uniquely identify the variants combinations.
  late String? combinationIndex;

  late Map<String, String> attributes;

  late num listPrice;
  late String sku;
  late num stock;
  late String? batchNumber;
  late DateTime? expiryDate;
  late DateTime? productionDate;

  late String? mainImage;

  late List<String> scrollImages;
}

@RealmModel()
class _ProductTemplateRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late _CategoryRealm? category; // Reference to the category
  late _PosCategoryRealm? posCategory;
  late String defaultCode;
  late num standaredPrice;
  late num listPrice;
  late _UomRealm? saleUom;
  late _UomRealm? purchaseUom;
  late String? type;
  late bool? saleOk;
  late String? saleDescription;
  late String companyId;
  late String? image;

  late List<_TaxRealm> salesTaxes; // List of sales taxes applied to the product
  late List<_TaxRealm>
      purchaseTaxes; // List of purchase taxes applied to the product

  late List<_ChargeRealm> salesCharges; // List of fixed charges for sales
  late List<_ChargeRealm>
      purchaseCharges; // List of fixed charges for purchases

  late DateTime updatedAt;
  late String? note;
  late String? printName;
  late bool? printerOverride;
  late String? printer;
  late bool active;
  late List<String> tags;
  late List<String>
      searchMatchTerms; // this is for image search and check any of the word matches the result.

  late List<_PriceListRealm>
      pricelists; // List of pricelists applicable to this product

  late List<_ProductVariantRealm> variants; // List of product variants

  late bool? availableInPos;
  late bool? toWeight;

  // the below fields are for future, temporarily making it optinal

  late String? createdUserId;
  String? brand;
}

@RealmModel()
class _CategoryRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  _CategoryRealm? parentCategory; // Reference to the parent category
  late String categoryPath; // Path like 'parent/child/grandchild'
}

@RealmModel()
class _PosCategoryRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name; // POS Category name (e.g., 'Soft Drinks')

  _PosCategoryRealm? parentCategory; // For hierarchical subcategories

  late List<_PosCategoryRealm> childCategories; // Subcategories

  late int sequence; // Display order in POS

  late List<_ProductTemplateRealm> products; // Products in this POS category

  late bool active; // To activate/deactivate category
}

@RealmModel()
class _VariantRealm {
  late String id;
  late String defaultCode;
  late String barcode;
  late num qtyAvailable;
  late List<String?> sellerIds;
  late List<_VariantAttributesRealm> attributes;
}

@RealmModel()
class _VariantAttributesRealm {
  late String someThing;
}

@RealmModel()
class _UomCategoryRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late List<_UomRealm> uoms;
}

@RealmModel()
class _UomRealm {
  @PrimaryKey()
  late ObjectId id;
  late _UomCategoryRealm? uomCategory;
  late String
      uomType; // odoo copy - reference/ bigger/smaller. Not sure where has it used in the code..
  late String name;
  late double factor;
  late double rounding;
  late bool active;
}

@RealmModel()
class _PriceListRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String currency;
  late List<_PriceListRuleRealm> rules;
}

@RealmModel()
class _PriceListRuleRealm {
  @PrimaryKey()
  late ObjectId id;
  late String ruleType; //fixed, percetage, calculated.
  late double? fixedPrice; // fixed price if ruletype is fixed.
  late double?
      percentageDiscount; // percentile value if ruletype is percentage.
  late String? formula; // Formula for calculated price (optional)

  // Optional min/max quantity or conditions for applying the rule
  late double? minQuantity;
  late double? maxQuantity;
}

@RealmModel()
class _ProductTagRealm {
  late ObjectId id;
  late String name;
}

@RealmModel()
class _TaxRealm {
  @PrimaryKey()
  late ObjectId id;
  late String name; // Tax name, e.g., "VAT", "Sales Tax"
  late double rate; // Tax rate percentage, e.g., 15 for 15%
  late String type; // "sales" or "purchase"
  late String
      computation; // "inclusive" or "exclusive" meaning inluded in baseprice or not
  late String region; // Optional: Apply tax based on region
}

@RealmModel()
class _ChargeRealm {
  @PrimaryKey()
  late ObjectId id;
  late String
      name; // Name of the charge, e.g., "Handling Fee", "Service Charge"
  late double amount; // Fixed amount for the charge, e.g., 5.0 for $5
  late String
      type; // "sales" or "purchase", to indicate when this charge is applied
}

@RealmModel()
class _SalesDocumentRealm {
  @PrimaryKey()
  late ObjectId id; // Unique ID for each document
  late String customer; // Customer linked to this document
  late DateTime date; // Date of creation
  late double totalAmount; // Total amount for the document
  late String documentType; // 'quotation' or 'order'
  late String status; // 'draft', 'confirmed', 'done'
  late List<_SalesLineItemRealm> lineItems; // Reference to line items
}

@RealmModel()
class _SalesLineItemRealm {
  @PrimaryKey()
  late ObjectId id;
  late ObjectId salesDocumentId; // Foreign key to SalesDocument
  late String product; // Product name or ID
  late double priceUnit; // Unit price
  late int quantity; // Quantity
  late double total; // Total for this line item (priceUnit * quantity)
}

@RealmModel()
class _InvoiceRealm {
  @PrimaryKey()
  late ObjectId id;
  late ObjectId salesDocumentId; // Foreign key to link with the sales order
  late _PartnerRealm? partner; // Customer linked to this invoice
  late DateTime date; // Invoice creation date
  late DateTime? dueDate;
  late double totalAmount; // Total invoice amount
  late double taxAmount; // Total tax applied
  late double paidAmount; // Amount paid
  late String invoiceStatus; // 'unpaid', 'paid', etc.
  late String
      paymentStatus; // need to confirm if it is needed in long run [todo]
  late List<_InvoiceLineItemRealm> lineItems; // Reference to invoice line items
}

@RealmModel()
class _InvoiceLineItemRealm {
  @PrimaryKey()
  late ObjectId id;
  late ObjectId invoiceId; // Foreign key to Invoice
  late String product; // Product name or ID
  late double priceUnit; // Unit price from the sales order
  late int quantity; // Quantity from the sales order
  late double total; // Total price (priceUnit * quantity)
}

@RealmModel()
class _JournalEntryRealm {
  @PrimaryKey()
  late ObjectId id;
  late ObjectId
      moveId; // Reference to the related transaction (e.g., invoice, payment)
  late ObjectId
      accountId; // Reference to the account (e.g., accounts_receivable)
  late ObjectId partnerId; // Customer or vendor
  late String description;
  late double debit;
  late double credit;
  late DateTime date;
}

@RealmModel()
class _AccountRealm {
  @PrimaryKey()
  late ObjectId id;

  late String name; // e.g., 'Accounts Receivable'
  late String code; // e.g., 'AR' 4001
  late String type; // 'asset', 'liability', 'income', 'expense'
  _AccountRealm?
      parentAccount; // For hierarchical accounts (e.g., a bank account under 'Cash')

  late double balance;
}

@RealmModel()
class _PaymentRealm {
  @PrimaryKey()
  late ObjectId paymentId;

  late ObjectId invoiceId; // Reference to the related invoice
  late ObjectId partnerId; // Reference to the customer or vendor
  late double amount;
  late DateTime date;
  late ObjectId journalEntryId; // Reference to the related journal entry
}

@RealmModel()
class _PartnerRealm {
  @PrimaryKey()
  late ObjectId id; // Unique identifier for the partner

  late String name; // Name of the partner (either company or individual)

  late bool
      isCompany; // True if the partner is a company, False if an individual

  late int
      customerRank; // Number of sales transactions (0 means not a customer)

  late int
      supplierRank; // Number of purchase transactions (0 means not a supplier)

  String? email; // Optional contact information
  String? phone; // Optional contact information

  late _AddressRealm? address; // Address reference

  late List<_InvoiceRealm>
      invoices; // Reference to the invoices this partner is involved in
}

@RealmModel()
class _AddressRealm {
  late ObjectId id;
  late String street;
  late String city;
  late String country;
}

@RealmModel()
class _PartnerCompanyRealm {
  @PrimaryKey()
  late ObjectId id;

  late String name; // Name of the company

  // List of partners associated with this company
  late List<_PartnerRealm> partners;
}

@RealmModel()
class _UserRealm {
  @PrimaryKey()
  late ObjectId id; // UUID or email
  late String email;
  late String passwordHash; // Store hashed password
  late String role; // Define roles such as admin, user
  late String companyId; // Multi-tenancy
}

@RealmModel()
class _RoleRealm {
  @PrimaryKey()
  late String name; // e.g., 'admin', 'user', 'manager'
  late List<String> permissions; // List of model names or actions
}

@RealmModel()
class _CompanyRealm {
  @PrimaryKey()
  late String id; // UUID for the company
  late String name; // Company name
  late String currency;
  // other company-specific fields (like fiscal settings, legal entity details)
}
