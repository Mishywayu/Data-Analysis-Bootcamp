USE e_library;

select * from authors;
select * from books;
select * from loans;
select * from members;

-- 1. Retrieve all books with their authors.
select b.book_id,
       a.name,
	   b.title,
       b.published_year
from authors a
join books b on a.author_id = b.author_id
group by book_id
;

-- 2. Find all active members.
select * from members
where status = "active"
;

-- 3. List all books published after 2000.
select * from books
where published_year > 2000
;
