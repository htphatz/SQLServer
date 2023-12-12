USE AdventureWorks2022

SELECT COUNT(SalesOrderID)
FROM [Sales].[SalesOrderDetail]

-- Bật hiển thị thông báo về tài nguyên IO
SET STATISTICS IO ON

-- Truy vấn
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber] = '1B2B-492F-A9'

-- Tắt hiển thị thông báo về tài nguyên IO
SET STATISTICS IO OFF

-- Trước khi đặt index thì logical reads 1238

-- Đặt index cho [CarrierTrackingNumber] trong bảng [Sales].[SalesOrderDetail]
CREATE INDEX idx_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber])

-- Bật hiển thị thông báo về tài nguyên IO
SET STATISTICS IO ON

-- Truy vấn
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber] = '1B2B-492F-A9'

-- Tắt hiển thị thông báo về tài nguyên IO
SET STATISTICS IO OFF

-- Sau khi đặt index thì logical reads 69


------------BÀI TẬP THỰC HÀNH------------
-- Tạo index trên bảng Person.Address, cột AddressLine1 và đánh giá hiệu suất truy vấn
SELECT *
FROM [Person].[Address]

-- Bật hiển thị thông báo về tài nguyên IO
SET STATISTICS IO ON

-- Truy vấn
SELECT *
FROM [Person].[Address]
WHERE AddressLine1 = '5672 Hale Dr.'

-- Tắt hiển thị thông báo về tài nguyên IO
SET STATISTICS IO OFF

-- Trước khi đặt index thì logical reads 5

-- Đặt index cho [AddressLine1] trong bảng [Sales].[SalesOrderDetail]
CREATE INDEX idx_AddressLine1
ON [Person].[Address] ([AddressLine1])

-- Bật hiển thị thông báo về tài nguyên IO
SET STATISTICS IO ON

-- Truy vấn
SELECT *
FROM [Person].[Address]
WHERE AddressLine1 = '5672 Hale Dr.'

-- Tắt hiển thị thông báo về tài nguyên IO
SET STATISTICS IO OFF

-- Sau khi đặt index thì logical reads 5	