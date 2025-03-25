-- Sample Data for res_currency
INSERT INTO "res_currency" ("id", "name", "symbol", "rounding", "decimal_places", "active") VALUES
  ('550e8400-e29b-41d4-a716-446655440000', 'USD', '$', 1, 2, true),
  ('550e8400-e29b-41d4-a716-446655440001', 'EUR', '€', 1, 2, true);

-- Sample Data for res_company
INSERT INTO "res_company" ("id", "name", "currency_id", "active") VALUES
  ('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'ShitHot Inc.', '550e8400-e29b-41d4-a716-446655440000', true),
  ('6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'FuckOff Ltd.', '550e8400-e29b-41d4-a716-446655440001', true);

-- Sample Data for res_user
INSERT INTO "res_user" ("id", "company_id", "login", "password", "name", "email", "active") VALUES
  ('f47ac10b-58cc-4372-a567-0e02b2c3d479', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'johnny', 'hashed_shit', 'Johnny Bollocks', 'johnny@shithot.com', true),
  ('f47ac10b-58cc-4372-a567-0e02b2c3d480', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'sally', 'hashed_fuck', 'Sally Swears', 'sally@fuckoff.eu', true);

-- Sample Data for res_role
INSERT INTO "res_role" ("id", "company_id", "name", "description", "active") VALUES
  ('c4ca4238-a0b9-3382-8dcc-509a6f75849b', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'Admin', 'Full access, you twat', true),
  ('c81e728d-9d4c-0e5f-9e5e-7d2b1e8e9f7c', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'Sales', 'Sells shit, nothing else', true);

-- Sample Data for res_user_role_link
INSERT INTO "res_user_role_link" ("id", "user_id", "role_id") VALUES
  (uuid_generate_v4(), 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'c4ca4238-a0b9-3382-8dcc-509a6f75849b'),
  (uuid_generate_v4(), 'f47ac10b-58cc-4372-a567-0e02b2c3d480', 'c81e728d-9d4c-0e5f-9e5e-7d2b1e8e9f7c');

-- Sample Data for res_permission
INSERT INTO "res_permission" ("id", "company_id", "name", "model") VALUES
  (uuid_generate_v4(), '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'write_all', 'all'),
  (uuid_generate_v4(), '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'read_sales', 'quotation');

-- Sample Data for res_role_permission_link
INSERT INTO "res_role_permission_link" ("id", "role_id", "permission_id") VALUES
  (uuid_generate_v4(), 'c4ca4238-a0b9-3382-8dcc-509a6f75849b', (SELECT "id" FROM "res_permission" WHERE "name" = 'write_all')),
  (uuid_generate_v4(), 'c81e728d-9d4c-0e5f-9e5e-7d2b1e8e9f7c', (SELECT "id" FROM "res_permission" WHERE "name" = 'read_sales'));

-- Sample Data for res_partner
INSERT INTO "res_partner" ("id", "company_id", "currency_id", "name", "nick_name", "email", "phone", "is_customer", "active") VALUES
  ('d3d94468-2a9a-11d1-9e8e-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', '550e8400-e29b-41d4-a716-446655440000', 'PissPoor LLC', 'PissPoor', 'sales@pisspoor.com', '555-1234', true, true),
  ('d3d94468-2a9a-11d1-9e8e-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', '550e8400-e29b-41d4-a716-446655440001', 'WankBank GmbH', 'WankBank', 'info@wankbank.eu', '555-5678', true, true);

-- Sample Data for product_category
INSERT INTO "product_category" ("id", "company_id", "name", "active") VALUES
  ('e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'Gizmos', true),
  ('e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'Widgets', true);

-- Sample Data for res_uom
INSERT INTO "res_uom" ("id") VALUES
  ('f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8'),
  ('f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c9');

-- Sample Data for product_template
INSERT INTO "product_template" ("id", "company_id", "category_id", "default_code", "barcode", "sale_uom_id", "brand_name", "sale_ok") VALUES
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c8', 'GIZ001', '123456789012', 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8', 'ShiteTech', true),
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c9', 'WID001', '987654321098', 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c9', 'FuckTronics', true);

-- Sample Data for product_product
INSERT INTO "product_product" ("id", "company_id", "category_id", "template_id", "name", "barcode", "list_price", "standard_price", "type", "active", "sku", "stock", "base_scan_points") VALUES
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c8', 'a1b2c3d4-5e6f-11d1-c7d8-00c04fd430c8', 'Gizmo X1', '123456789012', 5000, 3000, 'product', true, 'GX1-001', 100, 10),
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'e4f7b2e0-3b1c-11d1-a9f0-00c04fd430c9', 'a1b2c3d4-5e6f-11d1-c7d8-00c04fd430c9', 'Widget Z9', '987654321098', 7500, 4500, 'product', true, 'WZ9-001', 50, 15);

-- Sample Data for product_pricelist
INSERT INTO "product_pricelist" ("id", "name", "currency") VALUES
  ('c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c8', 'Standard USD', 'USD'),
  ('c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c9', 'Euro Discount', 'EUR');

-- Sample Data for product_pricelist_item
INSERT INTO "product_pricelist_item" ("id", "pricelist_id", "product_id", "compute_price", "fixed_price", "min_quantity") VALUES
  (uuid_generate_v4(), 'c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c8', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 'fixed', 4500, 1),
  (uuid_generate_v4(), 'c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c9', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c9', 'fixed', 6000, 1);

-- Sample Data for quotation
INSERT INTO "quotation" ("id", "company_id", "partner_id", "currency_id", "reference_number", "invoice_date", "due_date", "status", "amount_total", "pricelist_id") VALUES
  ('d4e5f6a7-8b9c-11d1-f0a1-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c8', '550e8400-e29b-41d4-a716-446655440000', 'QUOT-001', '2025-03-25', '2025-04-01', 'draft', 10000, 'c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c8'),
  ('d4e5f6a7-8b9c-11d1-f0a1-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c9', '550e8400-e29b-41d4-a716-446655440001', 'QUOT-002', '2025-03-25', '2025-04-01', 'sent', 15000, 'c3d4e5f6-7a8b-11d1-e9f0-00c04fd430c9');

-- Sample Data for quotation_item (NOW WITH quotation_id!)
INSERT INTO "quotation_item" ("id", "quotation_id", "company_id", "product_id", "quantity", "unit_price", "price_subtotal") VALUES
  (uuid_generate_v4(), 'd4e5f6a7-8b9c-11d1-f0a1-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 2, 5000, 10000),
  (uuid_generate_v4(), 'd4e5f6a7-8b9c-11d1-f0a1-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c9', 2, 7500, 15000);

-- Sample Data for account_invoice (invoice_number auto-generated by trigger)
INSERT INTO "account_invoice" ("id", "company_id", "partner_id", "currency_id", "invoice_date", "due_date", "state", "amount_total", "amount_residual", "tax_amount") VALUES
  ('e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c8', '550e8400-e29b-41d4-a716-446655440000', '2025-03-25', '2025-04-01', 'open', 10800, 10800, 800),
  ('e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c9', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c9', '550e8400-e29b-41d4-a716-446655440001', '2025-03-25', '2025-04-01', 'paid', 16200, 0, 1200);

-- Sample Data for account_invoice_line
INSERT INTO "account_invoice_line" ("id", "invoice_id", "product_id", "name", "quantity", "unit_price", "price_subtotal") VALUES
  (uuid_generate_v4(), 'e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c8', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 'Gizmo X1', 2, 5000, 10000),
  (uuid_generate_v4(), 'e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c9', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c9', 'Widget Z9', 2, 7500, 15000);

-- Sample Data for account_payment
INSERT INTO "account_payment" ("id", "company_id", "invoice_id", "partner_id", "currency_id", "amount", "payment_date", "payment_method", "transaction_id", "state") VALUES
  (uuid_generate_v4(), '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c9', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c9', '550e8400-e29b-41d4-a716-446655440001', 16200, '2025-03-25', 'card', 'TXN-123456', 'posted');

-- Sample Data for product_qr_code
INSERT INTO "product_qr_code" ("id", "product_id", "qr_code", "generated_at", "scanned_by_id", "scanned_at", "is_scanned") VALUES
  (uuid_generate_v4(), 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 'QR-GX1-001', '2025-03-25 10:00:00', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c8', '2025-03-25 12:00:00', true);

-- Sample Data for product_qr_scan_log
INSERT INTO "product_qr_scan_log" ("id", "partner_id", "product_id", "qr_code", "scanned_at", "points_awarded") VALUES
  (uuid_generate_v4(), 'd3d94468-2a9a-11d1-9e8e-00c04fd430c8', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 'QR-GX1-001', '2025-03-25 12:00:00', 10);

-- Sample Data for product_points
INSERT INTO "product_points" ("id", "product_id", "points") VALUES
  (uuid_generate_v4(), 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8', 10),
  (uuid_generate_v4(), 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c9', 15);




-- Sample Data for subscription_plan
INSERT INTO "subscription_plan" ("id", "name", "description", "price", "currency_id", "max_users", "max_invoices", "is_active") VALUES
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430d0', 'Basic', 'Cheap as fuck, basic billing', 900, '550e8400-e29b-41d4-a716-446655440000', 1, 10, true),
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430d1', 'Pro', 'More shit, more users', 2900, '550e8400-e29b-41d4-a716-446655440000', 5, 50, true);

-- Sample Data for company_subscription
INSERT INTO "company_subscription" ("id", "company_id", "plan_id", "start_date", "end_date", "status", "stripe_subscription_id") VALUES
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430d0', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'a1b2c3d4-5e6f-11d1-c7d8-00c04fd430d0', '2025-03-25', '2025-04-25', 'active', 'sub_123456789'),
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430d1', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', 'a1b2c3d4-5e6f-11d1-c7d8-00c04fd430d1', '2025-03-25', '2025-04-25', 'trial', NULL);

-- Sample Data for subscription_usage
INSERT INTO "subscription_usage" ("id", "subscription_id", "period_start", "period_end", "invoice_count", "user_count") VALUES
  (uuid_generate_v4(), 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430d0', '2025-03-25', '2025-04-25', 1, 1),
  (uuid_generate_v4(), 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430d1', '2025-03-25', '2025-04-25', 1, 1);

-- Sample Data for account_payment (linked to subscription)
INSERT INTO "account_payment" ("id", "company_id", "invoice_id", "subscription_id", "partner_id", "currency_id", "amount", "payment_date", "payment_method", "transaction_id", "state") VALUES
  (uuid_generate_v4(), '6ba7b810-9dad-11d1-80b4-00c04fd430c8', NULL, 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430d0', 'd3d94468-2a9a-11d1-9e8e-00c04fd430c8', '550e8400-e29b-41d4-a716-446655440000', 900, '2025-03-25', 'card', 'TXN-987654', 'posted');


-- Invoice Print Templates
INSERT INTO "invoice_print_template" ("id", "name", "format", "template_data", "is_active") VALUES
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430e0', 'Thermal 80mm', 'thermal', 'ESC/POS: <init><bold>INVOICE</bold><line>Item: {name} Qty: {qty}</line>', true),
  ('a1b2c3d4-5e6f-11d1-c7d8-00c04fd430e1', 'A4 Standard', 'a4', '<html><h1>Invoice</h1><p>{name} - {qty}</p></html>', true);

-- Printer/Scanner Config
INSERT INTO "printer_scanner_config" ("id", "company_id", "user_id", "device_type", "name", "connection_type", "address", "is_default") VALUES
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430e0', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'printer', 'Epson TM-T20', 'bluetooth', '00:11:22:33:44:55', true),
  ('b2c3d4e5-6f7a-11d1-d8e9-00c04fd430e1', '6ba7b811-9dad-11d1-80b4-00c04fd430c9', NULL, 'printer', 'HP LaserJet', 'network', '192.168.1.100', true);

-- Invoice Print Queue
INSERT INTO "invoice_print_queue" ("id", "invoice_id", "template_id", "printer_id", "status", "queued_at") VALUES
  (uuid_generate_v4(), 'e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c8', 'a1b2c3d4-5e6f-11d1-c7d8-00c04fd430e0', 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430e0', 'pending', '2025-03-25 14:00:00');


  -- Add Units to res_uom
UPDATE "res_uom" SET "id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8' WHERE "id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8'; -- kg
UPDATE "res_uom" SET "id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c9' WHERE "id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c9'; -- lb

-- Weighable Product
UPDATE "product_product" 
SET "is_weighable" = true, 
    "weight_uom_id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8', 
    "list_price" = 500 -- $5/kg
WHERE "id" = 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8'; -- Gizmo X1 now weighable

-- Scale Config
INSERT INTO "scale_config" ("id", "company_id", "name", "connection_type", "address", "is_default") VALUES
  ('c3d4e5f6-7a8b-11d1-e9f0-00c04fd430e0', '6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'Mettler Toledo PS60', 'bluetooth', '00:11:22:33:44:66', true);

-- Invoice with Weight
UPDATE "account_invoice_line" 
SET "weight" = 2.34, 
    "weight_uom_id" = 'f5e6c3f0-4c2d-11d1-b0a1-00c04fd430c8', 
    "price_subtotal" = 1170 -- 2.34 kg * $5/kg
WHERE "invoice_id" = 'e5f6a7b8-9c0d-11d1-a1b2-00c04fd430c8' AND "product_id" = 'b2c3d4e5-6f7a-11d1-d8e9-00c04fd430c8';