USE e_library;

select * from authors;
select * from books;
select * from loans;
select * from members;

-- Identify members who have never borrowed a book.
select a.* from members a
left join loans b on a.member_id = b.member_id
where b.loan_id is null;
 
-- Create a stored procedure to get loan history for a given member.
DELIMITER $$
CREATE PROCEDURE loan_history(member_id_param INT)
BEGIN
	select a.*, b.title from loans a
    join books b on a.book_id = b.book_id
    where a.member_id = member_id_param;
END $$
DELIMITER ;

CALL loan_history(2);

-- Add an index on book titles for faster searches.
CREATE INDEX book_title ON books(title);

-- Create a trigger to automatically update book availability after a loan is recorded.
DELIMITER $$
CREATE TRIGGER update_availability
AFTER INSERT ON loans
FOR EACH ROW
BEGIN
	UPDATE books
    SET available_copies = available_copies - 1
    WHERE book_id = NEW.book_id;
END $$