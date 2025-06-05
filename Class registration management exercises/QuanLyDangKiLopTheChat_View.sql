--Tạo view cho biết lớp tín chỉ có sĩ số lớn hơn 32
Go
CREATE VIEW lopthechat32
AS
SELECT * FROM tblLopTheChat
WHERE iSiSo>32;
SELECT * FROM lopthechat32;

--Tạo view cho biết thông tin của học sinh sinh năm 2003
Go
CREATE VIEW lopthechat2003
AS
SELECT * FROM tblSinhVien
WHERE YEAR(dNgaysinh)=2003;
SELECT * FROM lopthechat2003;

--Tạo view cho biết thông tin những lớp học buổi sáng
GO
CREATE VIEW lopbuoisang
AS
SELECT * FROM tblLopTheChat
WHERE sBuoi=N'Sáng';
SELECT * FROM lopbuoisang
--Tạo view cho biết giáo viên của những sinh viên 2003
GO
CREATE VIEW gv_sv2k3
AS
SELECT gv.sMaGV,gv.sTenGV
FROM tblSinhVien as sv,tblGiaoVien as gv,tblLopTheChat as l
WHERE YEAR(sv.dNgaysinh)=2003 
and    sv.sMaLopTheChat=l.sMaLopTheChat
and   l.sMaGV=gv.sMaGV
SELECT * FROM gv_sv2k3

--tạo view cho biết tên các học sinh có theo học giáo viên Trần Văn A ở một bộ môn nào đấy
create view SinhVienTheoHocTranVanALopTheChat
as
select sv.sTenSV as N'Họ và Tên'
from tblSinhVien as sv, tblLopTheChat as l, tblGiaoVien as gv
where sv.sMaLopTheChat = l.sMaLopTheChat
and l.sMaGV = gv.sMaGV
and gv.sTenGV = N'Trần Văn A'
select * from SinhVienTheoHocTranVanALopTheChat

select * from tblSinhVien
select * from tblLopTheChat
select * from tblGiaoVien
select * from tblMonHoc


