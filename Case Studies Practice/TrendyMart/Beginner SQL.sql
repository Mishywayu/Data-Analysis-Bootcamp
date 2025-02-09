USE TrendyMart_Database;

select * from categories;
select * from customers;
select * from order_items;
select * from orders;
select * from products;

-- Retrieve all products in the store.
select * from products;

-- List all customers from Kenya.
Select CONCAT(first_name, ' ', last_name) from customers
where country = 'Kenya';

-- Find products priced above $50.
select * from products
where price > 50.0;

-- Get the total number of customers.
select count(*) as total_customers from customers;

-- Retrieve the names of all product categories.
select DISTINCT category_name from categories;