
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Sales_Books FOREIGN KEY (BookID)
        REFERENCES BooksV2(BookID)
        ON DELETE CASCADE
);


INSERT INTO Sales (BookID, SaleDate, SaleAmount)
VALUES
(1, '2023-01-10', 19.99),
(1, '2023-03-15', 22.50),
(2, '2023-02-05', 15.99),
(2, '2024-06-10', 17.99),
(3, '2023-04-22', 25.00),
(3, '2024-05-11', 27.50),
(4, '2024-07-19', 18.00),
(5, '2023-10-01', 21.75),
(6, '2024-09-09', 14.50),
(6, '2024-12-22', 16.25);


SELECT 
    b.Title,
    SUM(s.SaleAmount) AS TotalSales
FROM Sales s
INNER JOIN BooksV2 b ON s.BookID = b.BookID
GROUP BY b.Title;


SELECT 
    b.Title,
    YEAR(s.SaleDate) AS SaleYear,
    SUM(s.SaleAmount) AS TotalSales
FROM Sales s
INNER JOIN BooksV2 b ON s.BookID = b.BookID
GROUP BY b.Title, YEAR(s.SaleDate)
ORDER BY b.Title, SaleYear;


SELECT 
    b.Title,
    SUM(s.SaleAmount) AS TotalSales
FROM Sales s
INNER JOIN BooksV2 b ON s.BookID = b.BookID
GROUP BY b.Title
HAVING SUM(s.SaleAmount) > 40;  


CREATE OR ALTER PROCEDURE GetTotalSalesByTitle
    @BookTitle NVARCHAR(100)
AS
BEGIN
    SELECT 
        b.Title,
        SUM(s.SaleAmount) AS TotalSales
    FROM Sales s
    INNER JOIN BooksV2 b ON s.BookID = b.BookID
    WHERE b.Title = @BookTitle
    GROUP BY b.Title;
END;
GO


CREATE OR ALTER FUNCTION fn_AverageSaleAmount()
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @AvgSale DECIMAL(10,2);
    SELECT @AvgSale = AVG(SaleAmount) FROM Sales;
    RETURN @AvgSale;
END;
GO
