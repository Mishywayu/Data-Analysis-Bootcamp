use world_layoffs;

select * from layoffs;

-- what we are gonna do
-- 1. remove duplicates if any
-- 2. standardize the data
-- 3. null/blank values
-- 4. remove unnecessary rows or columns

create table layoffs_staging
like layoffs;  -- it's like creating a copy of the original dataset, cause sometime human is to error, incase we do make changes,
			   -- sometimes we make mistakes, we'll have the original dataset to revert back to.

select * from layoffs_staging; 

insert layoffs_staging
select * from layoffs;


-- DUPLICATES
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`
) as row_num
from layoffs_staging
;

WITH duplicate_CTE as (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`
) as row_num
from layoffs_staging
)
select * from duplicate_CTE
where row_num > 1
;

-- check if they are really duplicates 
select * from layoffs_staging
where company like ("%Casper%"); -- casper appears 3 times, but different, the ones that have null values have similate dates,
									-- so that makes one is the duplicate of the other.

select * from layoffs_staging
where company like ("Oda%"); -- Oda appears 3 times, but thise aren't duplicates since funds_raised_millions are different figures.

select * from layoffs_staging
where company like ("Cazoo%"); -- 3 times, however, one duplicate of the other

select * from layoffs_staging
where company like ("Hibob%"); -- one duplicate

select * from layoffs_staging
where company like ("Terminus%");  -- no duplicates

select * from layoffs_staging
where company like ("Wildlife Studios%"); -- one duplicates

select * from layoffs_staging
where company like ("Yahoo%"); -- one duplicate

-- so to rectify this, we do partition over every column (analysis 101)
WITH duplicate_CTE as (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_staging
)
select * from duplicate_CTE
where row_num > 1
;

-- check the duplicates
select * from layoffs_staging
where company like ("%Casper%"); -- casper appears 3 times, but different, the ones that have null values have similate dates,
									-- so that makes one is the duplicate of the other.

select * from layoffs_staging
where company like ("Cazoo%"); -- 3 times, however, one duplicate of the other

select * from layoffs_staging
where company like ("Hibob%"); -- one duplicate

select * from layoffs_staging
where company like ("Wildlife Studios%"); -- one duplicates

select * from layoffs_staging
where company like ("Yahoo%"); -- one duplicate


-- REMOVING THE DUPLICATES
CREATE TABLE `layoffs_staging2` ( -- creating another table,
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_staging;

select * from layoffs_staging2
where row_num > 1
;

SET SQL_SAFE_UPDATES = 0; -- this fixes error code 1175..safe update mode in MySQL

delete 
from layoffs_staging2
where row_num > 1;