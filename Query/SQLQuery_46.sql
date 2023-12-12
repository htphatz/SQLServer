USE NORTHWND

-- Tạo trigger khi insert sẽ chuyển ProductName về viết hoa hoàn toàn
GO
CREATE TRIGGER MakeProductNameUppercase
ON dbo.Products
AFTER INSERT
AS
BEGIN
	UPDATE dbo.Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i
	WHERE Products.ProductID = i.ProductID
END
GO
-- Test trigger MakeProductNameUppercase
INSERT dbo.Products ([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- Tạo trigger để đảm bảo mỗi khi có chi tiết đơn hàng mới được thêm vào thì số lượng hàng tồn kho phải giảm đi
GO
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	UPDATE dbo.Products 
	SET UnitsInStock = UnitsInStock - (SELECT [Quantity] 
									   FROM inserted 
									   WHERE [dbo].[Products].ProductID = inserted.ProductID)
	WHERE [dbo].[Products].ProductID IN (SELECT [ProductID]
									     FROM inserted)
END
GO
-- Test trigger UpdateProductInventory
INSERT INTO [dbo].[Order Details] 
VALUES (10248, 76, 18, 50, 0)

--------------------------------------------BÀI TẬP--------------------------------------------
-- Bài 1: Bổ sung thêm cột LastModified và tạo trigger để sau khi một sản phẩm được thêm hoặc cập nhật giá vào bảng Products 
-- tự động cập nhật trường LastModified với ngày và giờ hiện tại

-- Cách lấy thời gian hiện tại
SELECT GETDATE()

ALTER TABLE [dbo].[Products]
ADD LastModified DATETIME

GO
CREATE TRIGGER UpdateDateTimeProduct
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	IF UPDATE([UnitPrice])
	BEGIN
		UPDATE [dbo].[Products]
		SET LastModified = GETDATE()
		FROM inserted
		WHERE [dbo].[Products].ProductID = inserted.ProductID
	END
END
GO

INSERT INTO [dbo].[Products] ([ProductName], [SupplierID], [CategoryID], [UnitPrice])
VALUES ('test trigger', 2, 2, 200)

UPDATE dbo.Products
SET UnitPrice = 1000
WHERE ProductID = 79


-- Bài 2: Tạo trigger để kiểm tra và không cho phép đặt hàng với số lượng sản phẩm đặt lớn hơn số lượng tồn kho
GO
CREATE TRIGGER CheckInvetory
ON [dbo].[Order Details]
FOR INSERT
AS
BEGIN
	IF (SELECT [Quantity] FROM inserted WHERE [dbo].[Products].ProductID = inserted.ProductID) > (SELECT [UnitsInStock] FROM [dbo].[Products])
	BEGIN
		ROLLBACK;
		RAISERROR ('Số lượng sản phẩm vượt quá số lượng tồn kho. Đặt hàng không thành công', -- Message text.
		16, -- Severity
		1 -- State
		);
	END
END
GO