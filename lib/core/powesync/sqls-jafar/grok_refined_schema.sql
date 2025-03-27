-- Core Tables with Updated Constraints and Indexes

CREATE TABLE "res_currency" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(3) NOT NULL,
  "symbol" VARCHAR(5) NOT NULL,
  "rounding" INTEGER NOT NULL DEFAULT 1 CHECK (rounding > 0),
  "decimal_places" INTEGER NOT NULL DEFAULT 2 CHECK (decimal_places >= 0),
  "active" BOOLEAN DEFAULT true,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_currency_rate" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "currency_id" UUID NOT NULL,
  "rate" DECIMAL(12,6) NOT NULL CHECK (rate > 0),
  "date" TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP), -- Changed to TIMESTAMP for precision
  "company_id" UUID NOT NULL
);

CREATE TABLE "res_company" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(255) NOT NULL,
  "currency_id" UUID NOT NULL,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "active" BOOLEAN DEFAULT true
);

CREATE TABLE "res_user" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "login" VARCHAR(255) NOT NULL,
  "password" VARCHAR(255),
  "name" VARCHAR(255) NOT NULL,
  "email" VARCHAR(255),
  "language_code" VARCHAR(10) DEFAULT 'en',
  "active" BOOLEAN DEFAULT true,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_role" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "description" TEXT,
  "active" BOOLEAN DEFAULT true,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_user_role_link" ( -- Renamed for consistency
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "user_id" UUID NOT NULL,
  "role_id" UUID NOT NULL,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_permission" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "model" VARCHAR(255) NOT NULL,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_role_permission_link" ( -- Renamed for consistency
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "role_id" UUID NOT NULL,
  "permission_id" UUID NOT NULL,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "res_partner" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "currency_id" UUID,
  "parent_id" UUID,
  "name" VARCHAR(255) NOT NULL,
  "nick_name" VARCHAR(255) UNIQUE NOT NULL,
  "profile_picture" VARCHAR(255),
  "email" VARCHAR(255),
  "phone" VARCHAR(255),
  "is_company" BOOLEAN DEFAULT false,
  "is_customer" BOOLEAN DEFAULT false,
  "is_vendor" BOOLEAN DEFAULT false,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "active" BOOLEAN DEFAULT true,
  "pricelist_id" UUID
);

-- Product Tables

CREATE TABLE "product_category" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "parent_id" UUID,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "active" BOOLEAN DEFAULT true
);
CREATE TYPE unit_type AS ENUM ('Quantity', 'Length', 'Weight', 'Other');

CREATE TABLE "res_uom" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "unit_name" VARCHAR(50) NOT NULL UNIQUE,
  "unit_symbol" VARCHAR(10) NOT NULL UNIQUE,        -- Short symbol (e.g., "m", "dz")
  "unit_type" unit_type not null, "base_unit_id" UUID NULL,                          -- Reference to base unit for conversion (e.g., cm -> m)
  "conversion_factor" DECIMAL(10, 4) NULL,          -- Factor to convert to base unit (e.g., 1 cm = 0.01 m)
  "is_active" BOOLEAN DEFAULT TRUE,                 -- Enable/disable units as needed
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "fk_base_unit" FOREIGN KEY ("base_unit_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL
  
);

CREATE TABLE "product_template" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "category_id" UUID NOT NULL,
  "default_code" VARCHAR(255),
  "barcode" VARCHAR(255),
  "sale_uom_id" UUID,
  "purchase_uom_id" UUID,
  "weight_uom_id" UUID,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "is_weighable" BOOLEAN DEFAULT FALSE,
  "brand_name" VARCHAR(255),
  "print_override" BOOLEAN,
  "printer_name" VARCHAR(255),
  "internal_note" VARCHAR(255),
  "sales_note" VARCHAR(255),
  "sale_ok" BOOLEAN,
  "number_of_variants" INT DEFAULT 0
);

