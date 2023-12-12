USE NORTHWND

-- Tạo stored procedure lấy thông tin sản phẩm dựa trên tên sản phẩm được cung cấp
GO
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT ProductID, ProductName, UnitPrice, UnitsInStock
	FROM dbo.Products
	WHERE ProductName = @ProductName
END
GO

-- Sử dụng stored procedure GetProductByName:
EXEC GetProductByName @ProductName = 'Chai'

-- Tạo stored procedure để tính tổng doanh số bán hàng của một nhân viên dựa trên Employee ID
GO
CREATE PROCEDURE GetEmployeeSaleTotal
	@EmployeeID INT
AS
BEGIN
	SELECT o.EmployeeID,
		   SUM (od.UnitPrice * od.Quantity) AS 'TotalSales'
	FROM dbo.Orders o
	JOIN dbo.[Order Details] od
	ON o.OrderID = od.OrderID
	WHERE o.EmployeeID = @EmployeeID
	GROUP BY o.EmployeeID
END
GO

-- Sử dụng stored procedure GetEmployeeSaleTotal:
EXEC GetEmployeeSaleTotal 1

-- Tạo stored procedure để thêm khách hàng mới vào bảng Customers
GO
CREATE PROCEDURE CreateNewCustomer
	@CustomerID NCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30)
AS
BEGIN
	INSERT INTO dbo.Customers([CustomerID], [CompanyName], [ContactName])
	VALUES (@CustomerID, @CompanyName, @ContactName)
END
GO

-- Sử dụng stored procedure CreateNewCustomer:
EXEC CreateNewCustomer @CustomerID = 'ABCXYZ', @CompanyName = 'KMA', @ContactName = 'Mitsuha'

-- Tạo stored procedure để tăng giá của tất cả sản phẩm có ProductID cụ thể
GO
CREATE PROCEDURE IncreasePrice
	@ProductID INT,
	@PriceIncrease DECIMAL(10, 2)
AS
BEGIN
	UPDATE dbo.Products
	SET UnitPrice = UnitPrice + @PriceIncrease
	WHERE ProductID = @ProductID
END
GO

-- Sử dụng stored procedure IncreasePrice:
EXEC IncreasePrice @ProductID = 2, @PriceIncrease = 100

----------------------------------------------BÀI TẬP----------------------------------------------
-- Bài 1: Tạo stored procedure để truy xuất danh sách các đơn đặt hàng cho một khách hàng dựa trên tên khách hàng
GO
CREATE PROCEDURE OrdersByContactName
	@ContactName NVARCHAR(30)
AS
BEGIN
	SELECT o.OrderID, o.OrderDate
	FROM dbo.Orders o
	JOIN dbo.Customers c
	ON o.CustomerID = c.CustomerID
	WHERE c.ContactName = @ContactName
END
GO
EXEC OrdersByContactName 'Sven Ottlieb'

-- Bài 2: Tạo stored procedure để cập nhật số lượng hàng tồn kho cho một sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới
GO
CREATE PROCEDURE UpdateUnitsInStock
	@ProductID INT,
	@NewUnitsInStock SMALLINT
AS
BEGIN
	UPDATE dbo.Products
	SET UnitsInStock = @NewUnitsInStock
	WHERE ProductID = @ProductID
END
GO

EXEC UpdateUnitsInStock @ProductID = 1, @NewUnitsInstock = 200

-- Bài 3: Tạo stored procedure để truy xuất danh sách các sản phẩm thuộc một danh mục cụ thể và "giới hạn về số lượng sản phẩm trả về"?
GO
CREATE PROCEDURE ListProductsByCategoryID
	@CategoryID INT,
	@MaxUnitsInStock SMALLINT
AS
BEGIN
	SELECT c.CategoryName, p.ProductID, p.ProductName, p.UnitsInStock
	FROM dbo.Categories c
	JOIN dbo.Products p
	ON c.CategoryID = p.CategoryID
	WHERE c.CategoryID = @CategoryID AND p.UnitsInStock <= @MaxUnitsInStock
END
GO

EXEC ListProductsByCategoryID @CategoryID = 5, @MaxUnitsInStock   = 100