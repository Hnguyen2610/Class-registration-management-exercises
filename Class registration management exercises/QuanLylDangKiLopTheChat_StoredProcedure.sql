--cho biết tên giáo viên và phòng học đang dạy dựa theo mã giáo viên
CREATE PROC prTenGV (@magiaovien nvarchar(15))
AS 
BEGIN
SELECT sTenGV,tblLopTheChat.sMaPhongHoc
FROM tblGiaoVien,tblLopTheChat,tblPhongHoc
WHERE tblGiaoVien.sMaGV=tblLopTheChat.sMaGV
AND tblLopTheChat.sMaPhongHoc=tblPhongHoc.sMaPhongHoc
AND @magiaovien=tblGiaoVien.sMaGV
END;

EXEC prTenGV GV1;

--cho biết tên giáo viên lớp hành chính của một sinh viên nào đấy        
CREATE PROC HienGV_CuaSinhVien ( @MaSV varchar(10))
AS 
BEGIN 
SELECT tblGiaoVien.sTenGV From tblSinhVien
INNER JOIN tblGiaoVien  On tblGiaoVien.sMaGV = tblSinhVien.sMaGVHanhChinh  Where tblSinhVien.sMaSV = @MaSV
END
EXEC dbo.HienGV_CuaSinhVien @MaSV = N'SV5'