-- WEIGHTS SCALE PRODUCTS 
CREATE TABLE "scale_config" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL REFERENCES "res_company" ("id") ON DELETE CASCADE,
  "user_id" UUID REFERENCES "res_user" ("id") ON DELETE SET NULL, -- Optional per-user
  "name" VARCHAR(255) NOT NULL, -- e.g., 'Mettler Toledo PS60'
  "connection_type" VARCHAR(50) NOT NULL CHECK (connection_type IN ('bluetooth', 'usb', 'serial')), -- Scale connection
  "address" VARCHAR(255), -- Bluetooth MAC, USB port, etc.
  "is_default" BOOLEAN DEFAULT false,
  "status" VARCHAR(50) DEFAULT 'unknown' CHECK (status IN ('unknown', 'connected', 'disconnected')),
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "product_attribute" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "sequence" INT NOT NULL -- Fixed typo 'in' to 'int'
);

CREATE TABLE "product_attribute_value" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "attribute_id" UUID NOT NULL,
  "value" VARCHAR(255) NOT NULL -- Added NOT NULL
);

CREATE TABLE "product_variant_combination" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "attribute_value_id" UUID NOT NULL,
  "variant_id" UUID NOT NULL -- Renamed from product_id for clarity
);

CREATE TABLE "product_product" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "category_id" UUID NOT NULL,
  "template_id" UUID,
  "name" VARCHAR(255) NOT NULL,
  "uom_id" UUID,
  "weight_uom_id" UUID,
  "default_code" VARCHAR(255),
  "barcode" VARCHAR(255) UNIQUE ,
  "list_price" BIGINT NOT NULL DEFAULT 0 CHECK (list_price >= 0),
  "standard_price" BIGINT NOT NULL DEFAULT 0 CHECK (standard_price >= 0),
  "type" VARCHAR(50),
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "active" BOOLEAN DEFAULT true,
  "discontinued" BOOLEAN DEFAULT false, -- Added for soft deletes
  "sku" VARCHAR(255),
  "image" VARCHAR(255),
  "stock" INT DEFAULT 0,
  "base_scan_points" INT NOT NULL DEFAULT 0
);

CREATE TABLE "product_translation" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "product_id" UUID NOT NULL REFERENCES "product_product" ("id") ON DELETE CASCADE,
  "language_code" VARCHAR(10) NOT NULL, -- e.g., 'en', 'ar'
  "name" VARCHAR(255) NOT NULL, -- Translated name
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  UNIQUE ("product_id", "language_code") -- One translation per product per language
);

CREATE TABLE "product_pricelist" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(255) NOT NULL,
  "currency" VARCHAR(255) NOT NULL DEFAULT 'USD'
);

CREATE TABLE "product_pricelist_item" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "pricelist_id" UUID NOT NULL,
  "product_id" UUID,
  "compute_price" VARCHAR(255) CHECK (compute_price IN ('fixed', 'percentage', 'markup', 'formula')),
  "min_quantity" INT DEFAULT 1 CHECK (min_quantity >= 1),
  "max_quantity" INT DEFAULT 1 CHECK (max_quantity >= min_quantity),
  "fixed_price" INT NOT NULL DEFAULT 0, -- Added NOT NULL
  "percentage_discount" INT,
  "formula_expression" VARCHAR(255),
  "min_margin" INT,
  "max_margin" INT
);

CREATE TABLE "product_qr_code" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "product_id" UUID NOT NULL,
  "qr_code" VARCHAR(255) UNIQUE NOT NULL,
  "generated_at" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "expires_at" TIMESTAMP,
  "scanned_by_id" UUID,
  "scanned_at" TIMESTAMP,
  "is_scanned" BOOLEAN DEFAULT false
);

CREATE TABLE "product_qr_scan_log" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "partner_id" UUID NOT NULL,
  "product_id" UUID NOT NULL,
  "qr_code" VARCHAR(255) NOT NULL,
  "scanned_at" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "points_awarded" INTEGER NOT NULL DEFAULT 0 CHECK (points_awarded >= 0)
);

CREATE TABLE "product_points" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "product_id" UUID NOT NULL,
  "points" INTEGER NOT NULL DEFAULT 10 CHECK (points >= 0)
);

CREATE TABLE "product_reward" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(255) NOT NULL,
  "required_points" INTEGER NOT NULL CHECK (required_points > 0),
  "is_active" BOOLEAN DEFAULT true
);

