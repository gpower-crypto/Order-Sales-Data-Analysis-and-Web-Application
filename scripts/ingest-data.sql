USE supermart_grocery_sales;

DELETE FROM orders;
DELETE FROM sub_categories;
DELETE FROM categories;
DELETE FROM customers;
DELETE FROM cities;
DELETE FROM regions;


INSERT INTO regions (region_name)
    SELECT DISTINCT Region
    FROM dnorm_data;

INSERT INTO cities (city_name, region_id)
    SELECT DISTINCT d.City, r.id
    FROM dnorm_data d
    LEFT JOIN regions r
    ON d.Region = r.region_name;

INSERT INTO customers (customer_name, city_id)
    SELECT d.CustomerName, c.id
    FROM dnorm_data d
    LEFT JOIN cities c
    ON d.City = c.city_name;

INSERT INTO categories (category_name)
    SELECT DISTINCT Category
    FROM dnorm_data;

INSERT INTO sub_categories (sub_category_name, category_id)
    SELECT DISTINCT d.SubCategory, c.id
    FROM dnorm_data d
    LEFT JOIN categories c
    ON d.Category = c.category_name;

INSERT INTO orders (order_date, customer_id, sub_category_id, sales, discount, profit)
  SELECT DISTINCT d.OrderDate, c.id, s.id, d.Sales, d.Discount, d.Profit
  FROM dnorm_data d
  JOIN customers c
  ON d.CustomerName = c.customer_name
  JOIN sub_categories s
  ON d.SubCategory = s.sub_category_name;
