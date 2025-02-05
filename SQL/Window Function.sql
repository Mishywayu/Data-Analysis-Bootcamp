Window functions in MySQL allow you to perform calculations across a set of table rows that are related to the current row, 
without collapsing the result into a single output like aggregate functions do. They’re powerful for tasks like running totals, 
ranking, and moving averages.

USE parks_and_recreation;

select * from employee_demographics dem;
select * from employee_salary sal;
select * from parks_departments;

select gender, AVG(salary) as avg_salary from employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
GROUP BY gender
;

select dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender) from employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
;

-- rolling total
select dem.employee_id,
       dem.first_name, 
	   gender, 
       SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as rolling_total,
       sal.salary
from employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
;

-- row_number
select dem.employee_id,
       dem.first_name, 
	   gender, 
       sal.salary,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY sal.salary DESC)
from employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
;

-- rank
select dem.employee_id,
       dem.first_name, 
	   gender, 
       sal.salary,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY sal.salary DESC) as row_num,
       RANK () OVER(PARTITION BY gender ORDER BY sal.salary DESC) as rank_num,
       DENSE_RANK () OVER(PARTITION BY gender ORDER BY sal.salary DESC) as dense_num
from employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
;