CREATE TABLE "product_points_redemption" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "partner_id" UUID,
  "reward_id" UUID,
  "redeemed_at" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "points_used" INTEGER NOT NULL CHECK (points_used > 0)
);

-- Billing Tables

CREATE TABLE "quotation" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "partner_id" UUID NOT NULL,
  "currency_id" UUID NOT NULL,
  "reference_number" VARCHAR(50) UNIQUE NOT NULL, -- Added
  "invoice_date" DATE NOT NULL DEFAULT (CURRENT_DATE),
  "due_date" DATE NOT NULL,
  "status" VARCHAR(20) CHECK (status IN ('draft', 'sent', 'approved', 'converted')),
  "amount_total" BIGINT NOT NULL DEFAULT 0 CHECK (amount_total >= 0),
  "pricelist_id" UUID,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);



CREATE TABLE "quotation_item" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "quotation_id" UUID NOT NULL, -- Added this bad boy
  "company_id" UUID NOT NULL,
  "product_id" UUID,
  "quantity" INT NOT NULL CHECK (quantity > 0),
  "unit_price" INT NOT NULL DEFAULT 0,
  "discount" INT,
  "price_subtotal" INT NOT NULL DEFAULT 0 CHECK (price_subtotal >= 0),
  "uom_id" UUID,
  "weight_uom_id" UUID,
  "weight" DECIMAL(12,6)
);

CREATE TABLE "account_invoice" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "partner_id" UUID NOT NULL,
  "currency_id" UUID NOT NULL,
  "invoice_number" VARCHAR(50) UNIQUE NOT NULL, -- Added
  "invoice_date" DATE NOT NULL DEFAULT (CURRENT_DATE),
  "due_date" DATE NOT NULL,
  "state" VARCHAR(20) CHECK (state IN ('draft', 'open', 'paid', 'cancelled')),
  "amount_total" BIGINT NOT NULL DEFAULT 0 CHECK (amount_total >= 0),
  "amount_residual" BIGINT NOT NULL DEFAULT 0 CHECK (amount_residual >= 0),
  "tax_amount" BIGINT NOT NULL DEFAULT 0 CHECK (tax_amount >= 0), -- Added
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "account_invoice_line" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "invoice_id" UUID NOT NULL,
  "product_id" UUID,
  "name" TEXT NOT NULL,
  "quantity" BIGINT NOT NULL DEFAULT 1 CHECK (quantity > 0), -- Adjusted default
  "unit_price" BIGINT NOT NULL DEFAULT 0 CHECK (unit_price >= 0),
  "discount" INT,
  "price_subtotal" BIGINT NOT NULL DEFAULT 0 CHECK (price_subtotal >= 0),
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "uom_id" UUID,
  "weight_uom_id" UUID,
  "weight" DECIMAL(12,6)


);

CREATE TABLE "account_payment" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL,
  "invoice_id" UUID,
  "partner_id" UUID NOT NULL,
  "currency_id" UUID NOT NULL,
  "subscription_id" UUID, -- Added for recurring payments
  "amount" BIGINT NOT NULL DEFAULT 0 CHECK (amount >= 0),
  "payment_date" DATE NOT NULL DEFAULT (CURRENT_DATE),
  "payment_method" VARCHAR(255) NOT NULL, -- Added NOT NULL
  "transaction_id" VARCHAR(255), -- Added for payment gateways
  "state" VARCHAR(20) CHECK (state IN ('draft', 'posted', 'cancelled')),
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- Audit Log Table
CREATE TABLE "audit_log" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "table_name" VARCHAR(255) NOT NULL,
  "record_id" UUID NOT NULL,
  "action" VARCHAR(50) NOT NULL CHECK (action IN ('INSERT', 'UPDATE', 'DELETE')),
  "user_id" UUID REFERENCES "res_user" ("id") ON DELETE SET NULL,
  "changed_at" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "old_values" JSONB,
  "new_values" JSONB
);

