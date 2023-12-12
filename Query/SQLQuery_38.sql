USE NORTHWND

-- Tạo bảng tạm thời "CustomersInLondon" từ bảng Customers để chứa thông tin khách hàng có địa chỉ ở London
SELECT *
INTO CustomersInLondon
FROM dbo.Customers
WHERE City = 'London'

-- Tạo bảng tạm thời "HighValueOrders" để chứa thông tin về các đơn hàng có tổng giá trị đặt hàng lớn hơn 1000$
SELECT  o.OrderID, 
	    SUM (od.Quantity * od.UnitPrice) AS TotalOrders
INTO HighValueOrders 
FROM dbo.Orders  o
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID 
GROUP BY o.[OrderID]
HAVING  SUM (od.Quantity * od.UnitPrice) > 1000


