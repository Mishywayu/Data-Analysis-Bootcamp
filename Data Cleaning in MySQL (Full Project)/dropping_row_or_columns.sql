-- removing unnecessary row or columns
use world_layoffs;

SET SQL_SAFE_UPDATES = 0; -- this fixes error code 1175..safe update mode in MySQL

select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null
;

DELETE 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null
;

ALTER TABLE layoffs_staging2 DROP COLUMN row_num;