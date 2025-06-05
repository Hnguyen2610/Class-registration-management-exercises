-- Tạo database 
CREATE DATABASE QuanLyDangKyLopTheChat;
USE QuanLyDangKyLopTheChat;
GO

-- Tạo bảng Môn Học
CREATE TABLE tblMonHoc(
	sMaMonHoc NVARCHAR(10) PRIMARY KEY,
	sTenMonHoc NVARCHAR(30)
);

-- Tạo bảng Lớp Thể Chất
CREATE TABLE tblLopTheChat(
	sMaLopTheChat NVARCHAR(15) PRIMARY KEY ,
	sMaMonHoc NVARCHAR(10) ,
	sMaGV NVARCHAR(15),
	sMaPhongHoc NVARCHAR(10),
	iSiSo INT CHECK ( 0 < iSiSo AND iSiSo < 100 ) ,
	dNgayhoc DATETIME,
	sBuoi NVARCHAR(10)
);
-- Tạo bảng Giáo Viên
CREATE TABLE tblGiaoVien(
	sMaGV NVARCHAR(15) PRIMARY KEY ,
	sTenGV NVARCHAR(30) ,
	bGioiTinh BIT ,
	sDiaChi NVARCHAR(50) ,
	dNgaysinh DATETIME CHECK (YEAR(GETDATE()) - YEAR(dNgaysinh) > 18 ),
	sEmail NVARCHAR(30)
);

-- Tạo bảng Sinh Viên
create TABLE tblSinhVien(
	sMaSV NVARCHAR(15) PRIMARY KEY ,
	sMaGVHanhChinh NVARCHAR(15) ,
	sMaLopTheChat NVARCHAR(15),
	sTenSV NVARCHAR(30) ,
	bGioiTinh BIT ,
	sDiaChi NVARCHAR(50) ,
	dNgaysinh DATETIME CHECK (YEAR(GETDATE()) - YEAR(dNgaysinh) > 18 ) ,
	sEmail NVARCHAR(30)
);

-- Tạo bảng Phòng Học
CREATE TABLE tblPhongHoc(
	sMaPhongHoc NVARCHAR(10) PRIMARY KEY ,
	iSucChua INT CHECK ( 0 < iSucChua AND iSucChua < 100 )
);

-- Thêm khóa ngoại cho bảng Sinh Viên
ALTER TABLE tblSinhVien ADD CONSTRAINT Fk_lopthechat_sinhvien FOREIGN KEY(sMaLopTheChat) References tblLopTheChat(sMaLopTheChat),
CONSTRAINT Fk_giaovien_sinhvien FOREIGN KEY(sMaGVHanhChinh) References tblGiaoVien(sMaGV);


-- Thêm khóa ngoại cho bảng Lớp Tín Chỉ
ALTER TABLE tblLopTheChat ADD CONSTRAINT Fk_monhoc_lopthechat FOREIGN KEY(sMaMonHoc)     References tblMonHoc(sMaMonHoc),
CONSTRAINT Fk_giaovien_lopthechat FOREIGN KEY(sMaGV) References tblGiaoVien(sMaGV);

ALTER TABLE tblLopTheChat ADD CONSTRAINT Fk_phonghoc_lopthechat FOREIGN KEY(sMaPhongHoc) References tblPhongHoc(sMaPhongHoc);
