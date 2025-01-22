use parks_and_recreation;

select * from employee_demographics
order by gender
limit 5
;

select * from employee_demographics
order by age DESC
limit 3, 3  #the digit  after the comma shows the row that is immediatley after the 3rd row, if it's 2, it show 2 rows etc..
;