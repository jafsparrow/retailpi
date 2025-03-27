-- Insert sample data into res_partner
INSERT INTO res_partner (id, company_id, name, nick_name, email, phone, is_company, is_customer, is_vendor, create_date, write_date, active)
VALUES
  (uuid_generate_v4(), uuid_generate_v4(), 'Partner A', 'partner_a', 'partner_a@example.com', '1234567890', true, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Partner B', 'partner_b', 'partner_b@example.com', '1234567891', true, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Partner C', 'partner_c', 'partner_c@example.com', '1234567892', true, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Partner D', 'partner_d', 'partner_d@example.com', '1234567893', true, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Partner E', 'partner_e', 'partner_e@example.com', '1234567894', true, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true);

-- Insert sample data into product_category
INSERT INTO product_category (id, company_id, name, create_date, write_date, active)
VALUES
  (uuid_generate_v4(), uuid_generate_v4(), 'Electronics', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Clothing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true),
  (uuid_generate_v4(), uuid_generate_v4(), 'Home Appliances', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true);

-- Insert sample data into product_template
INSERT INTO product_template (id, company_id, category_id, default_code, barcode, create_date, write_date, is_weighable, brand_name, sale_ok, number_of_variants)
VALUES
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Electronics'), 'ELEC001', '1234567890123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 'Brand A', true, 1),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Electronics'), 'ELEC002', '1234567890124', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 'Brand B', true, 1),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Clothing'), 'CLOTH001', '1234567890125', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 'Brand C', true, 1),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Clothing'), 'CLOTH002', '1234567890126', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 'Brand D', true, 1),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Home Appliances'), 'HOME001', '1234567890127', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 'Brand E', true, 1);

-- Insert sample data into product_product
INSERT INTO product_product (id, company_id, category_id, template_id, name, uom_id, barcode, list_price, standard_price, type, create_date, write_date, active, stock, base_scan_points)
VALUES
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Electronics'), (SELECT id FROM product_template WHERE default_code = 'ELEC001'), 'Smartphone', uuid_generate_v4(), '1234567890123', 50000, 40000, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 100, 10),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Electronics'), (SELECT id FROM product_template WHERE default_code = 'ELEC002'), 'Laptop', uuid_generate_v4(), '1234567890124', 80000, 70000, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 50, 15),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Clothing'), (SELECT id FROM product_template WHERE default_code = 'CLOTH001'), 'T-Shirt', uuid_generate_v4(), '1234567890125', 500, 300, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 200, 5),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Clothing'), (SELECT id FROM product_template WHERE default_code = 'CLOTH002'), 'Jeans', uuid_generate_v4(), '1234567890126', 1500, 1000, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 150, 8),
  (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Home Appliances'), (SELECT id FROM product_template WHERE default_code = 'HOME001'), 'Microwave', uuid_generate_v4(), '1234567890127', 10000, 8000, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 30, 12);

-- Add more products to reach 20
DO $$
BEGIN
  FOR i IN 6..20 LOOP
    INSERT INTO product_product (id, company_id, category_id, template_id, name, uom_id, barcode, list_price, standard_price, type, create_date, write_date, active, stock, base_scan_points)
    VALUES
      (uuid_generate_v4(), uuid_generate_v4(), (SELECT id FROM product_category WHERE name = 'Electronics'), (SELECT id FROM product_template WHERE default_code = 'ELEC001'), 'Product ' || i, uuid_generate_v4(), '1234567890' || i, 1000 * i, 800 * i, 'product', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, 100 + i, 5 + i);
  END LOOP;
END $$;