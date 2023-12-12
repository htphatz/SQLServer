USE NORTHWND

-- Truy vấn I. Từ bảng Order details in ra đơn đặt hàng có giá nằm trong khoảng [100, 200]
-- I - 22 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200

-- Truy vấn II. Từ bảng Order details in ra đơn đặt hàng có số lượng bằng 10 hoặc 20
-- II - 433 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20)

-- Truy vấn III. Từ bảng Order details in ra đơn đặt hàng có giá nằm trong khoảng [100, 200] và có số lượng bằng 10 hoặc 20
-- III = I AND II = 7 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20) AND UnitPrice BETWEEN 100 AND 200

-- Truy vấn IV. Từ bảng Order details in ra đơn đặt hàng có giá nằm trong khoảng [100, 200] hoặc có số lượng bằng 10 hoặc 20
-- IV = I OR II = 448 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20) OR UnitPrice BETWEEN 100 AND 200

-- Truy vấn V. Từ bảng Order details in ra đơn đặt hàng có giá nằm trong khoảng [100, 200] hoặc có số lượng bằng 10 hoặc 20, sử dụng DISTINCT
-- V = IV + DISTINCT = 360 rows
SELECT DISTINCT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20) OR UnitPrice BETWEEN 100 AND 200

-- Sử dụng UNION thay thế truy vấn 5 (OR + DISTINCT)
-- UNION = I OR II = 360 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20)
UNION
SELECT OrderID
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200

-- Sử dụng UNION ALL
-- UNION ALL = I OR II = 448 + 7 = 455 rows
SELECT OrderID
FROM dbo.[Order Details]
WHERE Quantity IN (10, 20)
UNION ALL
SELECT OrderID
FROM dbo.[Order Details]
WHERE UnitPrice BETWEEN 100 AND 200

-- Lấy tất cả quốc gia từ 2 bảng Suppliers và Customers bằng UNION và UNION
SELECT Country
FROM dbo.Suppliers
UNION
SELECT Country
FROM dbo.Customers

SELECT Country
FROM dbo.Suppliers
UNION ALL
SELECT Country
FROM dbo.Customers

-- Hãy lấy tất cả các tên Country và City không trùng lặp từ 3 bảng Suppliers, Orders, Customers  
-- Tên của những khách hàng đến từ đất nước bắt đầu bằng chữ 'U' 
-- Nhà cung cấp đến từ thành phố LonDon
-- Giao hàng đến đất nước USA
SELECT City, Country
FROM Customers
WHERE Country LIKE 'U%'
UNION
SELECT City, Country
FROM Suppliers
WHERE City = 'London'
UNION
SELECT ShipCity, ShipCountry
FROM Orders
WHERE ShipCountry = 'USA'

