USE NORTHWND

-- Lấy ra danh sách sản phẩm có giá bán nằm trong khoảng 10 đến 20$
SELECT *
FROM dbo.Products
WHERE UnitPrice BETWEEN 10 and 20

SELECT *
FROM dbo.Products
WHERE  10 <= UnitPrice AND UnitPrice <= 20

-- Lấy danh sách các đơn hàng đặt trong khoảng 1996-07-01 đến 1996-03-31
SELECT *
FROM dbo.Orders 
WHERE OrderDate BETWEEN '1996-07-01' and '1996-07-31'

-- Lấy danh sách các đơn đặt hàng từ ngày 1/1/1997 đến 31/12/1997 
-- và được vận chuyển bằng tàu thủy (ShipVia = 3)
SELECT *
FROM dbo.Orders
WHERE OrderDate BETWEEN '1996-01-01' and '1996-12-31' AND ShipVia = 3
	  