-- Subscription Tables
CREATE TABLE "subscription_plan" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(255) NOT NULL, -- e.g., 'Basic', 'Pro'
  "description" TEXT,
  "price" BIGINT NOT NULL CHECK (price >= 0), -- Monthly cost in cents (e.g., 900 = $9)
  "currency_id" UUID NOT NULL REFERENCES "res_currency" ("id") ON DELETE RESTRICT,
  "max_users" INT NOT NULL CHECK (max_users >= 1), -- User limit per plan
  "max_invoices" INT NOT NULL CHECK (max_invoices >= 0), -- Invoice limit per month (0 = unlimited)
  "is_active" BOOLEAN DEFAULT true,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "company_subscription" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL REFERENCES "res_company" ("id") ON DELETE CASCADE,
  "plan_id" UUID NOT NULL REFERENCES "subscription_plan" ("id") ON DELETE RESTRICT,
  "start_date" DATE NOT NULL DEFAULT (CURRENT_DATE),
  "end_date" DATE NOT NULL, -- Renewal or expiry date
  "status" VARCHAR(20) NOT NULL CHECK (status IN ('active', 'trial', 'expired', 'cancelled')),
  "stripe_subscription_id" VARCHAR(255), -- For Stripe integration
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "subscription_usage" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "subscription_id" UUID NOT NULL REFERENCES "company_subscription" ("id") ON DELETE CASCADE,
  "period_start" DATE NOT NULL,
  "period_end" DATE NOT NULL,
  "invoice_count" INT NOT NULL DEFAULT 0 CHECK (invoice_count >= 0),
  "user_count" INT NOT NULL DEFAULT 0 CHECK (user_count >= 0),
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- Billing and Printing related.
-- Stores available templates (thermal, A5, A4).
CREATE TABLE "invoice_print_template" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" VARCHAR(255) NOT NULL, -- e.g., 'Thermal 80mm', 'A4 Standard'
  "format" VARCHAR(50) NOT NULL CHECK (format IN ('thermal', 'a5', 'a4')), -- Standardize formats
  "template_data" TEXT NOT NULL, -- JSON/HTML/PDF template (e.g., HTML for A4, ESC/POS for thermal)
  "is_active" BOOLEAN DEFAULT true,
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);


-- 2. Printer/Scanner Config Table
-- Stores user’s device info per company.
CREATE TABLE "printer_scanner_config" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "company_id" UUID NOT NULL REFERENCES "res_company" ("id") ON DELETE CASCADE,
  "user_id" UUID REFERENCES "res_user" ("id") ON DELETE SET NULL, -- Optional per-user config
  "device_type" VARCHAR(50) NOT NULL CHECK (device_type IN ('printer', 'scanner')), -- Printer or scanner
  "name" VARCHAR(255) NOT NULL, -- e.g., 'Epson TM-T20'
  "connection_type" VARCHAR(50) NOT NULL CHECK (connection_type IN ('bluetooth', 'wifi', 'usb', 'network')), -- How it connects
  "address" VARCHAR(255), -- IP for network, MAC for Bluetooth, etc.
  "is_default" BOOLEAN DEFAULT false, -- Default printer/scanner for user/company
  "status" VARCHAR(50) DEFAULT 'unknown' CHECK (status IN ('unknown', 'connected', 'disconnected')), -- Device state
  "create_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "write_date" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- Invoice Print Queue Table
-- Queues print jobs for offline scenarios.
CREATE TABLE "invoice_print_queue" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "invoice_id" UUID NOT NULL REFERENCES "account_invoice" ("id") ON DELETE CASCADE,
  "template_id" UUID NOT NULL REFERENCES "invoice_print_template" ("id") ON DELETE RESTRICT,
  "printer_id" UUID REFERENCES "printer_scanner_config" ("id") ON DELETE SET NULL,
  "status" VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'printing', 'completed', 'failed')),
  "queued_at" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  "completed_at" TIMESTAMP,
  "error_message" TEXT
);


-- Unique Indexes
CREATE UNIQUE INDEX "unique_currency_name" ON "res_currency" ("name");
CREATE UNIQUE INDEX "unique_rate_per_day" ON "res_currency_rate" ("currency_id", "date", "company_id");
CREATE UNIQUE INDEX "unique_user_login" ON "res_user" ("company_id", "login");
CREATE UNIQUE INDEX "unique_role_name" ON "res_role" ("company_id", "name");
CREATE UNIQUE INDEX "unique_user_role" ON "res_user_role_link" ("user_id", "role_id");
CREATE UNIQUE INDEX "unique_permission_name" ON "res_permission" ("company_id", "name", "model");
CREATE UNIQUE INDEX "unique_role_permission" ON "res_role_permission_link" ("role_id", "permission_id");
CREATE UNIQUE INDEX "unique_partner_email" ON "res_partner" ("company_id", "email");

