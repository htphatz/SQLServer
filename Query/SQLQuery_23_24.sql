USE NORTHWND

-- Từ bảng Products và Categories in ra: Mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm.
SELECT p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
FROM dbo.Products AS p, dbo.Categories AS c
WHERE p.CategoryID = c.CategoryID

-- Từ bảng Employees và Orders in ra: Mã nhân viên, tên nhân viên, số lượng đơn hàng nhân viên bán được
SELECT o.EmployeeID, e.LastName, e.FirstName,
	   COUNT(o.OrderID) AS 'TotalOrders'
FROM dbo.Orders AS o, Employees AS e
WHERE o.EmployeeID = e.EmployeeID
GROUP BY o.EmployeeID, e.LastName, e.FirstName

-- Từ bảng Employees và Orders in ra: Mã số khách hàng, tên công ty, tên liên hệ, số lượng đơn hàng đã mua.
-- Điều kiện: quốc gia của khách hàng là UK
SELECT o.CustomerID, c.CompanyName, c.ContactName, c.Country,
	   COUNT(OrderID) AS 'TotalOrders'
FROM dbo.Orders AS o, dbo.Customers AS c
WHERE c.Country = 'UK' AND  o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.CompanyName, c.ContactName, c.Country

-- Từ bảng Orders và Shippers in ra: Mã nhà vận chuyển, tên công ty vận chuyển, tổng số tiền được vận chuyển theo thứ tự tổng tiền giảm dần
SELECT s.ShipperID, s.CompanyName, 
	   SUM(o.Freight) AS 'SumFreight'
FROM dbo.Shippers AS s, dbo.Orders AS o
WHERE s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC

-- Từ bảng Products và Supplies in ra: Mã nhà cung cấp, tên công ty, tổng các sản phẩm khác nhau đã cung cấp
-- và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất
SELECT TOP 1 s.SupplierID, s.CompanyName, 
	   COUNT(p.ProductID) AS 'QuantityProducts'
FROM dbo.Products AS p, dbo.Suppliers AS s
WHERE p.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY COUNT(p.ProductID) DESC

-- Từ bảng Orders và Order details in ra: Mã đơn hàng, tổng tiền sản phẩm của đơn hàng đó
SELECT o.OrderID,
	   SUM(od.UnitPrice * od.Quantity) AS 'TotalPrice'
FROM dbo.Orders AS o, dbo.[Order Details] AS od
WHERE od.OrderID = o.OrderID
GROUP BY o.OrderID

-- Từ 3 bảng Order details, Orders và Employees in ra: Mã đơn hàng, tên nhân viên, tổng số tiền sản phẩm của đơn hàng
SELECT o.OrderID, e.LastName, e.FirstName,
       SUM(od.UnitPrice * od.Quantity) AS 'TotalPrice'
FROM dbo.Orders AS o, dbo.[Order Details] AS od, dbo.Employees AS e
WHERE od.OrderID = o.OrderID AND o.EmployeeID = e.EmployeeID
GROUP BY o.OrderID, e.LastName, e.FirstName

-- Từ 3 bảng Cusstomers, Orders và Shippers in ra: Mã đơn hàng, tên khách hàng, tên công ty vận chuyển
-- Note: chỉ in ra các đơn hàng được giao tới 'UK' trong năm 1997
SELECT o.OrderID, c.ContactName, s.CompanyName, o.ShipCountry, YEAR(o.ShippedDate) as 'Year'
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE c.CustomerID = o.CustomerID
	  AND s.ShipperID = o.ShipVia
	  AND o.ShipCountry = 'UK'
	  AND YEAR(o.ShippedDate) = 1997

-- Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' in ra: Mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products p, dbo.Categories c
WHERE c.CategoryID = p.CategoryID AND c.CategoryName = 'Seafood'

-- Từ bảng Products và Suppliers, hãy tìm các sản phẩm thuộc được cung cấp từ nước 'Germany' in ra: Mã nhà cung cấp, quốc gia, mã sản phẩm, tên sản phẩm
SELECT s.SupplierID, s.Country, p.ProductID, p.ProductName
FROM dbo.Products p, dbo.Suppliers s
WHERE s.SupplierID = p.SupplierID AND s.Country = 'Germany'

-- Từ 3 bảng Customers, Orders và Shippers in ra: Mã đơn hàng, tên khách hàng, tên công ty vận chuyển 
-- và chỉ in ra đơn hàng của khách đến từ thành phố 'London'
SELECT o.OrderID, c.ContactName, s.CompanyName, c.City
FROM  dbo.Customers c, dbo.Orders o, dbo.Shippers s
WHERE c.CustomerID = o.CustomerID
	  AND s.ShipperID = o.ShipVia
	  AND c.City = 'London'

-- Từ 3 bảng Customers, Orders và Shippers in ra: Mã đơn hàng, tên khách hàng, tên công ty vận chuyển, ngày yêu cầu giao hàng, ngày giao hàng
-- và chỉ in ra các đơn hàng bị giao muộn (RequiredDate > ShippedDate)
SELECT o.OrderID, c.ContactName, s.CompanyName, o.RequiredDate, o.ShippedDate
FROM  dbo.Customers c, dbo.Orders o, dbo.Shippers s
WHERE c.CustomerID = o.CustomerID
	  AND s.ShipperID = o.ShipVia
	  AND o.RequiredDate > o.ShippedDate

-- Từ 3 bảng Customers, Orders và Shippers hãy chỉ những nước có hơn 100 đơn hàng và in ra: Country và số lượng đơn hàng
-- Note: chỉ lấy những khách hàng không đến từ nước 'US'
SELECT o.ShipCountry,
	   COUNT(o.OrderID) AS 'TotalOrders'
FROM  dbo.Customers c, dbo.Orders o, dbo.Shippers s
WHERE c.CustomerID = o.CustomerID
	  AND s.ShipperID = o.ShipVia
	  AND c.Country <> 'USA'
GROUP BY o.ShipCountry, c.Country
HAVING COUNT(o.OrderID) > 100