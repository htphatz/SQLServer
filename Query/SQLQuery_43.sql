USE NORTHWND

-- Tạo view thống kế theo tháng
CREATE VIEW ThongKeTheoThang 
AS
SELECT YEAR([OrderDate]) AS "Năm",
	   MONTH([OrderDate]) AS "Tháng",
	   COUNT(*) AS "Số lượng đơn hàng"
FROM [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate])

-- Truy vấn đến VIEW
SELECT * FROM ThongKeTheoThang

-- Tương đương
SELECT * FROM (
	SELECT YEAR([OrderDate]) AS "Năm",
	   MONTH([OrderDate]) AS "Tháng",
	   COUNT(*) AS "Số lượng đơn hàng"
FROM [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate])
) AS temp;

-- Tạo view kết hợp thông tin khách hàng và đơn hàng
CREATE VIEW CustomerOrders AS
SELECT
	C.CustomerID,
	C.CompanyName,
	C.ContactName,
	O.OrderID,
	O.OrderDate,
	O.ShipCountry
FROM dbo.Customers C
JOIN dbo.Orders O ON C.CustomerID = O.OrderID

-- Tạo view tên HighValueProducts để hiển thị danh sách các sản phẩm có giá trị cao hơn 50$
CREATE VIEW HighValueProducts AS
SELECT *
FROM dbo.Products
WHERE UnitPrice > 50

-- Tạo view tên CustomerOrders để hiện thị thông tin về khách hàng và số lượng hàng của họ
CREATE VIEW CustomerOrders AS
SELECT c.CustomerID,
	   c.ContactName,
	   COUNT(o.OrderID) AS 'TotalOrdersPerSCustomer'
FROM dbo.Customers c
JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName

-- Tạo view tên EmployeeSalesByYear để hiển thị tổng doanh số bán hàng của từng nhân viên theo năm
CREATE VIEW EmployeeSalesByYear AS
SELECT o.EmployeeID, 
	   YEAR(o.OrderDate) AS 'Year',
	   SUM(od.UnitPrice * od.Quantity) AS 'TotalPrices'
FROM dbo.[Order Details] od
JOIN dbo.Orders o
ON od.OrderID = o.OrderID
GROUP BY  o.EmployeeID,  YEAR(o.OrderDate)

-- Tạo view tên CategoryProductCounts để hiển thị số lượng sản phẩm trong mỗi danh mục sản phẩm
CREATE VIEW CategoryProductCounts AS
SELECT c.CategoryID,
	   c.CategoryName,
	   COUNT(p.ProductID) AS 'TotalProducts'
FROM dbo.Categories c
JOIN dbo.Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName

-- Tạo view tên CustomerOrderSummary để hiển thị tổng giá trị đặt hàng của mỗi khách hàng
CREATE VIEW CustomerOrderSummary AS
(SELECT o.CustomerID, 
	   SUM(od.UnitPrice * od.Quantity) AS 'TotalPrices'
FROM dbo.[Order Details] od
JOIN dbo.Orders o
ON od.OrderID = o.OrderID
GROUP BY  o.CustomerID,  YEAR(o.OrderDate)
);