USE NORTHWND

-- Bài 1(JOIN): Liệt kê tên sản phẩm và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng Order details
SELECT DISTINCT p.ProductID, p.ProductName, s.CompanyName
FROM dbo.[Order Details] od
JOIN dbo.Products p
ON od.ProductID = p.ProductID
JOIN dbo.Suppliers s
ON p.SupplierID = s.SupplierID

-- Bài 2(LEFT JOIN): Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders
-- bao gồm các đơn hàng không có nhân viên phụ trách 
SELECT o.OrderID, e.LastName, e.FirstName, c.CompanyName
FROM dbo.Orders o
LEFT JOIN dbo.Employees e
ON o.EmployeeID = e.EmployeeID
LEFT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID

-- Bài 3(RIGHT JOIN): Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng Orders
-- bao gồm cả khách hàng không có đơn hàng
SELECT o.OrderID, c.CompanyName ,e.LastName, e.FirstName
FROM dbo.Orders o
RIGHT JOIN dbo.Employees e
ON o.EmployeeID = e.EmployeeID
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID

SELECT o.OrderID, c.CompanyName ,e.LastName, e.FirstName
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN dbo.Employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY o.OrderID

-- Bài 4(FULL JOIN): Liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng Products
-- bao gồm các danh mục và nhà cung cấp không có sản phẩm
SELECT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
FROM dbo.Products p
FULL JOIN dbo.Categories c
ON c.CategoryID = p.CategoryID
FULL JOIN dbo.Suppliers s
ON s.SupplierID = p.SupplierID

-- Bài 5(INNER JOIN): Liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng trong bảng Orders và Order details
SELECT DISTINCT p.ProductName, c.ContactName
FROM dbo.[Order Details] od
JOIN dbo.Orders o
ON od.OrderID = o.OrderID
JOIN dbo.Products p
ON p.ProductID = od.ProductID
JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID

-- Bài 6(FULL JOIN): Liệt kê tên nhân viên và tên khách hàng trong các đơn hàng trong bảng Orders 
-- bao gồm cả các đơn hàng không có nhân viên hoặc khách hàng tương ứng
SELECT o.OrderID, e.LastName, e.FirstName, c.ContactName
FROM dbo.Orders o
FULL JOIN dbo.Employees e
ON e.EmployeeID = o.EmployeeID
FULL JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID



