USE NORTHWND

-- Hãy lọc ra tất cả khách hàng có tên liên hệ bắt đầu bằng chữ 'A'
SELECT *
FROM dbo.Customers
WHERE ContactName LIKE 'A%'

-- Hãy lọc ra tất cả khách hàng có tên liên hệ bắt đầu bằng chữ 'H' và có chữ thứ 2 là bất kì kí tự nào
SELECT *
FROM dbo.Customers
WHERE ContactName LIKE 'H_%'

-- Hãy lọc ra các đơn hàng gửi đến các thành phố bắt đầu bằng chữ 'L', chữ cái thứ 2 là u hoặc o
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE 'L[o,u]%'

-- Hãy lọc ra các đơn hàng gửi đến các thành phố bắt đầu bằng chữ 'L', chữ cái thứ 2 không là u hoặc o
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE 'L[^o,u]%'

-- Hãy lọc ra các đơn hàng gửi đến các thành phố bắt đầu bằng chữ 'L', chữ cái thứ 2 là các kí tự từ a đến e
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE 'L[a-e]%'