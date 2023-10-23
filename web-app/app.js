const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const mustacheExpress = require('mustache-express');

const app = express();
const port = 4000;

app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', './templates');
app.use(bodyParser.urlencoded({ extended: true }));

// creating mysql database connection
var connectDB = mysql.createConnection({
    host: 'localhost',
    user: 'user',
    password: 'mypassword',
    database: 'supermart_grocery_sales'
})

// Handle the '/categories' route
app.get('/categories', function (request, response) {
  connectDB.query("SELECT * FROM categories;", function (error, rows) {
      if (error) {
          console.error(error);
      }
      response.render('categories', { data: rows });
  });
});

// Handle the '/sub-categories' route
app.get('/sub-categories', function (request, response) {
  connectDB.query("SELECT * FROM sub_categories;", function (error, results) {
      if (error) {
          console.error(error);
      }
      response.render('sub_categories', { data: results });
  });
});

// Handle the '/customer-count' route
app.get('/customer-count', function (req, res) {
  const query = `
      SELECT r.region_name, COUNT(DISTINCT cu.id) AS customer_count
      FROM regions r
      JOIN cities ci ON r.id = ci.region_id
      JOIN customers cu ON ci.id = cu.city_id
      GROUP BY r.region_name;
  `;

  connectDB.query(query, function (error, results) {
      if (error) throw error;
      res.render('customer_count', { data: results });
  });
});

// Handle the '/monthly-sales' route
app.get('/monthly-sales', function (request, response) {
  const query = `
      SELECT MONTH(o.order_date) AS month, SUM(o.sales) AS total_sales
      FROM orders o
      GROUP BY month
      ORDER BY total_sales DESC
  `;

  connectDB.query(query, function (error, results) {
      if (error) {
          console.error(error);
      }
      response.render('monthly_sales', { data: results });
  });
});

// Handle the '/sub-category-count' route
app.get('/sub-category-count', function (req, res) {
  const query = `
      SELECT c.category_name, COUNT(sc.id) AS sub_category_count
      FROM sub_categories sc
      JOIN categories c ON sc.category_id = c.id
      GROUP BY c.category_name;
  `;

  connectDB.query(query, function (error, results) {
      if (error) console.error(error);
      res.render('sub_category_count', { data: results });
  });
});

// Handle the '/top-selling' route
app.get('/top-selling', function (req, res) {
  const query = `
      SELECT c.category_name, sc.sub_category_name, SUM(o.sales) as total_sales
      FROM orders o
      JOIN sub_categories sc ON o.sub_category_id = sc.id
      JOIN categories c ON sc.category_id = c.id
      GROUP BY c.category_name, sc.sub_category_name, o.sub_category_id
      ORDER BY total_sales DESC
      LIMIT 20;
  `;

  connectDB.query(query, function (error, results) {
      if (error) console.error(error);
      res.render('top_selling', { data: results });
  });
});

// Handle the '/top-customers' route
app.get('/top-customers', function (req, res) {
  const query = `
      SELECT c.customer_name, SUM(o.sales) AS total_sales, SUM(o.profit) AS total_profit
      FROM orders o
      JOIN customers c ON o.customer_id = c.id
      GROUP BY c.customer_name
      ORDER BY total_sales DESC, total_profit DESC
      LIMIT 10;
  `;

  connectDB.query(query, function (error, results) {
      if (error) console.error(error);
      res.render('top_customers', { data: results });
  });
});

// Handle the '/top-cities' route
app.get('/top-cities', function (req, res) {
  const query = `
      SELECT r.region_name, ci.city_name, SUM(o.sales) AS total_sales, SUM(o.profit) AS total_profit
      FROM orders o
      JOIN customers c ON o.customer_id = c.id
      JOIN cities ci ON c.city_id = ci.id
      JOIN regions r ON ci.region_id = r.id
      GROUP BY r.region_name, ci.city_name
      ORDER BY total_sales DESC, total_profit DESC
      LIMIT 10;
  `;

  connectDB.query(query, function (error, results) {
      if (error) console.error(error);
      res.render('top_cities', { data: results });
  });
});

app.listen(port, function () {
    console.log('App listening at http://localhost:' + port + '.');
})


