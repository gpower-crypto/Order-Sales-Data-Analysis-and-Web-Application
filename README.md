# Order Sales Data Analysis and Web Application

## Overview

The "Order Sales Data Analysis and Web Application" project is a comprehensive exploration of order sales data through a combined approach of data analysis, modeling, and web application development. This project aims to provide valuable insights into sales patterns, customer behavior, and product categories by leveraging an open dataset from Kaggle.

### Project Objectives

- Analyze and model order sales data from an open dataset.
- Create an Entity-Relationship (E/R) model for data structure and adapt it for relational implementation.
- Build a MySQL database for data storage and populate it with instance data.
- Develop a simple web application using Node.js to visualize data and answer specific questions.

## Dataset Information

The dataset used for this project is a fictional order sales dataset for a supermart grocery delivery application. It contains detailed information, including customer names, categories, sub-categories, city, region, order date, sales, discounts, and profits. While this dataset may not represent real-world sales data, it serves as an excellent resource for educational and practice purposes.

### Key Aspects of the Dataset

- Reliability: The dataset is sourced from Kaggle, a reputable platform for data analysis.
- Detail: It provides sufficient information for meaningful analysis.
- Documentation: The dataset comes with clear documentation about its purpose.
- Interrelation: The dataset primarily focuses on internal relationships for in-depth analysis.
- Use: The dataset can be used for learning and applying data analysis techniques.
- Discoverability: Open data was easily accessible on Kaggle.

## Entity-Relationship (E/R) Model

The project includes an E/R model that maps the data structure, providing a visual representation of relationships between entities. Tables have been designed to represent key aspects of the dataset, such as orders, customers, cities, regions, sub-categories, and categories.

## Database Creation and Normalization

The project involves creating a MySQL database with tables that adhere to normalization principles. Data is loaded into the database, and the data structure is evaluated for normalization up to the fourth normal form.

### Key Database Tables

- Regions
- Cities
- Customers
- Categories
- Sub-categories
- Orders

## Web Application Development

A simple web application has been built using Node.js to interact with the database and visualize data. The application is designed to address the project's goals, including illustrating the data and answering specific questions identified during the analysis.

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local environment:

   ```bash
   git clone https://github.com/gpower-crypto/Order-Sales-Data-Analysis-and-Web-Application.git
   cd webapp

2. Install the required dependencies:

   ```bash
   npm install

3. Start the application:

   ```bash
   node index.js

# Tech Stacks and Frameworks

- Node.js
- Express.js
- MySQL
- HTML
- CSS

