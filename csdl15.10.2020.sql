CREATE DATABASE GV
USE GV


CREATE TABLE GiangVien(
MaGV char(4) NOT NULL,
HoTen nchar(30) NOT NULL,
DiaChi nvarchar(50) NOT NULL,
NgaySinh date NOT NULL,
CONSTRAINT KhoaChinhGiangVien PRIMARY KEY (MaGV)
)


CREATE TABLE DeTai(
MaDT char(4) NOT NULL,
TenDT nvarchar(50) NOT NULL,
Cap nchar(12) NOT NULL,
KinhPhi integer,
CONSTRAINT KhoaChinhDeTai PRIMARY KEY (MaDT)
)


CREATE TABLE ThamGia(
MaGV char(4) NOT NULL,
MaDT char(4) NOT NULL,
SoGio smallint,
CONSTRAINT KhoaChinhThamGia PRIMARY KEY (MaGV, MaDT),
CONSTRAINT KhoaNgoai1 FOREIGN KEY (MaGV) REFERENCES GiangVien (MaGV),
CONSTRAINT KhoaNgoai2 FOREIGN KEY (MaDT) REFERENCES DeTai (MaDT)
)


INSERT INTO GiangVien VALUES ('GV01',N'Vũ Tuyết Trinh',N'Hoàng Mai, Hà Nội','1975/10/10'),
('GV02',N'Nguyễn Nhật Quang',N'Hai Bà Trưng, Hà Nội','1976/11/03'),
('GV03',N'Trần Đức Khánh',N'Đống Đa, Hà Nội','1977/06/04'),
('GV04',N'Nguyễn Hồng Phương',N'Tây Hồ, Hà Nội','1983/12/10'),
('GV05',N'Lê Thanh Hương',N'Hai Bà Trưng, Hà Nội','1976/10/10')


INSERT INTO DeTai VALUES ('DT01',N'Tính toán lưới',N'Nhà nước','700'),
('DT02',N'Phát hiện tri thức',N'Bộ','300'),
('DT03',N'Phân loại văn bản',N'Bộ','270'),
('DT04',N'Dịch tự động Anh Việt',N'Trường','30')


INSERT INTO ThamGia VALUES ('GV01','DT01','100'),
('GV01','DT02','80'),
('GV01','DT03','80'),
('GV02','DT01','120'),
('GV02','DT03','140'),
('GV03','DT03','150'),
('GV04','DT04','180')

--1. Đưa ra thông tin GV có địa chỉ ở HBT:
SELECT * FROM GiangVien WHERE DiaChi LIKE N'%Hai Bà Trưng%' ORDER BY HoTen DESC



--2. Đưa ra thông tin GV có tham gia đề tài Tính toán lưới
SELECT HoTen, DiaChi, NgaySinh
FROM GiangVien, ThamGia, DeTai
WHERE GiangVien.MaGV = ThamGia.MaGV
AND ThamGia.MaDT = DeTai.MaDT
AND TenDT LIKE N'Tính toán lưới'



--3. Đưa ra thông tin GV có tham gia đề tài "Phân loại văn bản" hoặc "Dịch tự động Anh Việt"
SELECT HoTen, DiaChi, NgaySinh
FROM GiangVien INNER JOIN ThamGia ON
GiangVien.MaGV = ThamGia.MaGV INNER JOIN
DeTai ON ThamGia.MaDT = DeTai.MaDT
WHERE TenDT LIKE N'Phân loại văn bản'
OR TenDT LIKE N'Dịch tự động Anh Việt';



--4. Thông tin GV tham gia ít nhất 2 đề tài
SELECT * FROM GiangVien
WHERE MaGV IN(SELECT MaGV FROM ThamGia
			  GROUP BY MaGV HAVING COUNT(MaDT)>1);



--5. Tên GV tham gia nhiều đề tài nhất
SELECT * FROM GiangVien
WHERE MaGV IN(SELECT 



--6. Đề tài tốn ít kinh phí nhất
SELECT TOP 1 * FROM DeTai
ORDER BY KinhPhi ASC



--7. Tên GV sống ở Tây Hồ và các đề tài tham gia
SELECT gv."MaGV", gv."HoTen", gv."NgaySinh", dt."TenDT"
FROM "GiangVien" gv, "ThamGia" tg, "DeTai" dt
WHERE gv.MaGV = tg.MaGV AND tg.MaDT = dt.MaDT
AND gv."DiaChi" LIKE N'%Tây Hồ%'



--8. 

--1. Đưa ra thông tin GV có địa chỉ ở HBT:
--2. Đưa ra thông tin GV có tham gia đề tài Tính toán lưới
--3. Đưa ra thông tin GV có tham gia đề tài "Phân loại văn bản" hoặc "Dịch tự động Anh Việt"
--4. Thông tin GV tham gia ít nhất 2 đề tài
--5. Tên GV tham gia nhiều đề tài nhất
--6. Đề tài tốn ít kinh phí nhất
--7. Tên GV sống ở Tây Hồ và các đề tài tham gia
