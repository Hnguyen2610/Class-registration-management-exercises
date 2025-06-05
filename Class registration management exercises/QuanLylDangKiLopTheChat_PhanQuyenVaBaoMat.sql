-- PHÂN QUYỀN VÀ BẢO MẬT
-- tạo tài khoản
CREATE LOGIN hieu4tuoi
WITH PASSWORD ='hieu123'
--
CREATE LOGIN nguyenhoangnguyen
WITH PASSWORD ='nguyen123'
--
CREATE LOGIN nguyencongphuc
WITH PASSWORD ='phuc123'

-- tạo user cho các thành viên
CREATE USER hieu
FOR LOGIN hieu4tuoi;
--
CREATE USER nguyen
FOR LOGIN nguyenhoangnguyen;
--
CREATE USER phuc
FOR LOGIN nguyencongphuc;

-- cấp quyền cho các thành viên
--Tạo role quyền select bảng tblsinhVien, tblLopTheChat, tblMonHoc, tblPhongHoc
CREATE ROLE role_Select
--
GRANT SELECT
ON tblSinhVien
TO role_Select
--
GRANT SELECT
ON tblLopTheChat
TO role_Select
--
GRANT SELECT
ON tblMonHoc
TO role_Select
--
GRANT SELECT
ON tblPhongHoc
TO role_Select

--Quyền INSERT, UPDATE,DELETE tblSinhVien
GRANT INSERT,UPDATE,DELETE
ON tblSinhVien
TO hieu;
-- add role cho hieu
EXECUTE sp_addrolemember role_Select, hieu;

--Quyền INSERT, UPDATE,DELETE tblGiaoVien
GRANT INSERT,UPDATE,DELETE
ON tblGiaoVien
TO nguyen;
EXECUTE sp_addrolemember role_Select, nguyen;

--Quyền INSERT, UPDATE,DELETE tblLopTheChat
GRANT INSERT,UPDATE,DELETE
ON tblLopTheChat
TO phuc;

EXECUTE sp_addrolemember role_Select, phuc;

-- thu hồi quyền xoá bảng và cấm sử dụng quyền select bảng tblGiaoVien
REVOKE DELETE ON tblGiaoVien FROM nguyen
GO
DENY SELECT
ON tblGiaoVien
TO nguyen
GO
--thu hồi quyền update tblLopTheChat
REVOKE UPDATE
ON tblLopTheChat
FROM phuc