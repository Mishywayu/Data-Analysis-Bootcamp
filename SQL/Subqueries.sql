Subqueries in MySQL are queries nested inside another query. 
They are often used to perform operations where the result of one query is needed by another. 
Subqueries can appear in SELECT, INSERT, UPDATE, or DELETE statements and can be used with various clauses like WHERE, FROM, and HAVING.

** Types of Subqueries **
Single-row Subquery: Returns a single row.
Multiple-row Subquery: Returns multiple rows.
Multiple-column Subquery: Returns multiple columns.
Correlated Subquery: Depends on the outer query for its values and is executed repeatedly for each row in the outer query.
Nested Subquery: A subquery inside another subquery.

USE parks_and_recreation;

select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

-- in where clause
select * from employee_demographics
where employee_id IN (select employee_id from employee_salary
where dept_id in (select department_id from parks_departments
where department_name = 'Parks and Recreation'));

-- in select statement
select first_name, salary, (select AVG(salary) from employee_salary)
from employee_salary;

-- in from statement
select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
GROUP BY gender
;

select AVG(`MAX(age)`) from
(select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
GROUP BY gender) as agg_table
;

-- OR
select AVG(max_age) from
(select gender, 
AVG(age) as avg_age, 
MAX(age) as max_age, 
MIN(age) as min_age, 
COUNT(age) as count_age
from employee_demographics
GROUP BY gender) as agg_table
;