
CREATE OR ALTER VIEW vw_BookAuthorDetails
AS
SELECT 
    b.BookID,
    b.Title AS BookTitle,
    b.PublicationYear,
    a.AuthorID,
    a.Name AS AuthorName,
    a.Birthday AS AuthorBirthYear
FROM BooksV2 b
INNER JOIN Authors a
    ON b.AuthorID = a.AuthorID;
GO


SELECT * FROM vw_BookAuthorDetails;
