--1.Tạo trigger đảm bảo sBuoi ở lopthechat chỉ nhận vào giá trị sáng or chiều
CREATE TRIGGER trg_buoihoc ON tblLopTheChat INSTEAD OF INSERT
AS 
BEGIN
	BEGIN TRY
		BEGIN TRAN
DECLARE @buoihoc nvarchar(10)
	SELECT @buoihoc = sBuoi FROM inserted
	IF(@buoihoc not in(N'Sáng',N'Chiều'))
		PRINT N'Bạn đã nhập sai buổi học'
		
	COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
	END CATCH

END

insert into tblLopTheChat
(sMaLopTheChat,sMaMonHoc,sMaGV,sMaPhongHoc,iSiSo,dNgayhoc,sBuoi)
values('L1','M1','GV1','P1','35','12/12/2023',N'Tối')
--2.trigger đảm bảo ở bảng giáo viên chỉ nhận vào gioitinh là 0 hoặc 1 và tuổi của giáo viên phải lớn hơn 18

CREATE TRIGGER trg_ttgv ON tblGiaoVien INSTEAD OF INSERT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
	DECLARE @gt nvarchar(10),@namsinh Datetime
	SELECT @gt = bGioiTinh FROM inserted
	IF(@gt not in(1,0))
		PRINT N'Bạn đã nhập sai giới tinh'
			COMMIT TRAN
	END TRY
		BEGIN CATCH
			ROLLBACK TRAN
		END CATCH
	BEGIN TRY
		BEGIN TRAN
	SELECT @namsinh=YEAR(getdate())- YEAR (dNgaysinh) FROM inserted
	IF(@namsinh<18)
			PRINT N'Bạn đã nhập sai năm sinh'
		COMMIT TRAN
	END TRY
			BEGIN CATCH
			ROLLBACK TRAN
		END CATCH

END
insert tblGiaoVien
values('GV1',N'Trần Văn A','1',N'Hà Nội','12/12/2020','TVA@gmail.com')
--3. trigger đảm bảo ở bảng sinh viên chỉ nhận vào gioitinh là 0 hoặc 1 và tuổi của sinh viên phải lớn hơn hoặc bằng 18

CREATE TRIGGER trg_ttsv ON tblSinhVien INSTEAD OF INSERT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
	DECLARE @gt nvarchar(10),@namsinh Datetime
	SELECT @gt = bGioiTinh FROM inserted
	IF(@gt not in(1,0))
		PRINT N'Bạn đã nhập sai giới tính'
	END TRY
		BEGIN CATCH
		ROLLBACK TRAN
		END CATCH
		BEGIN TRAN
		BEGIN TRY
	SELECT @namsinh=YEAR(getdate())- YEAR (dNgaysinh) FROM inserted
	IF(@namsinh<=18)
			PRINT N'Bạn đã nhập sai năm sinh'

			COMMIT TRAN
	END TRY
		BEGIN CATCH
			ROLLBACK TRAN
		END CATCH

END
insert tblSinhVien
values('SV1','GV1','L1',N'Nguyễn Văn A','10',N'Thái Bình','9/10/2004','NVA@gmail.com');
