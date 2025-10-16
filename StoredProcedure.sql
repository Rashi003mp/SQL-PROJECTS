
CREATE OR ALTER PROCEDURE GetAllBookTitles
AS
BEGIN
    SELECT Title 
    FROM BooksV2;
END;
GO


CREATE OR ALTER PROCEDURE GetBooksByAuthor
    @AuthorName NVARCHAR(100)
AS
BEGIN
    SELECT 
        b.Title,
        a.Name AS AuthorName,
        b.PublicationYear
    FROM BooksV2 b
    INNER JOIN Authors a ON b.AuthorID = a.AuthorID
    WHERE a.Name = @AuthorName;
END;
GO


CREATE OR ALTER FUNCTION fn_GetBookCountByAuthor(@AuthorName NVARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @BookCount INT;

    SELECT @BookCount = COUNT(b.BookID)
    FROM BooksV2 b
    INNER JOIN Authors a ON b.AuthorID = a.AuthorID
    WHERE a.Name = @AuthorName;

    RETURN @BookCount;
END;
GO

