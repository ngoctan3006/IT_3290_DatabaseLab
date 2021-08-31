CREATE DATABASE CONTEST;

CREATE TABLE SinhVien (
	MSSV int,
	HoTen varchar(40) NOT NULL,
	GioiTinh int NOT NULL,
	QueQuan varchar(40) NOT NULL,
	CPA float NOT NULL,
	PRIMARY KEY MSSV
);

CREATE TABLE MonHoc (
	MaMon int NOT NULL,
	TenMon varchar(30) NOT NULL,
)