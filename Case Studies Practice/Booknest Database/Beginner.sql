use booknest_database;

select * from authors;
select * from books;
select * from customers;
select * from order_items;
select * from orders;

-- Retrieve all books in the database.
select * from books;

-- List all customers from Kenya.
select * from customers
where country = 'Kenya';

-- Find books that are priced below $20.
select * from books
where price < 20;

-- Get the total number of customers in the database.
select count(customer_id) as total_customers
from customers;

-- Retrieve the names of authors born after 1980.
select name from authors
where birth_year > 1980;