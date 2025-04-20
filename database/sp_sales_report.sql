USE EnterpriseSalesDB;
GO

CREATE OR ALTER PROCEDURE sp_sales_report
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.SaleDate,
        c.CustomerName,
        c.Region,
        p.ProductName,
        p.Category,
        s.Quantity,
        s.UnitPrice,
        s.Quantity * s.UnitPrice AS TotalAmount
    FROM Sales s
    INNER JOIN Customers c ON c.CustomerID = s.CustomerID
    INNER JOIN Products p ON p.ProductID = s.ProductID;
END
  