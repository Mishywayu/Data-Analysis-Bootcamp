-- BookNest Database Schema and Sample Data
CREATE DATABASE `Booknest_Database`;
USE Booknest_Database;


-- 1. Create Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    birth_year INT
);

-- 2. Create Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    published_year INT,
    stock_quantity INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    registration_date DATE
);

-- 4. Create Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    item_price DECIMAL(8, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- Insert Sample Data

-- Authors
INSERT INTO Authors (name, country, birth_year) VALUES
('Chinua Achebe', 'Nigeria', 1930),
('Ngũgĩ wa Thiongo', 'Kenya', 1938),
('J.K. Rowling', 'United Kingdom', 1965),
('George Orwell', 'United Kingdom', 1903),
('Haruki Murakami', 'Japan', 1949);

-- Books
INSERT INTO Books (title, author_id, genre, price, published_year, stock_quantity) VALUES
('Things Fall Apart', 1, 'Historical Fiction', 15.99, 1958, 50),
('The River Between', 2, 'Literary Fiction', 12.99, 1965, 30),
('Harry Potter and the Sorcerers Stone', 3, 'Fantasy', 25.50, 1997, 100),
('1984', 4, 'Dystopian', 14.99, 1949, 40),
('Norwegian Wood', 5, 'Romance', 18.75, 1987, 25);

-- Customers
INSERT INTO Customers (first_name, last_name, email, country, registration_date) VALUES
('Amina', 'Omondi', 'amina.omondi@example.com', 'Kenya', '2022-01-15'),
('James', 'Mwangi', 'james.mwangi@example.com', 'Kenya', '2021-11-23'),
('Lucy', 'Smith', 'lucy.smith@example.com', 'United Kingdom', '2020-05-19'),
('Taro', 'Yamamoto', 'taro.yamamoto@example.com', 'Japan', '2023-03-08'),
('Maria', 'Garcia', 'maria.garcia@example.com', 'Spain', '2022-09-12');

-- Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-20', 40.48),
(2, '2023-02-10', 25.50),
(3, '2023-04-15', 14.99),
(4, '2023-05-22', 18.75),
(1, '2023-06-30', 25.50);

-- Order_Items
INSERT INTO Order_Items (order_id, book_id, quantity, item_price) VALUES
(1, 1, 1, 15.99),
(1, 2, 2, 12.25),
(2, 3, 1, 25.50),
(3, 4, 1, 14.99),
(4, 5, 1, 18.75),
(5, 3, 1, 25.50);
