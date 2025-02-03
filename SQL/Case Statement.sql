CASE statements in SQL are used to add conditional logic within queries. 
They work like if-else statements in programming languages, allowing you to return different values based on certain conditions.

There are two forms of the CASE statement: Simple CASE and Searched CASE.
1. Simple CASE Statement - compares a single expression against multiple possible values.

SYNTAX:
CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ...
    ELSE resultN
END

EXAMPLE:
SELECT 
    employee_name,
    department_id,
    CASE department_id
        WHEN 1 THEN 'HR'
        WHEN 2 THEN 'Finance'
        WHEN 3 THEN 'IT'
        ELSE 'Other'
    END AS department_name
FROM employees;


2. Searched CASE Statement - allows for more complex conditions with logical operators

SYNTAX:
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END

EXAMPLE:
SELECT 
    order_id,
    order_amount,
    CASE 
        WHEN order_amount > 1000 THEN 'High'
        WHEN order_amount BETWEEN 500 AND 1000 THEN 'Medium'
        ELSE 'Low'
    END AS order_category
FROM orders;


