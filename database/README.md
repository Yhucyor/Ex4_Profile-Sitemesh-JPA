# Database Setup

Dự án đang cấu hình SQL Server với database `jpa_crud` trong:

`src/main/resources/META-INF/persistence.xml`

## Cách tạo database

Mở SQL Server Management Studio hoặc Azure Data Studio, đăng nhập vào SQL Server local rồi chạy file:

`database/create_database.sql`

Script sẽ:

- Tạo database `jpa_crud` nếu chưa có.
- Tạo các bảng `Users`, `categories`, `products`, `Videos`.
- Tạo khóa chính, khóa ngoại và unique cho `email`, `username`, `phone`.
- Thêm 10 danh mục và 20 sản phẩm mẫu để test giao diện.
- Danh mục và sản phẩm mẫu đều có link ảnh để trang list/detail hiển thị đẹp hơn.

## Tài khoản test

Admin:

- Username: `admin`
- Password: `123456`

User thường:

- Username: `user`
- Password: `123456`

## Lưu ý

Nếu máy  dùng tài khoản SQL Server khác, cần chỉnh lại phần user/password trong:

`src/main/resources/META-INF/persistence.xml`

Hiện tại dự án đang dùng:

- Database: `jpa_crud`
- Username: `sa`
- Password: `123456`
