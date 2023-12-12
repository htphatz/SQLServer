USE NORTHWND

-- Sao chép bảng Customers
SELECT *
INTO Customers_copy
FROM dbo.Customers

-- Xóa toàn bộ khách hàng ở London
DELETE FROM dbo.Customers_copy
WHERE City = 'London'

-- Xóa toàn bộ bảng Customers_copy
DELETE FROM dbo.Customers_copy