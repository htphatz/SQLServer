USE NORTHWND

-- Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
SELECT CustomerID, COUNT(OrderID) AS 'TotalOrder'
FROM dbo.Orders
GROUP BY CustomerID

-- Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp
SELECT SupplierID, AVG(UnitPrice) AS 'AvgPriceOfProduct'
FROM dbo.Products
GROUP BY SupplierID

-- Hãy cho biết mỗi thể loại có bao nhiêu sản phẩm trong kho
SELECT CategoryID, SUM(UnitsInStock) AS 'TotalInStock'
FROM dbo.Products
GROUP BY CategoryID;

-- Hãy cho biết giá vận chuyển thấp nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau
SELECT ShipCountry, ShipCity,
	   MIN(Freight) AS 'MinFreight',
	   MAX(Freight) AS 'MaxFreight'
FROM dbo.Orders
GROUP BY ShipCountry, ShipCity

-- Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
SELECT Country, COUNT(EmployeeID) AS 'TotalEmployeeInCountry'
FROM dbo.Employees
GROUP BY Country


