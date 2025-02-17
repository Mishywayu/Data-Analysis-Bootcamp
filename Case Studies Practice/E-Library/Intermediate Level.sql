USE e_library;

select * from authors;
select * from books;
select * from loans;
select * from members;


-- Count the total number of books by each author.
select a.name,
	   count(b.book_id) as book_count
from authors a
left join books b on a.author_id = b.author_id
group by a.name
;

-- Find all books currently on loan with member details.
select a.title,
	   b.*
from books a
join loans c on a.book_id = c.book_id
join members b on c.member_id = b.member_id
where c.return_date is null
;

-- Calculate the total number of books loaned each month in the past year.
select count(book_id) as total_books,
	   month(loan_date) as month,
       year(loan_date) as year
from loans
where year(loan_date) >= YEAR(CURDATE()) - 1
group by year, month
order by year, month 
;

