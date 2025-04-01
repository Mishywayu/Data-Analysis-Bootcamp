-- null/blank values
use world_layoffs;

SET SQL_SAFE_UPDATES = 0; -- this fixes error code 1175..safe update mode in MySQL

select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null
;

select * from layoffs_staging2
where industry = ''
OR industry is null;

select * from layoffs_staging2
where company = 'Bally\'s Interactive';

select * from layoffs_staging2
where company = 'Airbnb';		-- we're gonna populated the industry with Travel

update layoffs_staging2
set industry = 'Travel'
where company = 'Airbnb'
and industry = ''
or industry is null;

select * from layoffs_staging2
where company = 'Carvana';		-- industry = Transportation

update layoffs_staging2
set industry = 'Transportation'
where company = 'Carvana'
and industry = ''
or industry is null;

select * from layoffs_staging2
where company = 'Juul';			-- industry Consumer

update layoffs_staging2
set industry = 'Consumer'
where company = 'Juul'
and industry = ''
or industry is null;

-- shorter way 
UPDATE layoffs_staging2
set industry = null
where industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
and t2.industry IS NOT NULL;









    

