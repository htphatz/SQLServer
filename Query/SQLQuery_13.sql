USE NORTHWND

-- Liệt kê tất cả sản phẩm có số lượng trong kho (UnitsInStock) thuộc khoảng <50 hoặc >100
SELECT ProductID, ProductName, UnitsInStock
FROM dbo.Products
WHERE (UnitsInStock < 50) OR (UnitsInStock > 100)

-- Liệt kê tất cả các đơn hàng giao muộn đến Brazil, biết ngày cần giao hàng là 
-- RequiredDate và ngày giao hàng thực tế là ShippedDate
SELECT OrderID, RequiredDate, ShippedDate, ShipCountry
FROM dbo.Orders
WHERE (ShipCountry = 'Brazil') AND (RequiredDate < ShippedDate)

-- Dùng NOT lấy ra tất cả các sản phẩm dưới 100$ và mã thể loại khác 1
SELECT *
FROM dbo.Products
WHERE NOT (UnitPrice >= 100 OR CategoryID = 1)

-- Liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20 và số lượng đơn hàng
-- (UnitsOnOrder) nhỏ hơn 20
SELECT *
FROM dbo.Products
WHERE UnitsInStock > 20 AND UnitsOnOrder < 20 