USE NORTHWND

-- Lay ra tat ca nhan vien o Thanh pho London va sap xep theo thu tu LastName
SELECT *
FROM dbo.Employees
WHERE (City = 'London')
ORDER BY LastName

-- Liệt kê tất cả những đơn hàng giao muộn, biết rằng ngày phải giao là
-- RequiredDay và ngày giao thực tế là ShippedDay
SELECT *
FROM dbo.Orders as "LateOrders"
WHERE (RequiredDate < ShippedDate)

-- Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
SELECT *, UnitPrice * 0.9 AS "UnitPriceAfterDiscount"
FROM dbo.[Order Details]
WHERE (Discount > 0.1)

-- Liệt kê tất cả những đơn hàng được gửi đến quốc gia 'France'
SELECT *
FROM dbo.Orders
WHERE (ShipCountry = 'France')
ORDER BY Freight