USE NORTHWND

-- Tính số lượng đơn đặt trong năm 1997 của từng khách hàng
SELECT CustomerID, 
	COUNT(OrderID) AS 'TotalOrders', 
	YEAR(OrderDate) As 'Year'
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY CustomerID, YEAR(OrderDate)

-- Lọc ra các đơn hàng được đặt vào tháng 5 năm 1997
SELECT *
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 5 

-- Lấy danh sách khách hàng đặt trong năm 1998 và số đơn hàng mỗi tháng sắp xếp theo thứ tự tăng dần
SELECT CustomerID,
	   MONTH(OrderDate) AS 'Month',
	   COUNT(*)
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate)

-- Tính số lượng mỗi loại hàng trong đơn hàng được giao vào tháng 5 và sắp xếp giảm dần theo năm
SELECT OrderID,
	   MONTH(OrderDate) AS 'MONTH',
	   COUNT(*) AS 'TotalOrder'
FROM dbo.Orders
WHERE MONTH(OrderDate) = 5
GROUP BY OrderID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate) DESC



