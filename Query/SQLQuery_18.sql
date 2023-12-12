USE NORTHWND

-- Lấy ra đơn hàng chưa được giao (ShippedDate -> NULL)
SELECT *
FROM dbo.Orders
WHERE ShippedDate IS NULL 

-- Lấy ra danh sách khách hàng có khu vực (Region) không bị NULL
SELECT *
FROM dbo.Customers
WHERE Region IS NOT NULL

-- Lấy danh sách khách hàng không có tên công ty
SELECT *
FROM dbo.Customers
WHERE CompanyName IS NULL

-- Hãy liệt kê đơn hàng chưa được giao và có khu vực giao hàng (ShipRegion) không bị NULL
SELECT *
FROM dbo.Orders
WHERE ShippedDate IS NULL  AND ShipRegion IS NOT NULL