USE NORTHWND

-- Tim gia thap nhat cua cac san pham trong bang Products
SELECT MIN(UnitPrice) AS "MinPrice"
FROM dbo.Products

-- Tim san pham (lay ten va ma san pham) co so luong trong kho (UnitsInStock) lon nhat
SELECT MAX(UnitsInStock) AS "MaxUnitsInStock"
FROM dbo.Products
GROUP BY ProductName, ProductID

-- Cho biet tuoi doi lon nhat cua nhan vien trong cong ti
SELECT MIN(BirthDate) AS "OldEmployee"
FROM dbo.Employees

-- Tim san pham co so luong lon nhat
SELECT MAX(QuantityPerUnit) AS "MaxQuantity"
FROM dbo.Products