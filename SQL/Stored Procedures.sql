-- A Stored Procedure in MySQL is a set of SQL statements that you can save and reuse later. 
-- It's like a small program stored in the database that you can call anytime to perform a specific task.

-- **Why Use Stored Procedures?** 
-- Reusability: Write once, use many times.
-- Modularity: Break large operations into smaller, manageable pieces.
-- Performance: Reduces network traffic by executing multiple SQL statements in one go.
-- Security: Users can execute a procedure without having direct access to the tables.
-- Maintainability: Changes can be made in one place (the procedure) without updating multiple scripts.

USE parks_and_recreation;

-- (1)
CREATE PROCEDURE large_salaries()
select * from employee_salary
where salary > 50000
;

call large_salaries();

-- (2)
DELIMITER $$
CREATE PROCEDURE variant_salaries()
BEGIN 
	select * from employee_salary
	where salary > 50000;
	select * from employee_salary
	where salary < 50000;
END $$
DELIMITER ;

CALL variant_salaries();

-- (3) -> parameters
DELIMITER $$
CREATE PROCEDURE param_procedure(employee_id_param INT)
BEGIN
SELECT * FROM employee_salary
WHERE employee_id = employee_id_param;
END $$
DELIMITER ;

CALL param_procedure(2);




















