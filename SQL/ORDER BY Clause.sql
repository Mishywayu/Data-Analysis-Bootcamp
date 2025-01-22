use parks_and_recreation;

-- imagine you have a box of chocolates. Each chocolate has a number written on it, like 5, 3, 8, and 1. 
-- But right now, they’re all mixed up! You want to organize them in order, from the smallest number to the biggest number.

-- That’s what ORDER BY does in SQL—it helps put things in order!
-- 1. If you want the smallest number first, you tell it to sort "small to big" (this is called ASC, for ascending).
-- 2. If you want the biggest number first, you tell it to sort "big to small" (this is called DESC, for descending).

-- Key Points:
-- 1. ASC vs DESC:
-- ASC (ascending) arranges from smallest to largest (e.g., A–Z, 0–9).
-- DESC (descending) arranges from largest to smallest (e.g., Z–A, 9–0).

-- 2. Default Behavior:
-- If you don’t specify ASC or DESC, it defaults to ascending (ASC).

-- 3. NULL Values:
-- By default, NULL values are treated as the smallest values in ASC or the largest in DESC, depending on the database.

-- 4. Performance:
-- Sorting large datasets can be computationally expensive. Use indexes where possible to optimize performance.

select * from employee_demographics
ORDER BY first_name
;

#using columns positions instead of column name (not best practice though)
#eg: gender is in the 5th position and age is in the 4th position
select * from employee_demographics
ORDER BY 5, 4 
;















