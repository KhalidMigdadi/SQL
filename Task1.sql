CREATE DATABASE Library;

Create Table Books 
(
	BookID int Primary Key,
	Title varchar(50),
	AuthorID int,
	PublishedYear int,
	CopiesAvailable int,
	BookCategory varchar(50)

);


Create Table Authors 
(
	AuthorID int Primary Key,
	FirstName varchar(50),
	LastName varchar(50),
	BirthYear int
);


INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory)
Values(1, 'Atomic Habits', 1, 2005, 5, 'Marketing'),
(2, 'Strong Habits', 2, 2009, 5, 'Marketing'),
(3, 'Atomic', 3, 2010, 5, 'Prog'),
(4, 'Clean Code', 4, 2012, 5, 'Prog'),
(5, 'Power of Habits', 5, 1995, 5, 'Finance');



INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear)
Values(1,'James' ,'Cleare', 2005),
(2,'James', 'Cleare', 2009),
(3, 'Mohamad', ' Ahmad', 2010),
(4, 'Ahmad', 'Khalid', 2012),
(5, 'Mosa', 'Ahmad', 1995);


SELECT 
    Books.BookID,
    Books.Title,
    Authors.FirstName,
    Authors.LastName,
    Books.PublishedYear,
    Books.CopiesAvailable,
    Books.BookCategory
FROM 
    Books
INNER JOIN 
    Authors ON Books.AuthorID = Authors.AuthorID;

UPDATE Books 
SET CopiesAvailable = 55 
WHERE BookID = 1;

UPDATE Books 
SET CopiesAvailable = 1 
WHERE BookID = 4;


--heighst

SELECT 
BookID,
Title,
CopiesAvailable
FROM 
    Books
WHERE 
    CopiesAvailable = (SELECT MAX(CopiesAvailable) FROM Books);


--lowest

SELECT 
    BookID,
    Title,
    CopiesAvailable
FROM 
    Books
WHERE 
    CopiesAvailable = (SELECT MIN(CopiesAvailable) FROM Books);

--Avarage
Select AVG(PublishedYear ) as Avarage From Books;

--Count
Select COUNT(BookID) as CountBook From Books;

-- add new 2 column

ALTER TABLE Authors
ADD Email VARCHAR(100),
    Phone_Number int;

select * From Authors;

DROP TABLE Authors; 