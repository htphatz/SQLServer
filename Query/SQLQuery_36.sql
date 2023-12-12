USE NVDB

-- Tạo bảng nhân viên
CREATE TABLE NhanVien (
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(50),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);

-- Tạo bảng khách hàng
CREATE TABLE KhachHang (
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	-- Check số điện thoại phải đủ 10 ký tự và mỗi ký tự phải là số từ 0 đến 9
	SDT VARCHAR(10) CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- Thêm cột Email vào bảng NhanVien
ALTER TABLE NhanVien
ADD Email VARCHAR(50);

-- Thêm CONSTRAINT check NgaySinh trong CSDL hợp lý
ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh <= GETDATE())

-- Xóa dữ liệu trong bảng NhanVien
TRUNCATE TABLE NhanVien

-- Xóa hoàn toàn bảng NhanVien
DROP TABLE NhanVien


