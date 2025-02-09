-- TrendyMart E-Commerce Database Schema and Sample Data
CREATE DATABASE `TrendyMart_Database`;
USE TrendyMart_Database;

-- 1. Create Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 2. Create Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL
);

-- 4. Create Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Data

-- Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Home Appliances');

-- Products
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Smartphone', 1, 299.99, 50),
('Laptop', 1, 899.99, 30),
('T-shirt', 2, 19.99, 100),
('Jeans', 2, 39.99, 75),
('Microwave', 3, 120.00, 20);

-- Customers
INSERT INTO Customers (first_name, last_name, email, country, registration_date) VALUES
('Amina', 'Omondi', 'amina.omondi@example.com', 'Kenya', '2022-01-15'),
('James', 'Mwangi', 'james.mwangi@example.com', 'Kenya', '2021-11-23'),
('Lucy', 'Smith', 'lucy.smith@example.com', 'United Kingdom', '2020-05-19'),
('Taro', 'Yamamoto', 'taro.yamamoto@example.com', 'Japan', '2023-03-08'),
('Maria', 'Garcia', 'maria.garcia@example.com', 'Spain', '2022-09-12');

-- Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-20', 319.98),
(2, '2023-02-10', 899.99),
(3, '2023-04-15', 19.99),
(4, '2023-05-22', 120.00),
(1, '2023-06-30', 39.99);

-- Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 299.99),
(1, 3, 1, 19.99),
(2, 2, 1, 899.99),
(3, 3, 1, 19.99),
(4, 5, 1, 120.00),
(5, 4, 1, 39.99);