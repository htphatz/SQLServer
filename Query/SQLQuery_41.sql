USE NORTHWND

SELECT *
INTO Products_copy
FROM dbo.Products

-- Tăng toàn bộ sản phẩm lên 10%
UPDATE dbo.Products_copy
SET UnitPrice = UnitPrice * 110 / 100;

-- Cập nhật thông tin sản phẩm có ProductID = 7 để thay đổi thông tin thành "Máy tính xách tay"
-- và có giá 99.99$
UPDATE dbo.Products_copy
SET ProductName = 'Máy tính xách tay',
	UnitPrice = 99.99
WHERE ProductID = 7