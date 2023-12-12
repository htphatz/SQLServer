USE NORTHWND

-- Lay ra so luong khach hang trong bang Customers
SELECT COUNT(*) AS "NumberOfCustomers"
FROM dbo.Customers

-- Tinh tong so tien van chuyen (Freight) cua tat ca don dat hang (Orders)
SELECT SUM(Freight) AS "SumFreight"
FROM dbo.Orders

-- Tinh trung binh so luong dat hang (Quantity) cua tat ca san pham trong bang Order Details
SELECT AVG(Quantity) AS "AvgQuantity"
FROM dbo.[Order Details]

-- Dem so luong, tinh tong so luong hang trong va trung binh gia cac san pham trong bang Products
SELECT COUNT(*) "NumberOfProducts",
	   SUM(UnitsInStock) "TotalUnitsInStock",
	   AVG(UnitPrice) "AvgUnitPrice"
FROM dbo.Products

-- Dem so luong don hang bang cach dung OrderID va * trong bang Orders va xem xet ket qua
SELECT COUNT(OrderID) AS "QuantityOrder"
FROM dbo.Orders

SELECT COUNT(*)
FROM dbo.Orders

--	Tu bang Order Details tinh trung binh cho UnitPrice va tinh tong cho Quantity
SELECT AVG(UnitPrice) AS "AvgUnitPrice",
	   SUM(Quantity) AS "TotalQuantity"
FROM dbo.[Order Details]