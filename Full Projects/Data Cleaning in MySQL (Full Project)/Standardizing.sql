-- STANDARDIZING DATA
use world_layoffs;

select *
from layoffs_staging2
;

SET SQL_SAFE_UPDATES = 0; -- this fixes error code 1175..safe update mode in MySQL

-- remove whitespaces on company column
update layoffs_staging2
set company = trim(company);

-- TRIM() function is used to remove leading, trailing, or both leading and trailing spaces (or specified characters) from a string.


-- standardizing location column
select distinct location
from layoffs_staging2
order by 1
; -- looks okay


-- standardizing industry column
select distinct industry
from layoffs_staging2
where industry like "%crypto%" -- there is crypto, cryptocurrency and crypto currency (all these are the same thing, so we change to one = crypto)
;

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';


-- standardizing country column
select distinct country 
from layoffs_staging2
order by 1
;

update layoffs_staging2
set country = 'United States'
where country like "United States.";

-- or, this could work as well
update layoffs_staging2
set country = trim(trailing '.' from country)
where country like "United States";


-- standardizing date column  (changing from text data type to date/time) mm/dd/yyyy
select `date`
from layoffs_staging2
order by 1
;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;