CREATE TABLE Books (
BookID INT IDENTITY(1,1) PRIMARY KEY ,
Title NVARCHAR(100) NOT NULL,
Author NVARCHAR (100) NOT NULL ,
PublicationYear INT NOT NULL
);

INSERT INTO Books (Title,Author,PublicationYear)
VALUES
('The Alchemist', 'Paulo Coelho', 1988),
('1984', 'George Orwell', 1949),
('To Kill a Mockingbird', 'Harper Lee', 1960),
('Brave New World', 'Aldous Huxley', 1932),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('Animal Farm', 'George Orwell', 1945);

SELECT * FROM Books WHERE PublicationYear =1949;
SELECT * FROM Books WHERE Author='George Orwell';
SELECT DISTINCT Author FROM Books;
SELECT *FROM Books;