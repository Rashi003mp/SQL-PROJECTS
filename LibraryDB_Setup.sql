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

create table Authors (
AuthorID int Identity(1,1) Primary Key,
Name VarChar(40),
birthday int
);

Create table Publishers(
	PublisherID int Identity(1,1) Primary key,
	name varchar(30),
	City varchar(67)
);

-- Books table with foreign keys
CREATE TABLE BooksV2 (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT,
    PublicationYear INT NOT NULL,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_Books_Publishers FOREIGN KEY (PublisherID)
        REFERENCES Publishers(PublisherID)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);


-- Insert authors
INSERT INTO Authors (Name, birthday)
VALUES
('Paulo Coelho', 1947),
('George Orwell', 1903),
('Harper Lee', 1926),
('Aldous Huxley', 1894),
('F. Scott Fitzgerald', 1896);

-- Insert publishers
INSERT INTO Publishers (Name, City)
VALUES
('Penguin Random House', 'New York'),
('HarperCollins', 'London'),
('Vintage Books', 'London');

-- Insert books with AuthorID and PublisherID
INSERT INTO BooksV2 (Title, AuthorID, PublisherID, PublicationYear)
VALUES
('The Alchemist', 1, 1, 1988),
('1984', 2, 2, 1949),
('To Kill a Mockingbird', 3, 2, 1960),
('Brave New World', 4, 3, 1932),
('The Great Gatsby', 5, 1, 1925),
('Animal Farm', 2, 2, 1945);

SELECT 
    b.Title,
    a.Name AS AuthorName,
    p.Name AS PublisherName,
    b.PublicationYear
FROM BooksV2 b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
INNER JOIN Publishers p ON b.PublisherID = p.PublisherID;

SELECT 
    b.Title,
    a.Name AS AuthorName,
    p.Name AS PublisherName,
    b.PublicationYear
FROM Booksv2 b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID
LEFT JOIN Publishers p ON b.PublisherID = p.PublisherID;

