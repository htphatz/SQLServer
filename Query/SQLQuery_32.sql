--Finonacci F(n) = F(n-1) + F(n-2)
-- 0 1 1 2 3 5 8 13 21 ...

-- Bài toán Fibonacci
WITH fibo (pre_n, n) AS (
	-- Khởi tạo
	SELECT 0 AS pre_n,
		   1 AS n
	UNION ALL
	-- Đệ quy
	SELECT 
		   n AS pre_n,
		   pre_n + n AS n
	FROM fibo       
)
SELECT * FROM fibo
OPTION (MAXRECURSION 5);

-- Bài toán giai thừa
WITH giaiThua (stt, giaiThuaX) AS (
	-- Khởi tạo
	SELECT 1 AS stt,
		   1 AS giaiThuaX
	UNION ALL
	-- Đệ quy
	SELECT 
		   stt + 1 AS stt,
		   giaiThuaX * (stt + 1) AS giaiThuaX
	FROM giaiThua       
)
SELECT * FROM giaiThua
OPTION (MAXRECURSION 10);

-- Bài toán tạo cây cấu trúc quản lý của nhân viên trong bảng Employees
-- Trong đó "ReportsTo" là mã của người quản lý
USE NORTHWND;
WITH e_cte AS (
	-- Khởi tạo
	SELECT e.EmployeeID,
		   e.FirstName + ' ' + e.LastName as Name,
		   e.ReportsTo as ManagerID,
		   0 as Level
	FROM dbo.Employees e
	WHERE e.EmployeeID = 2

	UNION ALL
	-- Đệ quy
	SELECT e1.EmployeeID,
		   e1.FirstName + ' ' + e1.LastName as Name,
		   e1.ReportsTo as ManagerID,
		   Level + 1 as Level
	FROM dbo.Employees e1
	JOIN e_cte ON e1.ReportsTo = e_cte.EmployeeID
)
SELECT * FROM e_cte
OPTION (MAXRECURSION 10);

