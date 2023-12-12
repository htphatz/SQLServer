USE NORTHWND;

WITH Short_e AS (
	SELECT EmployeeID, LastName, FirstName
	FROM dbo.Employees
)
SELECT * FROM Short_e;

-- Lấy thông tin về những sản phẩm có cùng thể loại với sản phẩm 'Chai'
WITH ProductCategory AS (
	SELECT CategoryID
	FROM Products 
	WHERE ProductName = 'Chai'
)
SELECT p.ProductName, p.CategoryID
FROM dbo.Products p
JOIN ProductCategory pc
ON p.CategoryID = pc.CategoryID

-- Lấy thông tin về những đơn hàng với tổng giá trị đơn hàng và tỷ lệ giữa tổng giá trị và phí giao hàng (Ratio)
WITH OrderTotals AS (
	SELECT OrderID,
		   SUM(od.Quantity * od.UnitPrice) AS 'TotalPrices'
	FROM dbo.[Order Details] od
	GROUP BY OrderID
)
SELECT o.OrderID, o.OrderDate, o.Freight, ot.TotalPrices,
	   (ot.TotalPrices / o.Freight) AS 'Ratio'
FROM dbo.Orders o
JOIN OrderTotals ot
ON ot.OrderID = o.OrderID

-- Sử dụng CTE tính tổng doanh số bán hàng cho từng sản phẩm từ 2 bảng Order details và Products 
WITH ox1 AS (
	SELECT od.ProductID,
		   SUM(od.Quantity * od.UnitPrice) AS 'TotalPrices'
	FROM [Order Details] od
	GROUP BY od.ProductID
)
SELECT p.ProductID, p.ProductName, ox1.TotalPrices
FROM dbo.Products p
JOIN ox1
ON ox1.ProductID = p.ProductID

-- Sử dụng CTE tính tổng doanh số bán hàng theo từng khách hàng và sau đó sắp xếp danh sách khách hàng theo doanh số giảm dần
WITH ox2 AS (
	SELECT od.OrderID,
		   SUM(od.Quantity * od.UnitPrice) AS 'TotalPrices'
	FROM [Order Details] od
	GROUP BY od.OrderID
)
SELECT c.CompanyName, ox2.TotalPrices
FROM dbo.Customers c
JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
JOIN ox2
ON ox2.OrderID = o.OrderID
ORDER BY ox2.TotalPrices DESC

-- Sử dụng CTE tính tổng doanh số bán hàng theo năm từ bảng Orders và Order details
WITH ox3 AS (
	SELECT od.OrderID,
		   SUM(od.Quantity * od.UnitPrice) AS 'TotalPrices'
	FROM [Order Details] od
	GROUP BY od.OrderID
)
SELECT YEAR(o.OrderDate) AS 'Year',
	   SUM(ox3.TotalPrices) AS 'IncomePerYear'
FROM dbo.Orders o
JOIN ox3
ON ox3.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate)

