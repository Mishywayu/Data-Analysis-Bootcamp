-- Intermediate Level Tasks
use booknest_database;

select * from authors;
select * from books;
select * from customers;
select * from order_items;
select * from orders;

-- 1. Find the top 5 best-selling books based on total quantity sold.
select a.book_id,a.title, sum(b.quantity) as total_sold from books a
join order_items b ON a.book_id = b.book_id
group by a.book_id
order by total_sold DESC
;

-- List all orders with customer names and the total amount.
select a.order_id, a.total_amount,CONCAT(b.first_name,' ',b.last_name) as customer_name from orders a
join customers b ON a.customer_id = b.customer_id
Group by a.order_id
Order by a.order_id
;

-- Find the total revenue generated by each genre
select a.genre, sum(b.item_price * b.quantity) as revenue  from books a
join order_items b on a.book_id = b.book_id
group by genre
order by revenue desc
;

-- List customers who haven’t placed any orders.
select a.customer_id, 
	   concat(a.first_name,' ',a.last_name) as customer_name
from customers a
left join orders b on a.customer_id = b.customer_id
where b.customer_id is null
;

-- Find the author with the highest total book sales.
select c.name, sum(b.quantity) as sales from authors c
join books a on c.author_id = a.author_id
join order_items b on a.book_id = b.book_id
group by c.name
order by sales desc
;

-- Get the average order value per customer.
select CONCAT(b.first_name,' ',b.last_name) as customer_name,
avg(a.total_amount) as avg_order
from orders a
join customers b ON a.customer_id = b.customer_id
Group by customer_name
Order by avg_order desc
;

-- Find books that have never been sold.
select a.title from books a
left join order_items b on a.book_id = b.book_id
where b.book_id is null;

-- Rank customers by their total spending using window functions.
select a.customer_id,concat(a.first_name,' ',a.last_name) as customer_name, 
	   sum(b.total_amount) as total_spending,
       RANK() over (ORDER BY sum(b.total_amount) DESC) as spending_rank
from customers a
join orders b on a.customer_id = b.customer_id
group by a.customer_id
;

-- Find the monthly revenue for the current year and compare it with the previous year.
SELECT 
    MONTH(order_date) AS month,
    SUM(CASE WHEN YEAR(order_date) = YEAR(CURDATE()) THEN total_amount ELSE 0 END) AS current_year_revenue,
    SUM(CASE WHEN YEAR(order_date) = YEAR(CURDATE()) - 1 THEN total_amount ELSE 0 END) AS previous_year_revenue
FROM Orders
WHERE YEAR(order_date) IN (YEAR(CURDATE()), YEAR(CURDATE()) - 1)
GROUP BY month
ORDER BY month;




