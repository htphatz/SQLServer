USE NORTHWND

-- Hãy cho biết những khách hàng nào đặt nhiều hơn 20 đơn, sắp xếp theo thứ tự tổng số đơn hàng giảm dần
SELECT CustomerID,
	   COUNT(OrderID) AS 'TotalOrderPerPerson'
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC

-- Hãy lọc ra những nhà cung cấp có tổng số lượng hàng trong kho (UnitsInStock) > 30 và
-- có trung bình đơn giá (UnitPrice) có giá trị dưới 50
SELECT SupplierID,
	   SUM(UnitsInStock) AS 'TotalUnitsInStock',
	   AVG(UnitPrice) AS 'AvgUnitPric'
FROM dbo.Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock) > 30 AND AVG(UnitPrice) < 50

-- Hãy cho biết tổng số tiền vận chuyển của từng tháng, trong nửa năm sau của năm 1996
-- sắp xếp theo tháng tăng dần
SELECT MONTH(ShippedDate) AS 'Month',
       YEAR(ShippedDate) AS 'Year',
	   SUM(Freight) AS 'TotalFreight'
FROM dbo.Orders
WHERE MONTH(ShippedDate) > 6 AND YEAR(ShippedDate) = 1996
GROUP BY MONTH(ShippedDate), YEAR(ShippedDate)
--HAVING
ORDER BY MONTH(ShippedDate) ASC

-- Hãy lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng giảm dần
SELECT ShipCity,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders
GROUP BY ShipCity
HAVING SUM(OrderID) > 16
ORDER BY SUM(OrderID) DESC