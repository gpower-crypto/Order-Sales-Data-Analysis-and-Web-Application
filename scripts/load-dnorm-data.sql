USE supermart_grocery_sales;

DROP TABLE IF EXISTS dnorm_data;
CREATE TABLE dnorm_data (
    CustomerName VARCHAR(255),
    Category VARCHAR(255),
    SubCategory VARCHAR(255),
    City VARCHAR(100),
    OrderDate DATETIME,
    Region VARCHAR(50),
    Sales FLOAT,
    Discount FLOAT,
    Profit FLOAT
);

LOAD DATA INFILE '/home/coder/project/Supermart-Grocery-Sales/data/dnorm-data.csv'
INTO TABLE dnorm_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
