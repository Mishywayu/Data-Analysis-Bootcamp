-- E-Library Management Database Creation Script
CREATE DATABASE e_library;
USE e_library;

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_year INT
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    published_year INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    join_date DATE,
    status ENUM('active', 'inactive') DEFAULT 'active'
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Sample Data Insertion
INSERT INTO Authors (name, birth_year) 
VALUES ('Jane Austen', 1775), 
	   ('George Orwell', 1903), 
       ('J.K. Rowling', 1965);

INSERT INTO Books (title, author_id, published_year, available_copies) 
VALUES ('Pride and Prejudice', 1, 1813, 3), 
	   ('1984', 2, 1949, 5),
       ('Harry Potter and the Sorcerer''s Stone', 3, 1997, 4);

INSERT INTO Members (name, email, join_date, status) 
VALUES ('Alice Johnson', 'alice@example.com', '2023-01-10', 'active'), 
	   ('Bob Smith', 'bob@example.com', '2022-09-15', 'active');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) 
VALUES (1, 1, '2024-01-05', NULL), 
	   (2, 2, '2024-02-01', '2024-02-15');
