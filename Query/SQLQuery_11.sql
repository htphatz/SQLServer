USE NORTHWND

-- Tinh so luong san pham con lai trong kho (UnitsInStock) sau khi ban het san pham da duoc dat hang (UnitsOnOrder)
-- StockRemaining = UnitsInStock - UnitsOnOrder
SELECT ProductID,
	   ProductName,
	   UnitsInStock,
	   UnitsOnOrder,
	   (UnitsInStock - UnitsOnOrder) AS "StockRemaining"
FROM dbo.Products
ORDER BY (UnitsInStock - UnitsOnOrder) DESC

-- Tinh gia tri don hang chi tiet cho tat ca cac san pham trong bang Order Details
-- OrderDetailValue = UnitPrice * Quantity
SELECT OrderID,
	   ProductID,
	   UnitPrice,
       Quantity,
	   (UnitPrice * Quantity) AS "OrderDetailValue"
FROM dbo.[Order Details]

-- Tinh ty le gia van chuyen don dat hang (Freight) trung binh cua cac don hang trong bang Orders so voi
-- gia tri van chuyen cua don hang lon nhat (MaxFreight)
-- FreightAtio = AVG(Freight) / MAX(Freight)
SELECT (AVG(Freight) / MAX(Freight)) AS "FreightAtio"
FROM dbo.Orders

-- Liet ke danh sach cac san pham va gia (UnitPrice) cua tung san pham se duoc giam gia 10%
SELECT *,
	   (UnitPrice * 0.9) AS "UnitPriceAfterDiscount10%"
FROM dbo.Products
ORDER BY (UnitPrice * 0.9) DESC
