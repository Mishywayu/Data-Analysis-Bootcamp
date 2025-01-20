use parks_and_recreation;

#select all(all columns) where age is equal or greater than 40
select * from employee_demographics
where age >= 40;

select * from employee_demographics
where first_name = 'Donna';

select * from employee_demographics
where gender != 'male';

#Logical operators: AND, OR, NOT
select * from employee_demographics
where gender != 'male'
AND birth_date > 1985-01-01;

select * from employee_demographics
where gender != 'male'
OR birth_date > 1985-01-01;

select * from employee_demographics
where gender != 'male'
OR NOT birth_date > 1985-01-01;

#PEMDAS logic
select * from employee_demographics
where (first_name = 'Donna' AND age = 46) OR age >= 50
;

#like statement, (% and _)
select * from employee_demographics
where first_name LIKE 'Jer%'     #says that we are looning for a name that begins with 'Jer' and has smth/anything after 'Jer'
;

select * from employee_demographics
where first_name LIKE '%er%'     #says that we are looking for a name that has 'er' and has smth/anything before and after 'er'
;  #this also works: WHERE first_name LIKE '%Jerry%' or 'a%' (any name that begins with 'a')

select * from employee_demographics
where first_name like 'a__'  #says that the name begins with 'a' and has two chars after 'a', nothing less, nothing more
;

select * from employee_demographics
where first_name like 'a__%'  #says that the name begins with 'a' and has two chars after 'a', and anything after that
;