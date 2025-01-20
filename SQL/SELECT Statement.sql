#To use the database we want
select * from parks_and_recreation.employee_demographics;
#or use keyword 'use'
use parks_and_recreation;
select * from employee_demographics;

#select a column
select first_name from employee_demographics;

#select multiple columns , not all
select first_name, age, birth_date
from employee_demographics;

#Calculation. Follows PEMDAS
select *, (age + 10) * 10 + 10
from employee_demographics;

select *, (age + 10) + 10 * 10 #does it really??
from employee_demographics;

select *, 10 + (age + 10) * 10 #this one does though
from employee_demographics;

select *, 10 * 10 + (age + 10) #does not, yoh??
from employee_demographics;

#select unique values of a column
select DISTINCT gender
from employee_demographics;