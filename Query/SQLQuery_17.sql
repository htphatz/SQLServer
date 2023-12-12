USE NORTHWND

-- Hãy lọc các đơn hàng được giao đến Germany, UK, Brazil
SELECT *
FROM dbo.Orders
WHERE ShipCountry IN  ('Germany', 'UK', 'Brazil')

-- Lấy ra các sản phẩm có mã thể loại khác với 2, 3, 4
SELECT *
FROM dbo.Products
WHERE CategoryID NOT IN (2, 3, 4)

-- Hãy liệt kê tất cả nhân viên không phải nữ
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy NOT IN ('Ms.', 'Mrs.')

-- Hãy liệt kê tất cả nhân viên nữ
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy IN ('Ms.', 'Mrs.')