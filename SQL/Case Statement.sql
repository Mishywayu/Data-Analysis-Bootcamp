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


-- BACK TO BOOTCAMP
USE parks_and_recreation;

select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

select first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN "Young"
    WHEN age BETWEEN 31 AND 50 THEN "Old"
    WHEN age > 50 THEN "On Death's Door"
END AS age_bracket
from employee_demographics
;

-- Pay increase and bonus
-- < 50,000 = 5%
-- > 50,000 = 7%
-- Finance = 10% bonus
select first_name,
last_name,
salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END as new_salary,
CASE
	WHEN dept_id = 6 THEN salary + (salary * 0.1)
END as bonus
from employee_salary;
