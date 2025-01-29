-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS ECommerceDB;
USE ECommerceDB;

-- Step 2: Create Tables

-- Products Table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 3: Insert Sample Data

-- Insert into Products
INSERT INTO Products (ProductName, Price, StockQuantity) VALUES
('Laptop', 1200.00, 10),
('Smartphone', 800.00, 20),
('Headphones', 100.00, 50);

-- Insert into Customers
INSERT INTO Customers (FirstName, LastName, Email, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St');

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-10-01', 1200.00),
(2, '2023-10-02', 1600.00);

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1200.00),  -- John bought a Laptop
(2, 2, 2, 1600.00);  -- Jane bought 2 Smartphones

-- Step 4: Example Queries

-- Query 1: List all products
SELECT * FROM Products;

-- Query 2: List all customers
SELECT * FROM Customers;

-- Query 3: List all orders with customer details
SELECT 
    Orders.OrderID, 
    Customers.FirstName, 
    Customers.LastName, 
    Orders.OrderDate, 
    Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Query 4: List order details with product names
SELECT 
    OrderDetails.OrderDetailID,
    Orders.OrderID,
    Products.ProductName,
    OrderDetails.Quantity,
    OrderDetails.Price
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- Query 5: Calculate total revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- Query 6: Update stock quantity after an order
UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 1;  -- Assuming ProductID 1 (Laptop) was sold

