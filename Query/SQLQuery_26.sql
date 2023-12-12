USE NORTHWND

------------------- Dùng INNER JOIN -------------------
-- Từ bảng Products và Categories in ra: Mã/tên thể loại, mã/tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p
INNER JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID

-- Từ bảng Products và Categories in ra: Mã/tên thể loại, số lượng sản phẩm
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS 'TotalProducts'
FROM dbo.Products p
JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName

------------------- Dùng LEFT JOIN -------------------
-- Từ bảng Products và Categories in ra: Mã/tên thể loại, mã/tên sản phẩm
-- Sau đó so sánh sự khác nhau giữa tổng số tượng sản phẩm của mỗi thể loại bằng JOIN và LEFT JOIN
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS 'TotalProducts'
FROM dbo.Categories c
JOIN dbo.Products p
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS 'TotalProducts'
FROM dbo.Categories c
LEFT JOIN dbo.Products p
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName

------------------- Dùng RIGHT JOIN -------------------
-- Từ bảng Orders và Customers in ra: Mã đơn hàng, tên công ty khách hàng
SELECT o.OrderID, c.CompanyName
FROM dbo.Orders o
JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID

SELECT o.OrderID, c.CompanyName
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID

SELECT c.CompanyName, COUNT(o.OrderID) AS 'TotalOrders'
FROM dbo.Orders o 
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName

------------------- Dùng FULL JOIN -------------------
-- Từ bảng Products và Categories in ra: Mã/tên thể loại, mã/tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p
FULL JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p
JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p
LEFT JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p
RIGHT JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID

-- Bài 1(INNER JOIN): Hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng Orders
SELECT e.LastName, e.FirstName, o.CustomerID
FROM  dbo.Orders o
JOIN dbo.Employees e
ON e.EmployeeID = o.EmployeeID
JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID

-- Bài 2(LEFT JOIN): Hãy liệt kê nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng Products
-- bao gồm cả sản phẩm không có nhà cung cấp
SELECT p.ProductName, s.ContactName
FROM dbo.Products p
LEFT JOIN dbo.Suppliers s
ON s.SupplierID = p.SupplierID

-- Bài 3(RIGHT JOIN): Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng Orders
-- bao gồm cả các khách hàng không có đơn hàng
SELECT c.ContactName, o.OrderID
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID

-- Bài 4(FULL JOIN): Hãy liệt kê tên danh mục và tên nhà cung cấp các sản phẩm trong bảng Products
-- bao gồm các danh mục và nhà cung cấp không có sản phẩm
SELECT c.CategoryName, s.CompanyName
FROM dbo.Products p
FULL JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID
FULL JOIN dbo.Suppliers s
ON s.SupplierID = p.SupplierID

