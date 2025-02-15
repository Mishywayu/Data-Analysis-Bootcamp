-- A trigger is a set of SQL statements that automatically runs when a specific event occurs
-- in the database, like an INSERT, UPDATE, or DELETE.

-- An event is a scheduled task that runs at specific times or intervals, like a cron job 
-- in Linux or a scheduled task in Windows.

USE parks_and_recreation;

-- TRIGGER
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES(13,"Michelle","Muindi",'Technology',500000,NULL);

select * from employee_salary;
select * from employee_demographics;


-- EVENTS
select * from employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE "event%";