use parks_and_recreation;

-- Joins in SQL are like connecting puzzle pieces — matching rows from two or more tables based on a related column. 
-- Think of tables as groups of related data, and joins help bring them together for a complete picture.  

-- Types of Joins (with examples):
-- 1. INNER JOIN - returns rows where there’s a match in both tables
-- **Imagine two lists:**
-- - List A: Names of employees.  
-- - List B: Departments they belong to.  

-- You want to see only employees who have a department assigned. 
-- **Example:**  
-- Table 1 (Employees):  
-- | EmployeeID | Name    |  
-- |------------|---------|  
-- | 1          | Alice   |  
-- | 2          | Bob     |  
-- | 3          | Carol   |  

-- Table 2 (Departments):  
-- | EmployeeID | Department |  
-- |------------|------------|  
-- | 1          | Sales      |  
-- | 3          | HR         |  

-- **Query:**  
SELECT Employees.Name, Departments.Department  
FROM Employees  
INNER JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

-- **Result (INNER JOIN):**  
-- | Name  | Department |  
-- |-------|------------|  
-- | Alice | Sales      |  
-- | Carol | HR         |  


-- 2. LEFT JOIN (or LEFT OUTER JOIN) - includes all rows from the first (left) table and matches from the second (right) table. 
-- If no match is found, it still shows the row from the left table with `NULL` for the missing data.  

-- **Example:**  
-- Using the same tables as above:  

-- **Query:**  
SELECT Employees.Name, Departments.Department  
FROM Employees  
LEFT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

-- **Result (LEFT JOIN):**  
-- | Name  | Department |  
-- |-------|------------|  
-- | Alice | Sales      |  
-- | Bob   | NULL       |  
-- | Carol | HR         |  


-- 3. RIGHT JOIN (or RIGHT OUTER JOIN) - is the opposite of a LEFT JOIN—it includes all rows from the second (right) table 
-- and matches from the first (left) table. 
-- If no match is found, it shows `NULL` for the missing data on the left.  


--  4. FULL JOIN (or FULL OUTER JOIN) - combines the results of both LEFT and RIGHT joins. 
--  It returns all rows from both tables, with `NULL` for non-matching rows.  


-- 5. CROSS JOIN  - creates a cartesian product — each row from the first table is paired with every row from the second table.  
-- **Example:**  
-- If Table 1 has 3 rows and Table 2 has 2 rows, the result will have \(3 \times 2 = 6\) rows.  


select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

-- Inner Join
select 
	employee_demographics.*, 
    employee_salary.occupation,
    employee_salary.salary,
    employee_salary.dept_id
from employee_demographics as dem
INNER JOIN employee_salary on 
employee_demographics.employee_id = employee_salary.employee_id
AND employee_demographics.first_name = employee_salary.first_name
AND employee_demographics.last_name = employee_salary.last_name;


select * from employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

-- using ALIAS
select * from employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

-- selecting specific columns
select dem.employee_id, age, occupation
from employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;


-- OUTER JOINS (There is left join and right join) || left outer and right outer joins
select *
from employee_demographics as dem
LEFT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

select *
from employee_demographics as dem
RIGHT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;


-- SELF JOIN - a join where you tie the table to itself
select 
	emp1.employee_id AS emp_santa,
    emp1.first_name AS firt_name_santa,
    emp1.last_name AS last_name_santa,
    emp2.employee_id AS emp,
    emp2.first_name AS first_name_emp,
    emp2.last_name AS last_name_emp
from employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;
    
-- Joining multiple tables together
select * from employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as parks
	ON sal.dept_id = parks.department_id
;








