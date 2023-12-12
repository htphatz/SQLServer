CREATE DATABASE NVDB
ON
(
	NAME = 'nvdb_data',
	FILENAME = 'C:\Users\Public\Database\nvdb_data.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB)
LOG ON
(
	NAME = 'nvdb_log',
	FILENAME = 'C:\Users\Public\Database\nvdb_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB)

