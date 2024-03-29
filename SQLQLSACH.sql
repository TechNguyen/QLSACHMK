﻿
CREATE DATABASE QLSACH
GO
USE QLSACH
GO
CREATE TABLE SACHS 
(
	MASACH VARCHAR(32) NOT NULL,
	TENSACH NVARCHAR(256) NOT NULL,
	TENTACGIA NVARCHAR(256) NULL,
	NHAXB NVARCHAR(256) NULL,
	CHUDE NVARCHAR(256) NULL,
	SOLUONG INT NOT NULL,
	DONGIA INT NOT NULL,
	NAMXB INT NULL,
	GHICHU NVARCHAR(256) NULL,
	PRIMARY KEY(MASACH),
)
GO
CREATE TABLE KHACHHANGS
(
	MAKH VARCHAR(32) NOT NULL,
	TENKH NVARCHAR(256) NOT NULL,
	DIACHI NVARCHAR(256) NULL,
	SDT VARCHAR(16) NULL,
	PRIMARY KEY(MAKH),
)

GO
CREATE TABLE NHANVIENS
(
	MANV VARCHAR(32) NOT NULL,
	TENNV NVARCHAR(256) NOT NULL,
	MATKHAU NVARCHAR(256) NOT NULL,
	SDT VARCHAR(16) NULL
	PRIMARY KEY(MANV),
)
GO
CREATE TABLE HOADONS
(
	MAHD VARCHAR(32),
	MANV VARCHAR(32) foreign key references NHANVIENS(MANV),
	MAKH VARCHAR(32) foreign key references KHACHHANGS(MAKH),
	NGAYXUAT DATETIME,
	TINHTRANG NVARCHAR(128),
	TONGTIEN DECIMAL
	PRIMARY KEY(MAHD),
)
GO
CREATE TABLE CHITIETHOADONS
(
	MAHD VARCHAR(32),
	MASACH VARCHAR(32) foreign key references SACHS(MASACH),
	SOLUONG DECIMAL,
	DONGIA DECIMAL,
	PRIMARY KEY(MAHD,MASACH),
)

GO
CREATE TABLE DanhGias
(
	MADANHGIA VARCHAR(32),
	MASACH VARCHAR(32) foreign key references SACHS(MASACH),
	MAKH VARCHAR(32) foreign key references KHACHHANGS(MAKH),
	dohailong int,
	mota nvarchar(max),
	ngaydanhgia datetime,
	PRIMARY KEY(MADANHGIA),
)


INSERT INTO NHANVIENS (MANV,TENNV,MATKHAU,SDT)VALUES(N'ADMIN',N'Quản Trị Viên',N'123',N'0124512546')
INSERT INTO NHANVIENS (MANV,TENNV,MATKHAU,SDT)VALUES(N'HOVANHAI',N'Hồ Văn Hải',N'123',N'0124512547')
INSERT INTO NHANVIENS (MANV,TENNV,MATKHAU,SDT)VALUES(N'LAMCHANHUNG',N'Lâm Chấn Hùng',N'123',N'0145125412')

INSERT INTO SACHS (MASACH,TENSACH,TENTACGIA,NHAXB,CHUDE,SOLUONG,DONGIA,NAMXB,GHICHU)VALUES(N'SACH001',N'Dế Mèn',N'Tô Hoài',N'Kim Đồng',N'Thiếu Nhi',4000,15000,2010,N'Mới nhập')
INSERT INTO SACHS (MASACH,TENSACH,TENTACGIA,NHAXB,CHUDE,SOLUONG,DONGIA,NAMXB,GHICHU)VALUES(N'SACH002',N'Truyện Tranh',N'Nhật Bản',N'NXB Nhật',N'Viễn tưởng',15,75000,2001,N'')
INSERT INTO SACHS (MASACH,TENSACH,TENTACGIA,NHAXB,CHUDE,SOLUONG,DONGIA,NAMXB,GHICHU)VALUES(N'SACH003',N'Sử học',N'Triết gia',N'Miền Trung',N'Lịch sử',7,56000,2002,N'')

INSERT INTO KHACHHANGS (MAKH,TENKH,DIACHI,SDT)VALUES(N'NGOCTRINH',N'Ngọc Trinh',N'TPHCM',N'0145214521')
INSERT INTO KHACHHANGS (MAKH,TENKH,DIACHI,SDT)VALUES(N'NGUYENVUMANH',N'Nguyễn Vũ Mạnh',N'Đà Nẵng',N'021521452')
INSERT INTO KHACHHANGS (MAKH,TENKH,DIACHI,SDT)VALUES(N'TRANQUANGNAM',N'Trần Quang Nam',N'Quảng Bình',N'0124512541')

INSERT INTO HOADONS (MAHD,MANV,MAKH,NGAYXUAT,TINHTRANG,TONGTIEN)VALUES(N'PBH2305270242418',N'ADMIN',N'NGOCTRINH','May 27 2023 12:00:00:000AM',N'Đã thanh toán',90000)
INSERT INTO HOADONS (MAHD,MANV,MAKH,NGAYXUAT,TINHTRANG,TONGTIEN)VALUES(N'PBH2305270349087',N'LAMCHANHUNG',N'TRANQUANGNAM','May 17 2023 12:00:00:000AM',N'Đã thanh toán',636000)

INSERT INTO CHITIETHOADONS (MAHD,MASACH,SOLUONG,DONGIA)VALUES(N'PBH2305270242418',N'SACH001',1,15000)
INSERT INTO CHITIETHOADONS (MAHD,MASACH,SOLUONG,DONGIA)VALUES(N'PBH2305270242418',N'SACH002',1,75000)
INSERT INTO CHITIETHOADONS (MAHD,MASACH,SOLUONG,DONGIA)VALUES(N'PBH2305270349087',N'SACH002',4,75000)
INSERT INTO CHITIETHOADONS (MAHD,MASACH,SOLUONG,DONGIA)VALUES(N'PBH2305270349087',N'SACH003',6,56000)



INSERT INTO DanhGias(MADANHGIA,MAKH,MASACH,dohailong,ngaydanhgia,mota)VALUES(N'DANHGIA01',N'NGOCTRINH',N'SACH002',3,CURRENT_TIMESTAMP,N'Sách hay nhé!')
,('DANHGIA02',N'NGUYENVUMANH',N'SACH003',2,CURRENT_TIMESTAMP,N'Khá ok!')
,('DANHGIA03',N'TRANQUANGNAM',N'SACH001',1,CURRENT_TIMESTAMP,N'Bình thường')
,('DANHGIA04',N'NGOCTRINH',N'SACH001',3,CURRENT_TIMESTAMP,N'Đáng đọc')
,('DANHGIA05',N'NGUYENVUMANH',N'SACH002',5,CURRENT_TIMESTAMP,N'hay')
