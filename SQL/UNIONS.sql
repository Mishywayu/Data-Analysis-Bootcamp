use parks_and_recreation;

-- In SQL, a UNION combines the results of two or more `SELECT` statements into a single result set, 
-- removing duplicate rows by default. It’s useful when you want to consolidate data from multiple tables or 
-- queries into one cohesive dataset.

-- Key Rules for UNION:
-- 1. Column Count & Order: The `SELECT` statements being combined must have the same number of columns in the same order.
-- 2. Data Types: The columns must have compatible data types, though they don’t need to match exactly.
-- 3. Duplicate Removal: By default, `UNION` eliminates duplicate rows. To include duplicates, use `UNION ALL` instead.

-- Syntax:
SELECT column1, column2
FROM table1
UNION
SELECT column1, column2
FROM table2;

-- Query with UNION ALL:
SELECT Name, Grade FROM table1
UNION ALL
SELECT Name, Grade FROM table2;



select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

