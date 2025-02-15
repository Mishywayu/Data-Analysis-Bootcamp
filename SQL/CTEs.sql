use parks_and_recreation;

-- Common Table Expression - allow you to create temporary result sets that can be referenced within a 
-- SELECT, INSERT, UPDATE, or DELETE statement. They make complex queries more readable and modular by
--  breaking them into logical, manageable parts.

WITH CTE_example as
(
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from employee_demographics dem
join employee_salary sal on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal) from CTE_example
;

-- above can be

WITH CTE_example(gender,avg_sal,max_sal,min_sal,count_sal) as
(
select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics dem
join employee_salary sal on dem.employee_id = sal.employee_id
group by gender
)
select * from CTE_example
;


-- complex CTEs
WITH CTE_example2 AS
(
SELECT employee_id, first_name, last_name, age, gender,birth_date
FROM employee_demographics
WHERE birth_date > "1985-01-01"
),
CTE_example3 as (
select employee_id, salary from employee_salary
where salary > 50000
)
select * from CTE_example2
JOIN CTE_example3 ON CTE_example2.employee_id = CTE_example3.employee_id
;