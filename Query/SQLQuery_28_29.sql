USE NORTHWND

SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products

SELECT AVG(UnitPrice)
FROM dbo.Products

-- Lấy ra những sản phẩm có giá lớn hơn giá trung bình
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 28.4962

-- Lấy ra những sản phẩm có giá lớn hơn giá trung bình bằng Sub query
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > (
	SELECT AVG(UnitPrice)
	FROM dbo.Products
);

-- Lọc ra những khách hàng có số đơn hàng > 10 bằng 2 cách
SELECT c.CustomerID, c.CompanyName,
	   COUNT(o.OrderID) AS 'TotalOrders'
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 10

-- Lấy ra những ID khách hàng có đơn hàng > 10
SELECT CustomerID
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(CustomerID) > 10

SELECT *
FROM dbo.Customers
WHERE CustomerID IN (
	SELECT CustomerID
	FROM dbo.Orders
	GROUP BY CustomerID
	HAVING COUNT(CustomerID) > 10
);

-- Tính tổng tiền cho từng đơn hàng
SELECT o.*,
	   (
	   SELECT SUM(od.UnitPrice * od.Quantity)
	   FROM dbo.[Order Details] od
	   WHERE o.OrderID = od.OrderID
	   ) AS 'TotalPrice'
FROM dbo.Orders o

-- Lọc tên sản phẩm và tổng số đơn hàng của từng sản phẩm
SELECT p.ProductID, p.ProductName,
	   (
	   SELECT COUNT(od.OrderID)
	   FROM dbo.[Order Details] od
	   WHERE p.ProductID = od.ProductID
	   ) AS 'TotalOrders'
FROM dbo.Products p

-- Hãy in ra Mã đơn hàng và số lượng sản phẩm của đơn hàng đó
SELECT o.OrderID, 
       (
	   SELECT COUNT(od.ProductID)
	   FROM dbo.[Order Details] od
	   WHERE o.OrderID = od.OrderID
	   ) AS 'TotalProducts'
FROM dbo.Orders o

-- Liệt kê các đơn hàng có ngày đặt hàng gần nhất
SELECT *
FROM dbo.Orders 
WHERE OrderDate IN (
	SELECT MAX(OrderDate)
	FROM dbo.Orders
);

-- Liệt kê tất cả sản phẩm mã không có đơn đặt hàng nào đặt mua chúng
SELECT *
FROM dbo.Products
WHERE ProductID NOT IN (
	  SELECT DISTINCT ProductID
	  FROM dbo.[Order Details]
);

-- Lấy thông tin về các đơn hàng và tên sản phẩm 
-- thuộc các đơn hàng chưa được giao cho khách
SELECT o.*, p.ProductID, p.ProductName
FROM dbo.Orders o
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
JOIN dbo.Products p
ON od.ProductID = p.ProductID
WHERE o.OrderID IN (
	  SELECT o.OrderID
	  FROM dbo.Orders o
      WHERE o.ShippedDate IS NULL
);

-- Lấy thông tin về các sản phẩm có số lượng tồn kho
-- ít hơn số lượng tồn kho trung bình của tất cả sản phẩm
SELECT *
FROM dbo.Products p
WHERE UnitsInStock < (
	  SELECT AVG(p.UnitsInStock)
	  FROM dbo.Products p
);

-- Lấy thông tin khách hàng có tổng giá trị đơn hàng lớn nhất
SELECT DISTINCT c.*
FROM dbo.Orders o
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IN (
	SELECT TOP 1 od.OrderID
	FROM dbo.[Order Details] od
	GROUP BY od.OrderID
	ORDER BY SUM(od.Quantity * od.UnitPrice) DESC
);

SELECT od.OrderID,
	   SUM(od.Quantity * od.UnitPrice) AS 'TotalPrices'
FROM dbo.[Order Details] od
GROUP BY od.OrderID
ORDER BY SUM(od.Quantity * od.UnitPrice) DESC


SELECT C.*
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O
ON O.CustomerID = C.CustomerID
WHERE [OrderID] IN (
	SELECT TOP 1 OrderID
	FROM [dbo].[Order Details]
	GROUP BY OrderID
	ORDER BY SUM([UnitPrice]*[Quantity]) DESC);




