use parks_and_recreation;

#HAVING VS WHERE 
-- The **WHERE** clause and the **HAVING** clause are both used to filter data in SQL, 
-- but they work at different stages of query execution.

-- **WHERE Clause**
-- The `WHERE` clause filters rows **before** any grouping or aggregation happens. It works on individual 
-- rows and excludes data **before** it is grouped or summarized.
-- For example:
SELECT product, sales_amount
FROM sales
WHERE sales_amount > 500;
#Here, the query filters out rows where `sales_amount` is 500 or less.

-- **HAVING Clause**
-- The `HAVING` clause filters groups **after** aggregation. It works on the result of aggregate 
-- functions (like `SUM`, `COUNT`, `AVG`, etc.) and excludes entire groups based on a condition.
-- For example:
SELECT product, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product
HAVING SUM(sales_amount) > 1000;
-- Here:
-- - The query first groups rows by `product`.
-- - Then, it calculates the `SUM(sales_amount)` for each group.
-- - Finally, it keeps only the groups where the total sales are greater than 1000.

-- To fully understand the difference between `WHERE` and `HAVING`, it helps to look at the query execution process.
-- 1. **WHERE Filters Rows Early**:
--    - Applies conditions to individual rows **before grouping or aggregation**.
--    - Does not work with aggregate functions like `SUM`, `COUNT`, etc.
--    Example:
   SELECT product, region, sales_amount
   FROM sales
   WHERE sales_amount > 500;
   #This filters rows where `sales_amount` is greater than 500 **before grouping happens**.

-- 2. **HAVING Filters Groups Later**:
--    - Applies conditions to groups **after grouping or aggregation**.
--    - Works with aggregate functions.
--    Example:
   SELECT product, region, SUM(sales_amount) AS total_sales
   FROM sales
   GROUP BY product, region
   HAVING SUM(sales_amount) > 1000;
  # This filters out groups where the total sales are not greater than 1000.

--  **Combining WHERE and HAVING**
-- You can use both clauses in a query. `WHERE` is used to filter rows first, and `HAVING` is used to filter groups after aggregation.
-- Example:
SELECT product, SUM(sales_amount) AS total_sales
FROM sales
WHERE region = 'East' -- Filters rows where region is 'East'
GROUP BY product
HAVING SUM(sales_amount) > 1000; -- Filters groups where total sales > 1000

-- ### Key Points to Remember:
-- - Use **WHERE** when filtering individual rows **before aggregation**.
-- - Use **HAVING** when filtering aggregated data **after grouping**.
-- - You **cannot use aggregate functions in WHERE** (e.g., `WHERE SUM(sales_amount) > 1000` is invalid).
-- - Both clauses can be combined in the same query for maximum flexibility.

#Back to Project
select gender, avg(age) from employee_demographics
group by gender
having avg(age) > 40
;

select
		occupation,
        avg(salary)
from employee_salary
where occupation LIKE ("%manager%")
group by occupation
having avg(salary) > 60000
;

