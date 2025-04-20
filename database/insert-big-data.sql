INSERT INTO Products VALUES
('Laptop', 'Electronics'),
('Phone', 'Electronics'),
('Tablet', 'Electronics'),
('Chair', 'Furniture'),
('Desk', 'Furniture');

INSERT INTO Customers VALUES
('John Doe', 'North'),
('Jane Smith', 'South'),
('Alice Brown', 'East'),
('Bob Gray', 'West');

--- fake 100K pieces of data added
DECLARE @i INT = 0;
WHILE @i < 100000
BEGIN
    INSERT INTO Sales (ProductID, CustomerID, SaleDate, Quantity, UnitPrice)
    VALUES (
        1 + ABS(CHECKSUM(NEWID())) % 5,        -- productid created between 1 to 5
        1 + ABS(CHECKSUM(NEWID())) % 4,        -- customerid created between 1 to 4
        DATEADD(DAY, -1 * ABS(CHECKSUM(NEWID())) % 730, GETDATE()), -- last 2 year
        1 + ABS(CHECKSUM(NEWID())) % 10,       -- quantity: 1-10
        50 + ABS(CHECKSUM(NEWID())) % 500      -- unitprice: 50-550
    );
    SET @i += 1;
END

