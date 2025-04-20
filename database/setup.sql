CREATE DATABASE EnterpriseSalesDB;
GO
USE EnterpriseSalesDB;

-- Müþteriler
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    CustomerName NVARCHAR(100),
    Country NVARCHAR(50)
);

-- Ürünler
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50)
);

-- Satýþlar (BIG DATA SENARYOSU)
CREATE TABLE Sales (
    SaleID BIGINT PRIMARY KEY IDENTITY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    SaleDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);


