import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';
import 'package:path/path.dart';

// Define column types as constants for reusability
const ColumnType uuidType =
    ColumnType.text; // 'TEXT'; // UUIDs are stored as text in SQLite
const ColumnType integerType = ColumnType.integer; // 'INTEGER';
const ColumnType textType = ColumnType.text; //'TEXT';
const ColumnType booleanType =
    ColumnType.integer; //'INTEGER'; // SQLite uses 0/1 for booleans
const ColumnType timestampType =
    ColumnType.text; //'TEXT'; // ISO 8601 strings for timestamps

// Define the schema for PowerSync
const Schema schema = Schema([
  Table('res_currency', [
    // Column('id', uuidType),
    Column('name', textType),
    Column('symbol', textType),
    Column('rounding', integerType),
    Column('decimal_places', integerType),
    Column('active', booleanType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
  ]),
  Table('res_curreency_rate', [
    Column('currency_id', uuidType),
    Column('rate', integerType),
  ]),
  Table('res_company', [
    // Column('id', uuidType),
    Column('name', textType),
    Column('currency_id', uuidType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
    Column('active', booleanType),
  ]),
  Table('res_user', [
    Column('name', textType),
    Column('email', textType),
    Column('phone', textType),
  ]),
  Table('res_role', [
    Column('name', textType),
    Column('description', textType),
  ]),
  Table('res_user_role', [
    Column('user_id', uuidType),
    Column('role_id', uuidType),
  ]),
  Table('res_permission', [
    Column('name', textType),
    Column('model', textType),
  ]),
  Table('res_role_permission', [
    Column('role_id', uuidType),
    Column('permission_id', uuidType),
  ]),
  Table('res_partner', [
    // Column('id', uuidType),
    Column('company_id', uuidType),
    Column('currency_id', uuidType),
    Column('name', textType),
    Column('email', textType),
    Column('phone', textType),
    Column('is_company', booleanType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
    Column('active', booleanType),
  ]),
  Table('product_category', [
    // Column('id', uuidType),
    Column('company_id', uuidType),
    Column('name', textType),
    Column('parent_id', uuidType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
    Column('active', booleanType),
  ]),
  Table('product_template', [
    Column('category_id', uuidType),
    Column('default_code', textType),
    Column('barcode', textType),
    Column('sale_uom_id', uuidType),
    Column('purchase_uom_id', uuidType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
    Column('to_weigh', booleanType),
    Column('brand_name', textType),
    Column('print_override', booleanType),
    Column('printer_name', textType),
    Column('internal_note', textType),
    Column('sales_note', textType),
    Column('sale_ok', booleanType),
    Column('number_of_variants', integerType),
  ]),
  Table('product_product', [
    // Column('id', uuidType),
    Column('company_id', uuidType),
    Column('category_id', uuidType),
    Column('name', textType),
    Column('list_price', integerType),
    Column('standard_price', integerType),
    Column('type', textType),
    Column('create_date', timestampType),
    Column('write_date', timestampType),
    Column('active', booleanType),
    Column('image', textType),
    Column('barcode', textType),
    Column('default_code', textType),
    Column('base_scan_points', integerType),
  ]),
  Table('product_pricelist', [
    Column('id', uuidType),
    Column('name', textType),
    Column(
      'currency',
      textType,
    ),
  ]),
  Table('product_pricelist', [
    Column('id', uuidType),
    Column('name', textType),
    Column(
      'currency',
      textType,
    ),
  ]),
  Table('product_pricelist_item', [
    Column('id', uuidType),
    Column('pricelist_id', uuidType),
    Column('product_id', uuidType),
    Column('compute_price', textType),
    Column(
      'min_quantity',
      integerType,
    ),
    Column(
      'max_quantity',
      integerType,
    ),
    Column('fixed_price', integerType),
    Column('percentage_discount', integerType),
    Column('formula_expression', textType),
    Column('min_margin', integerType),
    Column('max_margin', integerType),
  ]),
  Table('product_qr_code', [
    Column('id', uuidType),
    Column('product_id', uuidType),
    Column(
      'qr_code',
      textType,
    ),
    Column(
      'generated_at',
      timestampType,
    ),
    Column('expires_at', timestampType),
    Column('scanned_by_id', uuidType),
    Column('scanned_at', timestampType),
    Column(
      'is_scanned',
      booleanType,
    ),
  ]),
  Table('product_qr_scan_log', [
    Column('id', uuidType),
    Column('partner_id', uuidType),
    Column('product_id', uuidType),
    Column('qr_code', textType),
    Column(
      'scanned_at',
      timestampType,
    ),
    Column(
      'points_awarded',
      integerType,
    ),
  ]),
  Table('product_points', [
    Column('id', uuidType),
    Column('product_id', uuidType),
    Column(
      'points',
      integerType,
    ),
  ]),
  Table('product_reward', [
    Column('id', uuidType),
    Column('name', textType),
    Column('required_points', integerType),
    Column(
      'is_active',
      booleanType,
    ),
  ]),
  Table('product_points_redemption', [
    Column('id', uuidType),
    Column('partner_id', uuidType),
    Column('reward_id', uuidType),
    Column(
      'redeemed_at',
      timestampType,
    ),
    Column('points_used', integerType),
  ]),
  Table('quotation', [
    Column('id', uuidType),
    Column('company_id', uuidType),
    Column('partner_id', uuidType),
    Column('currency_id', uuidType),
    Column(
      'invoice_date',
      textType,
    ),
    Column('due_date', textType),
    Column(
      'status',
      textType,
    ),
    Column(
      'amount_total',
      integerType,
    ),
    Column('pricelist_id', uuidType),
    Column(
      'create_date',
      timestampType,
    ),
    Column(
      'write_date',
      timestampType,
    ),
  ]),
  Table('quotation_item', [
    Column('id', uuidType),
    Column('company_id', uuidType),
    Column('product_id', uuidType),
    Column('quantity', integerType),
    Column('unit_price', integerType),
    Column('discount', integerType),
    Column('price_subtotal', integerType),
  ]),
  Table('account_invoice', [
    Column('id', uuidType),
    Column('company_id', uuidType),
    Column('partner_id', uuidType),
    Column('currency_id', uuidType),
    Column(
      'invoice_date',
      textType,
    ),
    Column('due_date', textType),
    Column('state', textType),
    Column(
      'amount_total',
      integerType,
    ),
    Column(
      'amount_residual',
      integerType,
    ),
    Column(
      'create_date',
      timestampType,
    ),
    Column(
      'write_date',
      timestampType,
    ),
  ]),
  Table('account_invoice_line', [
    Column('id', uuidType),
    Column('invoice_id', uuidType),
    Column('product_id', uuidType),
    Column('name', textType),
    Column(
      'quantity',
      integerType,
    ),
    Column(
      'unit_price',
      integerType,
    ),
    Column('discount', integerType),
    Column(
      'price_subtotal',
      integerType,
    ),
    Column(
      'create_date',
      timestampType,
    ),
    Column(
      'write_date',
      timestampType,
    ),
  ]),
  Table('account_payment', [
    Column('id', uuidType),
    Column('company_id', uuidType),
    Column('invoice_id', uuidType),
    Column('partner_id', uuidType),
    Column('currency_id', uuidType),
    Column(
      'amount',
      integerType,
    ),
    Column(
      'payment_date',
      textType,
    ),
    Column('payment_method', textType),
    Column('state', textType),
    Column(
      'create_date',
      timestampType,
    ),
    Column(
      'write_date',
      timestampType,
    ),
  ]),
]);

// // Example instantiation of PowerSyncDatabase
// // You'll need to set this up in your app
// Future<PowerSyncDatabase> openDatabase() async {
//   final dir = await getApplicationDocumentsDirectory();
//   final path = join(dir.path, 'billing_app.db');

//   final db = PowerSyncDatabase(
//     schema: schema,
//     path: path,
//   );

//   await db.initialize();
//   return db;
// }
