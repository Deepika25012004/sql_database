 E-Commerce Database Project:

This project is a simple E-Commerce database implemented in SQL. It includes tables for products, customers, orders, and order details. The database is designed to manage an online store's inventory, customer information, and order processing.

 Features
- CRUD Operations: Create, Read, Update, and Delete records for products, customers, and orders.
- Sample Data: Pre-populated with sample data for testing and demonstration.
- Example Queries: Includes SQL queries to analyze sales, calculate revenue, and update inventory.
- Scalable: Easily extendable to include additional features like categories, suppliers, or payment processing.
 Database Structure:
 Tables
1. Products:
   - ProductID (Primary Key)
   - ProductName
   - Price
   - StockQuantity
2. Customers:
   - CustomerID (Primary Key)
   - FirstName
   - LastName
   - Email
   - Address
3. Orders:
   - OrderID (Primary Key)
   - CustomerID (Foreign Key)
   - OrderDate
   - TotalAmount

4. OrderDetails:
   - OrderDetailID (Primary Key)
   - OrderID (Foreign Key)
   - ProductID (Foreign Key)
   - Quantity
   - Price

