USE supermart_grocery_sales;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sub_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  region_name VARCHAR(50) NOT NULL
);

CREATE TABLE cities (
  id INT PRIMARY KEY AUTO_INCREMENT,
  city_name VARCHAR(100) NOT NULL,
  region_id INT NOT NULL,
  FOREIGN KEY (region_id) REFERENCES regions(id)
);

CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(255) NOT NULL,
  city_id INT NOT NULL,
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255) NOT NULL
);

CREATE TABLE sub_categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  sub_category_name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATETIME,
  customer_id INT NOT NULL,
  sub_category_id INT NOT NULL,
  sales FLOAT NOT NULL,
  discount FLOAT NOT NULL,
  profit FLOAT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (sub_category_id) REFERENCES sub_categories(id)
);