-- Performance Indexes
CREATE INDEX "idx_product_product_sku" ON "product_product" ("sku");
CREATE INDEX "idx_account_invoice_partner" ON "account_invoice" ("partner_id", "invoice_date");
CREATE INDEX "idx_quotation_partner" ON "quotation" ("partner_id", "status");

-- Foreign Keys with Updated Cascade Strategy
ALTER TABLE "res_partner" ADD FOREIGN KEY ("parent_id") REFERENCES "res_partner" ("id") ON DELETE SET NULL;
ALTER TABLE "res_partner" ADD FOREIGN KEY ("pricelist_id") REFERENCES "product_pricelist" ("id") ON DELETE SET NULL;


ALTER TABLE "product_template" ADD FOREIGN KEY ("sale_uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "product_template" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE SET NULL;
ALTER TABLE "product_template" ADD FOREIGN KEY ("category_id") REFERENCES "product_category" ("id") ON DELETE SET NULL;
ALTER TABLE "product_attribute_value" ADD FOREIGN KEY ("attribute_id") REFERENCES "product_attribute" ("id") ON DELETE CASCADE;
ALTER TABLE "product_variant_combination" ADD FOREIGN KEY ("attribute_value_id") REFERENCES "product_attribute_value" ("id") ON DELETE CASCADE;
ALTER TABLE "product_variant_combination" ADD FOREIGN KEY ("variant_id") REFERENCES "product_product" ("id") ON DELETE CASCADE;
ALTER TABLE "product_product" ADD FOREIGN KEY ("template_id") REFERENCES "product_template" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_pricelist_item" ADD FOREIGN KEY ("pricelist_id") REFERENCES "product_pricelist" ("id") ON DELETE CASCADE;
ALTER TABLE "product_pricelist_item" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE SET NULL;
ALTER TABLE "product_qr_code" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_qr_code" ADD FOREIGN KEY ("scanned_by_id") REFERENCES "res_partner" ("id") ON DELETE SET NULL;
ALTER TABLE "product_qr_scan_log" ADD FOREIGN KEY ("partner_id") REFERENCES "res_partner" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_qr_scan_log" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_qr_scan_log" ADD FOREIGN KEY ("qr_code") REFERENCES "product_qr_code" ("qr_code") ON DELETE RESTRICT;
ALTER TABLE "product_points" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_points_redemption" ADD FOREIGN KEY ("partner_id") REFERENCES "res_partner" ("id") ON DELETE SET NULL;
ALTER TABLE "product_points_redemption" ADD FOREIGN KEY ("reward_id") REFERENCES "product_reward" ("id") ON DELETE SET NULL;
ALTER TABLE "quotation" ADD FOREIGN KEY ("pricelist_id") REFERENCES "product_pricelist" ("id") ON DELETE SET NULL;
ALTER TABLE "quotation" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "quotation" ADD FOREIGN KEY ("partner_id") REFERENCES "res_partner" ("id") ON DELETE RESTRICT;
ALTER TABLE "quotation" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "quotation_item" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE RESTRICT;
ALTER TABLE "quotation_item" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "quotation_item" ADD FOREIGN KEY ("quotation_id") REFERENCES "quotation" ("id") ON DELETE CASCADE;
ALTER TABLE "res_company" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_user" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_role" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_user_role_link" ADD FOREIGN KEY ("user_id") REFERENCES "res_user" ("id") ON DELETE CASCADE;
ALTER TABLE "res_user_role_link" ADD FOREIGN KEY ("role_id") REFERENCES "res_role" ("id") ON DELETE CASCADE;
ALTER TABLE "res_permission" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_role_permission_link" ADD FOREIGN KEY ("role_id") REFERENCES "res_role" ("id") ON DELETE CASCADE;
ALTER TABLE "res_role_permission_link" ADD FOREIGN KEY ("permission_id") REFERENCES "res_permission" ("id") ON DELETE CASCADE;
ALTER TABLE "res_partner" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_partner" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE SET NULL;
ALTER TABLE "product_category" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_category" ADD FOREIGN KEY ("parent_id") REFERENCES "product_category" ("id") ON DELETE SET NULL;
ALTER TABLE "product_product" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_product" ADD FOREIGN KEY ("category_id") REFERENCES "product_category" ("id") ON DELETE RESTRICT;
ALTER TABLE "product_product" ADD FOREIGN KEY ("uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "account_invoice" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_invoice" ADD FOREIGN KEY ("partner_id") REFERENCES "res_partner" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_invoice" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_invoice_line" ADD FOREIGN KEY ("invoice_id") REFERENCES "account_invoice" ("id") ON DELETE CASCADE;
ALTER TABLE "account_invoice_line" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_payment" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_payment" ADD FOREIGN KEY ("invoice_id") REFERENCES "account_invoice" ("id") ON DELETE SET NULL;
ALTER TABLE "account_payment" ADD FOREIGN KEY ("partner_id") REFERENCES "res_partner" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_payment" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "account_payment" ADD FOREIGN KEY ("subscription_id") REFERENCES "company_subscription" ("id") ON DELETE SET NULL;

ALTER TABLE "res_currency_rate" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "res_currency_rate" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE RESTRICT;


ALTER TABLE "subscription_plan" ADD FOREIGN KEY ("currency_id") REFERENCES "res_currency" ("id") ON DELETE RESTRICT;
ALTER TABLE "company_subscription" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE CASCADE;
ALTER TABLE "company_subscription" ADD FOREIGN KEY ("plan_id") REFERENCES "subscription_plan" ("id") ON DELETE RESTRICT;
ALTER TABLE "subscription_usage" ADD FOREIGN KEY ("subscription_id") REFERENCES "company_subscription" ("id") ON DELETE CASCADE;

-- print related.
ALTER TABLE "printer_scanner_config" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE CASCADE;
ALTER TABLE "printer_scanner_config" ADD FOREIGN KEY ("user_id") REFERENCES "res_user" ("id") ON DELETE SET NULL;
ALTER TABLE "invoice_print_queue" ADD FOREIGN KEY ("invoice_id") REFERENCES "account_invoice" ("id") ON DELETE CASCADE;
ALTER TABLE "invoice_print_queue" ADD FOREIGN KEY ("template_id") REFERENCES "invoice_print_template" ("id") ON DELETE RESTRICT;
ALTER TABLE "invoice_print_queue" ADD FOREIGN KEY ("printer_id") REFERENCES "printer_scanner_config" ("id") ON DELETE SET NULL;


-- Comments
COMMENT ON COLUMN "res_partner"."parent_id" IS 'on delete set null';
COMMENT ON TABLE "product_pricelist_item" IS '(pricelist_id, product_id, min_quantity) -- Ensure no duplicate rules';
COMMENT ON COLUMN "product_pricelist_item"."compute_price" IS 'compute_price IN (fixed, percentage, markup, formula)';
COMMENT ON COLUMN "quotation"."status" IS 'draft, sent, approved, converted';
COMMENT ON COLUMN "account_invoice"."state" IS 'draft, open, paid, cancelled';
COMMENT ON COLUMN "account_payment"."state" IS 'draft, posted, cancelled';

-- WEIGHT SCALE RELATED.
ALTER TABLE "product_product" ADD FOREIGN KEY ("weight_uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "scale_config" ADD FOREIGN KEY ("company_id") REFERENCES "res_company" ("id") ON DELETE CASCADE;
ALTER TABLE "scale_config" ADD FOREIGN KEY ("user_id") REFERENCES "res_user" ("id") ON DELETE SET NULL;
ALTER TABLE "account_invoice_line" ADD FOREIGN KEY ("weight_uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "account_invoice_line" ADD FOREIGN KEY ("uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "quotation_item" ADD FOREIGN KEY ("weight_uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;
ALTER TABLE "quotation_item" ADD FOREIGN KEY ("uom_id") REFERENCES "res_uom" ("id") ON DELETE SET NULL;

-- multi-language support
ALTER TABLE "product_translation" ADD FOREIGN KEY ("product_id") REFERENCES "product_product" ("id") ON DELETE CASCADE;

-- Triggers to Update write_date on Updates

CREATE OR REPLACE FUNCTION update_write_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.write_date = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_write_date_res_company
BEFORE UPDATE ON "res_company"
FOR EACH ROW EXECUTE FUNCTION update_write_date();

CREATE TRIGGER trg_update_write_date_res_partner
BEFORE UPDATE ON "res_partner"
FOR EACH ROW EXECUTE FUNCTION update_write_date();

-- Repeat for other tables with write_date: res_user, product_product, account_invoice, etc.

--audit log trigger
CREATE OR REPLACE FUNCTION log_audit()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO "audit_log" ("table_name", "record_id", "action", "user_id", "new_values")
        VALUES (TG_TABLE_NAME, NEW.id, TG_OP, CURRENT_USER::UUID, to_jsonb(NEW));
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO "audit_log" ("table_name", "record_id", "action", "user_id", "old_values", "new_values")
        VALUES (TG_TABLE_NAME, NEW.id, TG_OP, CURRENT_USER::UUID, to_jsonb(OLD), to_jsonb(NEW));
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO "audit_log" ("table_name", "record_id", "action", "user_id", "old_values")
        VALUES (TG_TABLE_NAME, OLD.id, TG_OP, CURRENT_USER::UUID, to_jsonb(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audit_account_invoice
AFTER INSERT OR UPDATE OR DELETE ON "account_invoice"
FOR EACH ROW EXECUTE FUNCTION log_audit();

CREATE TRIGGER trg_audit_quotation
AFTER INSERT OR UPDATE OR DELETE ON "quotation"
FOR EACH ROW EXECUTE FUNCTION log_audit();

CREATE TRIGGER trg_audit_product_product
AFTER INSERT OR UPDATE OR DELETE ON "product_product"
FOR EACH ROW EXECUTE FUNCTION log_audit();


-- update number of variants in product_template
CREATE OR REPLACE FUNCTION update_variant_count()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE "product_template"
        SET "number_of_variants" = "number_of_variants" + 1
        WHERE "id" = (SELECT "template_id" FROM "product_product" WHERE "id" = NEW.variant_id);
    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE "product_template"
        SET "number_of_variants" = "number_of_variants" - 1
        WHERE "id" = (SELECT "template_id" FROM "product_product" WHERE "id" = OLD.variant_id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_variant_count
AFTER INSERT OR DELETE ON "product_variant_combination"
FOR EACH ROW EXECUTE FUNCTION update_variant_count();


-- Creates a unique invoice number like “INV-2025-0001” based on year and sequence.
CREATE SEQUENCE invoice_number_seq START 1;

CREATE OR REPLACE FUNCTION generate_invoice_number()
RETURNS TRIGGER AS $$
BEGIN
    NEW.invoice_number = 'INV-' || EXTRACT(YEAR FROM CURRENT_DATE) || '-' || LPAD(NEXTVAL('invoice_number_seq')::TEXT, 4, '0');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_generate_invoice_number
BEFORE INSERT ON "account_invoice"
FOR EACH ROW EXECUTE FUNCTION generate_invoice_number();


-- Invoice Summary View
-- Combines invoice details with partner and line totals.
CREATE VIEW "vw_invoice_summary" AS
SELECT 
    ai."id" AS invoice_id,
    ai."invoice_number",
    ai."invoice_date",
    ai."state",
    rp."name" AS partner_name,
    ai."amount_total",
    ai."tax_amount",
    ai."amount_residual",
    COUNT(ail."id") AS line_items,
    SUM(ail."price_subtotal") AS subtotal
FROM "account_invoice" ai
JOIN "res_partner" rp ON ai."partner_id" = rp."id"
LEFT JOIN "account_invoice_line" ail ON ai."id" = ail."invoice_id"
GROUP BY ai."id", rp."name";


-- Product Stock and Price View
-- Shows product details with current price and stock.
CREATE VIEW "vw_product_details" AS
SELECT 
    pp."id" AS product_id,
    pp."name",
    pp."barcode",
    pp."sku",
    pp."list_price",
    pp."stock",
    pc."name" AS category_name,
    pt."brand_name"
FROM "product_product" pp
JOIN "product_category" pc ON pp."category_id" = pc."id"
LEFT JOIN "product_template" pt ON pp."template_id" = pt."id"
WHERE pp."active" = true AND pp."discontinued" = false;


-- Partner Billing History
-- Aggregates invoices and payments per partner.
CREATE VIEW "vw_partner_billing_history" AS
SELECT 
    rp."id" AS partner_id,
    rp."name" AS partner_name,
    COUNT(ai."id") AS invoice_count,
    SUM(ai."amount_total") AS total_invoiced,
    SUM(ai."amount_residual") AS total_outstanding,
    SUM(ap."amount") AS total_paid
FROM "res_partner" rp
LEFT JOIN "account_invoice" ai ON rp."id" = ai."partner_id"
LEFT JOIN "account_payment" ap ON rp."id" = ap."partner_id"
GROUP BY rp."id", rp."name";


-- Active Quotations by Status
-- Tracks quotations with total
CREATE VIEW "vw_quotation_status" AS
SELECT 
    q."id" AS quotation_id,
    q."reference_number",
    q."status",
    rp."name" AS partner_name,
    q."amount_total",
    COUNT(qi."id") AS item_count
FROM "quotation" q
JOIN "res_partner" rp ON q."partner_id" = rp."id"
LEFT JOIN "quotation_item" qi ON q."id" = qi."quotation_id" -- Assuming company_id is a typo, should be quotation_id?
GROUP BY q."id", rp."name";


-- Update Usage on Invoice Creation:
CREATE OR REPLACE FUNCTION update_subscription_usage()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE "subscription_usage"
    SET "invoice_count" = "invoice_count" + 1
    WHERE "subscription_id" = (
        SELECT "id" FROM "company_subscription"
        WHERE "company_id" = NEW.company_id
        AND "status" IN ('active', 'trial')
        AND CURRENT_DATE BETWEEN "start_date" AND "end_date"
    )
    AND CURRENT_DATE BETWEEN "period_start" AND "period_end";
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_subscription_usage
AFTER INSERT ON "account_invoice"
FOR EACH ROW EXECUTE FUNCTION update_subscription_usage();


-- Check Plan Limits:
CREATE OR REPLACE FUNCTION check_subscription_limits()
RETURNS TRIGGER AS $$
DECLARE
    v_max_invoices INT;
    v_invoice_count INT;
BEGIN
    SELECT sp."max_invoices", su."invoice_count"
    INTO v_max_invoices, v_invoice_count
    FROM "company_subscription" cs
    JOIN "subscription_plan" sp ON cs."plan_id" = sp."id"
    JOIN "subscription_usage" su ON cs."id" = su."subscription_id"
    WHERE cs."company_id" = NEW.company_id
    AND cs."status" IN ('active', 'trial')
    AND CURRENT_DATE BETWEEN cs."start_date" AND cs."end_date"
    AND CURRENT_DATE BETWEEN su."period_start" AND su."period_end";

    IF v_invoice_count >= v_max_invoices AND v_max_invoices > 0 THEN
        RAISE EXCEPTION 'Fuck off, you’ve hit your invoice limit (%/%) for this plan!', v_invoice_count, v_max_invoices;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_subscription_limits
BEFORE INSERT ON "account_invoice"
FOR EACH ROW EXECUTE FUNCTION check_subscription_limits();


-- Subscription Status View:
CREATE VIEW "vw_subscription_status" AS
SELECT 
    cs."id" AS subscription_id,
    rc."name" AS company_name,
    sp."name" AS plan_name,
    cs."status",
    cs."start_date",
    cs."end_date",
    su."invoice_count",
    sp."max_invoices",
    su."user_count",
    sp."max_users"
FROM "company_subscription" cs
JOIN "res_company" rc ON cs."company_id" = rc."id"
JOIN "subscription_plan" sp ON cs."plan_id" = sp."id"
JOIN "subscription_usage" su ON cs."id" = su."subscription_id"
WHERE CURRENT_DATE BETWEEN su."period_start" AND su."period_end";


