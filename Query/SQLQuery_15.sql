USE NORTHWND

-- Hãy lọc ra tất cả khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
SELECT *
FROM dbo.Customers
WHERE Country LIKE 'A%'

-- Lấy danh sách các đơn đặt được gửi đến thành phố có chứa chữ 'a'
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE '%a%'

-- Hãy lọc tất cả các đơn hàng có điều kiện ShipCountry LIKE 'U_' và ShipCountry LIKE 'U%'
SELECT *
FROM dbo.Orders
WHERE ShipCountry LIKE 'U_' AND ShipCountry LIKE 'U%'

-- Lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
SELECT *
FROM dbo.Suppliers
WHERE CompanyName LIKE '%b%'
