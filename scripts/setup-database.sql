/* create a project database, and drop it first if it already exists */
DROP DATABASE IF EXISTS supermart_grocery_sales;
CREATE DATABASE supermart_grocery_sales;

/* create a database user, called francis, and drop it first if it already exists */
DROP USER IF EXISTS 'user'@'%';
CREATE USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'mypassword';

/* grant user access to the project data, which was created earlier */
GRANT ALL ON supermart_grocery_sales.* TO 'user'@'%';

/* only for running in colab, grant user francis to server related configuration */
GRANT SELECT ON mysql.* TO 'user'@'%';