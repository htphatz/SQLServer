USE NORTHWND

-- Bài 1: Cho biết những khách hàng đặt nhiều đơn hơn 20, sắp xếp theo tổng đơn hàng giảm dần
SELECT CustomerID,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC

-- Bài 2: Lọc ra các nhân viên có tổng số đơn hàng lớn hơn hoặc bằng 100, sắp xếp theo tổng đơn hàng giảm dần
SELECT EmployeeID,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= 100
ORDER BY COUNT(OrderID) DESC

-- Bài 3: Cho biết những thể loại nào (CategoryID) có số sản phẩm khác nhau lớn hơn 11
SELECT CategoryID,
	   COUNT(ProductID) AS 'TotalProducts'
FROM dbo.Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 11

-- Bài 4: Cho biết những thể loại nào (CategoryID) có tổng số lượng sản phẩm trong kho (UnitsInStock) lớn hơn 350
SELECT CategoryID,
	   SUM(UnitsInStock) AS 'TotalUnitsInStock'
FROM dbo.Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 350

-- Bài 5: Hãy cho biết quốc gia nào có nhiều hơn 7 khách hàng
SELECT Country,
	   COUNT(CustomerID) AS 'TotalCustomers'
FROM dbo.Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 7

SELECT ShipCountry,
	   COUNT(CustomerID) AS 'TotalCustomers'
FROM dbo.Orders
GROUP BY ShipCountry
HAVING COUNT(CustomerID) > 7

-- Bài 6: Cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, sắp xếp theo thứ tự tăng dần ngày giao
SELECT ShippedDate,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
WHERE ShippedDate IS NOT NULL
GROUP BY ShippedDate
HAVING COUNT(OrderID) > 5
ORDER BY ShippedDate ASC

-- Bài 7: Hãy cho biết những quốc gia bắt đầu bằng 'A' hoặc 'G' và có số lượng đơn hàng lớn hơn 29
SELECT ShipCountry,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
WHERE ShipCountry LIKE 'A%' OR ShipCountry LIKE 'G%'
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 29

-- Bài 8: Cho biết những thành phố nào có số lượng đơn hàng được giao khác 1 và 2
-- ngày đặt từ '1997-04-01' đến '1997-08-31'
SELECT ShipCity,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
WHERE ShippedDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(OrderID) NOT BETWEEN 1 AND 2
	
