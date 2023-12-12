USE NORTHWND

-- Liet ke tat ca nha cung cap theo thu tu CompanyName A->Z
SELECT *
FROM dbo.Suppliers
ORDER BY CompanyName ASC

-- Liet ke tat ca san pham theo thu tu gia giam dan
SELECT *
FROM dbo.Products
ORDER BY UnitPrice DESC

-- Liet ke tat ca nhan vien theo thu tu ho va ten dem A->Z khong dung ASC|DESC
SELECT *
FROM dbo.Employees
ORDER BY LastName, FirstName

-- Lay ra mot san pham co so luong ban cao nhat tu bang Order Details
SELECT TOP 1 *
FROM dbo.[Order Details]
ORDER BY Quantity DESC

-- Liet ke danh sach OderID trong bang Orders theo thu tu giam dan cua OrderDate
SELECT OrderID, OrderDate
FROM dbo.Orders
ORDER BY OrderDate DESC

-- Liet ke ten, don gia, so luong trong kho (UnitsInStock) cua tat ca san pham trong bang Products 
-- theo thu tu giam dan cua UnitsInStock
SELECT ProductName, UnitPrice, UnitsInStock
FROM dbo.Products
ORDER BY UnitsInStock DESC