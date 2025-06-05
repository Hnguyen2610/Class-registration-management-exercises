# 📘 Quản Lý Đăng Ký Lớp Thể Chất

Đây là một project mô phỏng hệ thống quản lý đăng ký lớp thể chất trong trường học, được xây dựng bằng SQL Server. Dữ liệu bao gồm các bảng sinh viên, giáo viên, lớp thể chất, phòng học, môn học, đồng thời triển khai view, stored procedure, trigger và phân quyền bảo mật cơ bản.

---

## 📁 Cấu trúc project

| Thư mục / File | Mô tả |
|----------------|-------|
| `QuanLyDangKiLopTheChat_Table` | Chứa các bảng dữ liệu chính của hệ thống như: Sinh viên, Giáo viên, Môn học, Lớp thể chất, Phòng học |
| `QuanLyDangKiLopTheChat_Insert.sql` | Tạo dữ liệu mẫu cho tất cả bảng |
| `QuanLyDangKiLopTheChat_View.sql` | Tạo các `View` phục vụ truy vấn nâng cao |
| `QuanLylDangKiLopTheChat_Trigger.sql` | Định nghĩa các `Trigger` đảm bảo tính đúng đắn của dữ liệu |
| `QuanLyDangKiLopTheChat_StoredProcedure` | Các `Procedure` phục vụ cho các tác vụ như thêm, sửa, xoá dữ liệu một cách có kiểm soát |
| `QuanLyDangKiLopTheChat_PhanQuyenVaBaoMat` | Cấu hình phân quyền người dùng, bảo vệ truy cập cơ sở dữ liệu |

---

## 🗃️ Các bảng dữ liệu chính (`QuanLyDangKiLopTheChat_Table`)

- `tblSinhVien`: thông tin sinh viên đăng ký lớp
- `tblGiaoVien`: thông tin giáo viên giảng dạy
- `tblLopTheChat`: thông tin lớp học thể chất
- `tblPhongHoc`: dữ liệu phòng học
- `tblMonHoc`: danh sách môn học thể chất

---

## 👀 Một số `View` tiêu biểu

- `lopthechat32`: các lớp có sĩ số lớn hơn 32
- `lopthechat2003`: sinh viên sinh năm 2003
- `lopbuoisang`: các lớp học buổi sáng
- `gv_sv2k3`: giáo viên dạy sinh viên sinh năm 2003
- `SinhVienTheoHocTranVanALopTheChat`: sinh viên học với giáo viên Trần Văn A

---

## 🔐 Các `Trigger` kiểm tra logic dữ liệu

- `trg_buoihoc`: chỉ cho phép nhập buổi học là "Sáng" hoặc "Chiều"
- `trg_ttgv`: giới tính giáo viên phải là 0 hoặc 1 và tuổi > 18
- `trg_ttsv`: giới tính sinh viên hợp lệ, tuổi ≥ 18

---

## ⚙️ Phân quyền & bảo mật (`QuanLyDangKiLopTheChat_PhanQuyenVaBaoMat`)

- Phân quyền cho người dùng chỉ được thao tác trên một số bảng nhất định
- Đảm bảo người dùng không thể truy cập trái phép hoặc cập nhật sai quy tắc
- Có thể sử dụng `GRANT`, `DENY`, `REVOKE` và tạo `USER` cụ thể

---

## 🔁 Stored Procedure (`QuanLyDangKiLopTheChat_StoredProcedure`)

- Các thủ tục lưu trữ hỗ trợ:
  - Thêm sinh viên
  - Xóa giáo viên
  - Lọc lớp theo buổi học hoặc sĩ số
  - Thống kê lớp học theo môn

---

## 🚀 Cách triển khai project

1. Cài đặt **SQL Server Management Studio (SSMS)**
2. Tạo database mới
3. Chạy tuần tự các phần:
   - Tạo bảng trong `QuanLyDangKiLopTheChat_Table`
   - Thêm dữ liệu từ `Insert.sql`
   - Tạo view từ `View.sql`
   - Tạo trigger từ `Trigger.sql`
   - Tạo stored procedure (nếu có)
   - Thiết lập phân quyền từ `PhanQuyenVaBaoMat`

---

## 👨‍💻 Tác giả

**Nguyễn Văn A**  
Email: hnguyen261002@gmail.com  
Project môn: Hệ quản trị Cơ sở dữ liệu – 2023  
