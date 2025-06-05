
/*Bảng 1.Sinh Viên*/
insert into tblSinhVien
(sMaSV,sMaGVHanhChinh,sMaLopTheChat,sTenSV,bGioiTinh,sDiaChi,dNgaysinh,sEmail)
values('SV1','GV1','L1',N'Nguyễn Văn A','1',N'Thái Bình','9/10/2004','NVA@gmail.com'),
	('SV2','GV1','L1',N'Nguyễn Văn B','1',N'Hà Nội','10/10/2004','NVB@gmail.com'),
	('SV3','GV1','L1',N'Nguyễn Văn C','1',N'Hà Nam','11/10/2004','NVC@gmail.com'),
	('SV4','GV2','L2',N'Nguyễn Thị A','0',N'Bắc Ninh','12/10/2003','NTA@gmail.com'),
	('SV5','GV2','L2',N'Nguyễn Thanh A','1',N'Bắc Giang','9/9/2004','NTA1@gmail.com'),
	('SV6','GV2','L2',N'Nguyễn Văn D','1',N'Thái Bình','9/8/2004','NVD@gmail.com'),
	('SV7','GV3','L3',N'Nguyễn Văn E','1',N'Thái Bình','9/7/2004','NVE@gmail.com'),
	('SV8','GV3','L3',N'Nguyễn Thị C','0',N'Lào Cai','9/12/2004','NVC@gmail.com'),
	('SV9','GV3','L3',N'Nguyễn Văn F','1',N'Thái Bình','9/10/2003','NVF@gmail.com'),
	('SV10','GV3','L3',N'Nguyễn Hoàng A','1',N'Vĩnh Phúc','12/9/2004','NHA@gmail.com')

/*Bảng 2.Giáo Viên*/
insert into tblGiaoVien
(sMaGV,sTenGV,bGioiTinh,sDiaChi,dNgaysinh,sEmail)
values('GV1',N'Trần Văn A','1',N'Hà Nội','12/12/1980','TVA@gmail.com'),
	('GV2',N'Trần Văn B','1',N'Hà Nội','11/11/1977','TVB@gmail.com'),
	('GV3',N'Trần Thị C','0',N'Hà Nội','12/12/1983','TVC@gmail.com')
insert into tblGiaoVien
values('GV01', N'Trần Văn D','1', N'Nghệ An', '12/12/1989', 'TVD@gmail.com');

/*Bảng 3.Lớp thể chất*/
insert into tblLopTheChat
(sMaLopTheChat,sMaMonHoc,sMaGV,sMaPhongHoc,iSiSo,dNgayhoc,sBuoi)
	values('L1','M1','GV1','35','12/12/2023',N'Sáng','P1'),
	('L2','M2','GV2','33','10/12/2023',N'Chiều','P2'),
	('L3','M3','GV3','31','11/12/2023',N'Sáng','P3')
	Select * FROM tblLopTheChat
/*Bảng 4.Phòng Học*/
insert into tblPhongHoc
(sMaPhongHoc,iSucChua)
values('P1','40'),
	('P2','40'),
	('P3','40')

/*Bảng 5.Môn học*/
insert into tblMonHoc
(sMaMonHoc,sTenMonHoc)
	values('M1','Bóng chuyền'),
	('M2',N'Bóng rổ'),
	('M3',N'Võ')

--Truy vấn dữ liệu
--Lấy thông tin của những học sinh nam
SELECT * FROM tblSinhVien
WHERE tblSinhVien.bGioiTinh='1'

--Lấy thông tin của lớp võ và những học sinh học võ
SELECT * FROM tblSinhVien,tblLopTheChat,tblMonHoc
WHERE tblSinhVien.sMaLopTheChat=tblLopTheChat.sMaLopTheChat
AND tblLopTheChat.sMaMonHoc=tblMonHoc.sMaMonHoc
AND tblMonHoc.sTenMonHoc='Võ'