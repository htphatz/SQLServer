USE NORTHWND

-- Lay "CompanyName" doi ten thanh "TenCongTy" va "PostalCode" doi ten thanh "MaBuuDien" trong bang khach hang
SELECT CompanyName AS "TenCongTy",
       PostalCode AS "MaBuuDien",
	   City "ThanhPho"
FROM dbo.Customers

-- Lay "LastName" doi ten thanh "Ho" va "FirstName" doi ten thanh "Ten" trong bang nhan vien
SELECT LastName AS "Ho",
	   FirstName AS "Ten"
FROM dbo.Employees

-- Viet cau lenh lay ra cot va thay the:
-- ProductName -> TenSanPham; SupplierID -> MaNhaCungCap; CategoryId -> MaTheLoai 
-- va dat ten thay the cho bang Products thanh "p", su dung cac ten thay the khi truy van cac cot tren kia
-- va chi lay 5 dong dau tien cua bang "p"
SELECT TOP 5 "p".
		ProductName AS "TenSanPham",
		SupplierID AS "TenNhaCungCap",
		CategoryID AS "MaTheLoai"
FROM dbo.Products AS "p"

-- Đặt tên cho bảng Suppliers là "Sup", và 10% khác nhau các dòng đầu tiên 
-- SupplierID là "Mã ID"
-- Address là "Địa chỉ"
-- Phone là "Số ĐT"
SELECT DISTINCT TOP 10 PERCENT "Sup".
	SupplierID AS "MaID", 
	Address AS "DiaChi",
	Phone "SoDT"
FROM dbo.Suppliers AS "Sup"