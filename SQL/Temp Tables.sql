-- Temporary Tables
-- A Temporary Table in MySQL is a special kind of table that exists only for the duration of a 
-- session (a connection to the database). Once the session ends or the table is explicitly deleted, 
-- the temporary table is automatically dropped.

-- are only visible to the session they are created insert
-- two ways of creating temp tables

use parks_and_recreation;
-- (1)
CREATE TEMPORARY TABLE temp_table (
first_name varchar(50),
last_name varchar(50),
actor_crush varchar(50)
);

select * from temp_table;

insert into temp_table 
VALUES ("Michelle", "Muindi", "Theo James");

-- (2)
select * from employee_salary;

CREATE TEMPORARY TABLE temp_table2 as
select * from employee_salary
where salary > 50000
;

select * from temp_table2;