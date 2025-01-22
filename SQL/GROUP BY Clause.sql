use parks_and_recreation;

-- Imagine you have a box of toys, and each toy is a different color. Some are red, some are blue,
-- and some are yellow. You want to count how many toys you have for each color.
-- GROUP BY in SQL is like asking someone, "Hey, can you put all the toys of the same color together in separate groups?" 
-- Once the toys are grouped, you can do something like count how many toys are in each group.

-- For example:
-- 1. You put all the red toys together in one pile.
-- 2. All the blue toys in another pile.
-- 3. All the yellow toys in another pile.

-- Now, you can easily say:
-- - "I have 3 red toys."
-- - "I have 5 blue toys."
-- - "I have 2 yellow toys."

-- In SQL, it looks like this:
SELECT color, COUNT(*) 
FROM toys
GROUP BY color;

-- This means:
-- 1. color: Show me each color.
-- 2. COUNT(*): Count how many toys are in each color group.
-- 3. GROUP BY color: Group the toys by their color.

-- Key Points:
-- 1. GROUP BY is often used with aggregate functions like SUM, COUNT, AVG, MAX, or MIN to perform calculations on grouped data.
-- 2. Columns in the SELECT clause must either be in the GROUP BY clause or be part of an aggregate function.
-- 3. If you don’t group your data when using aggregate functions, SQL will treat all rows as a single group.

#back to the project
select gender, avg(age)  #this groups each gender and then calculates the AVG age of each gender
from employee_demographics
GROUP BY gender;

select occupation, 
       sum(salary) as total_salary,
       max(salary) as max,
       avg(salary) as avg_salary,
       min(salary) as min,
       count(occupation) as count
from employee_salary
group by occupation
;

