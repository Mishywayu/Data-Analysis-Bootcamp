USE world_layoffs;

select *
from layoffs_staging2
;


select max(total_laid_off), 
	   min(total_laid_off), 
       max(percentage_laid_off), 
       min(percentage_laid_off)
from layoffs_staging2
;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off DESC
;

SELECT company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 DESC
;

select min(`date`) as start_date,
	   max(`date`) as end_date
from layoffs_staging2
;

SELECT industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 DESC
;

SELECT country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 DESC
;

SELECT `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 DESC
;

SELECT year(`date`),
	   -- month(`date`),
	   sum(total_laid_off)
from layoffs_staging2
group by year(`date`) -- , month(`date`)
order by 1 DESC
;

SELECT stage,
	   sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 DESC
;


-- rolling total of layoffs (based on months)
select substring(`date`, 1, 7) as `month`,
	   sum(total_laid_off) as monthly_layoffs
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by 1
order by 1 asc
;

-- select year(`date`) as mwaka,
-- 	   month(`date`) as miezi,
-- 	   sum(total_laid_off) as monthly_layoffs
-- from layoffs_staging2
-- where year(`date`) is not null 
-- and month(`date`) is not null
-- group by 1, 2
-- order by 1, 2 asc
-- ;

WITH ROLLING_TOTAL AS 
(
select substring(`date`, 1, 7) as `month`,
	   sum(total_laid_off) as monthly_layoffs
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by 1
order by 1 asc
)
select `month`, monthly_layoffs, sum(monthly_layoffs) over(order by `month`) as rolling_total
from ROLLING_TOTAL;


-- rolling total of layoffs (based on company, yearly)
SELECT company, 
	   year(`date`) as `year`,
	   sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company asc
;

SELECT company, 
	   year(`date`) as `year`,
	   sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc
;

WITH Company_year as
(
SELECT company, 
	   year(`date`) as `year`,
	   sum(total_laid_off) as total_year_layoffs
from layoffs_staging2
group by company, year(`date`)
),
company_year_ranks as
(
select *,
	   dense_rank() over(partition by year order by total_year_layoffs desc) as d_rank
from Company_year
where year is not null
)
select * from company_year_ranks
where d_rank <= 5
;