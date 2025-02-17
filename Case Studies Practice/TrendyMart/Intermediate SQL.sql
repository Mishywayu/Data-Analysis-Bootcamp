USE TrendyMart_Database;

select * from categories;
select * from customers;
select * from order_items;
select * from orders;
select * from products;

-- Find the top 5 best-selling products.
select a.product_id, a.product_name, sum(b.quantity) as total_ordered from products a
join order_items b on a.product_id = b.product_id
group by a.product_id
order by total_ordered DESC
limit 5
;

-- List all orders with customer names and total amounts.
select b.customer_id,
	b.order_id,
	concat(a.first_name, ' ', a.last_name) as customer_name,
	b.total_amount
from customers a
JOIN orders b on a.customer_id = b.customer_id
group by b.order_id;
	
-- Find the total revenue per category.
select a.category_name, 
	sum(b.item_price * b.quantity) as revenue
from categories a
join products c on a.category_id = c.category_id
join order_items b on c.product_id = b.product_id
group by a.category_name
order by revenue DESC;

-- List customers who haven’t placed any orders.
select a.customer_id,
	concat(a.first_name, ' ',a.last_name) as customer_name
from customers a
left join orders b on a.customer_id = b.customer_id
where b.order_id is null; -- customer_id is null also works

-- Find the customer who has spent the most.
select a.customer_id,
	concat(a.first_name, ' ',a.last_name) as customer_name,
    sum(total_amount) as total_spent
from customers a
join orders b on a.customer_id = b.customer_id
group by customer_id
order by total_spent DESC
LIMIT 1
;

-- Find the monthly revenue for the last two years.
SELECT
    YEAR(order_date) AS year,
    SUM(total_amount) AS revenue
FROM orders
WHERE YEAR(order_date) >= YEAR(CURDATE()) - 1
GROUP BY YEAR(order_date)
ORDER BY year;