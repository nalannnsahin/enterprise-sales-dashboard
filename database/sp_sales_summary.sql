CREATE OR ALTER PROCEDURE sp_Enterprise_SalesSummary
AS
BEGIN
    SELECT
        P.ProductName,
        C.Region,
        CAST(S.SaleDate AS DATE) AS SaleDate,
        SUM(S.Quantity) AS TotalQuantity,
        SUM(S.Quantity * S.UnitPrice) AS TotalSales
    FROM Sales S
    INNER JOIN Products P ON S.ProductID = P.ProductID
    INNER JOIN Customers C ON S.CustomerID = C.CustomerID
    GROUP BY P.ProductName, C.Region, CAST(S.SaleDate AS DATE)
END

