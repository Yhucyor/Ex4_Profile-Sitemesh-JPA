IF DB_ID(N'jpa_crud') IS NULL
BEGIN
    CREATE DATABASE jpa_crud;
END
GO

USE jpa_crud;
GO

IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users (
        id INT IDENTITY(1,1) NOT NULL,
        email NVARCHAR(255) NOT NULL,
        username NVARCHAR(100) NOT NULL,
        fullname NVARCHAR(255) NOT NULL,
        password NVARCHAR(255) NOT NULL,
        avatar NVARCHAR(500) NULL,
        roleid INT NOT NULL,
        phone NVARCHAR(20) NULL,
        createdDate DATE NULL,
        active BIT NOT NULL,
        otp NVARCHAR(10) NULL,
        otpExpiry DATETIME2 NULL,
        CONSTRAINT PK_Users PRIMARY KEY (id),
        CONSTRAINT UQ_Users_Email UNIQUE (email),
        CONSTRAINT UQ_Users_Username UNIQUE (username)
    );

    CREATE UNIQUE INDEX UX_Users_Phone
        ON dbo.Users(phone)
        WHERE phone IS NOT NULL;
END
GO

IF OBJECT_ID(N'dbo.categories', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.categories (
        CategoryId INT IDENTITY(1,1) NOT NULL,
        CategoryName NVARCHAR(50) NOT NULL,
        Images NVARCHAR(500) NULL,
        status INT NOT NULL,
        CONSTRAINT PK_categories PRIMARY KEY (CategoryId)
    );
END
GO

IF OBJECT_ID(N'dbo.products', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.products (
        ProductId INT IDENTITY(1,1) NOT NULL,
        ProductName NVARCHAR(255) NOT NULL,
        Price FLOAT NOT NULL,
        Quantity INT NULL,
        Description NVARCHAR(1000) NULL,
        Image NVARCHAR(500) NULL,
        Status INT NOT NULL,
        CreatedDate DATETIME2 NULL,
        CategoryId INT NOT NULL,
        CONSTRAINT PK_products PRIMARY KEY (ProductId),
        CONSTRAINT FK_products_categories
            FOREIGN KEY (CategoryId)
            REFERENCES dbo.categories(CategoryId)
    );
END
GO

IF OBJECT_ID(N'dbo.Videos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Videos (
        VideoId NVARCHAR(255) NOT NULL,
        Active INT NOT NULL,
        Description NVARCHAR(500) NULL,
        Poster NVARCHAR(500) NULL,
        Title NVARCHAR(500) NULL,
        Views INT NOT NULL,
        CategoryId INT NULL,
        CONSTRAINT PK_Videos PRIMARY KEY (VideoId),
        CONSTRAINT FK_Videos_categories
            FOREIGN KEY (CategoryId)
            REFERENCES dbo.categories(CategoryId)
    );
END
GO

IF NOT EXISTS (
    SELECT 1
    FROM dbo.Users
    WHERE username = N'admin'
)
BEGIN
    INSERT INTO dbo.Users (
        email,
        username,
        fullname,
        password,
        avatar,
        roleid,
        phone,
        createdDate,
        active,
        otp,
        otpExpiry
    )
    VALUES (
        N'admin@techstore.vn',
        N'admin',
        N'Quản trị viên',
        N'123456',
        NULL,
        1,
        N'0900000001',
        CAST(GETDATE() AS DATE),
        1,
        NULL,
        NULL
    );
END
GO

IF NOT EXISTS (
    SELECT 1
    FROM dbo.Users
    WHERE username = N'user'
)
BEGIN
    INSERT INTO dbo.Users (
        email,
        username,
        fullname,
        password,
        avatar,
        roleid,
        phone,
        createdDate,
        active,
        otp,
        otpExpiry
    )
    VALUES (
        N'user@techstore.vn',
        N'user',
        N'Khách hàng TechStore',
        N'123456',
        NULL,
        5,
        N'0900000002',
        CAST(GETDATE() AS DATE),
        1,
        NULL,
        NULL
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Laptop')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Laptop', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Laptop', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Smartphone')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Smartphone', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Smartphone', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Smartwatch')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Smartwatch', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Smartwatch', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Headphone')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Headphone', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Headphone', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Accessories')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Accessories', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Accessories', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Tablet')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Tablet', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Tablet', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Monitor')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Monitor', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Monitor', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Keyboard')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Keyboard', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Keyboard', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Mouse')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Mouse', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Mouse', 1);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.categories WHERE CategoryName = N'Gaming Gear')
BEGIN
    INSERT INTO dbo.categories (CategoryName, Images, status)
    VALUES (N'Gaming Gear', N'https://placehold.co/700x500/e0f2fe/2563eb?text=Gaming+Gear', 1);
END
GO

DECLARE @LaptopId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Laptop');
DECLARE @SmartphoneId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Smartphone');
DECLARE @WatchId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Smartwatch');
DECLARE @HeadphoneId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Headphone');
DECLARE @AccessoryId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Accessories');
DECLARE @TabletId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Tablet');
DECLARE @MonitorId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Monitor');
DECLARE @KeyboardId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Keyboard');
DECLARE @MouseId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Mouse');
DECLARE @GamingId INT = (SELECT TOP 1 CategoryId FROM dbo.categories WHERE CategoryName = N'Gaming Gear');

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Laptop Dell Inspiron 15')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Laptop Dell Inspiron 15', 18900000, 12, N'Laptop văn phòng hiệu năng ổn định, phù hợp học tập và làm việc.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Dell+Inspiron+15', 1, SYSDATETIME(), @LaptopId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'MacBook Air M2')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'MacBook Air M2', 24990000, 8, N'Thiết kế mỏng nhẹ, pin tốt, phù hợp sinh viên và dân văn phòng.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=MacBook+Air+M2', 1, SYSDATETIME(), @LaptopId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Asus Vivobook 14')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Asus Vivobook 14', 13990000, 14, N'Laptop mỏng nhẹ, màn hình đẹp, phù hợp nhu cầu học tập.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Asus+Vivobook+14', 1, SYSDATETIME(), @LaptopId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Lenovo IdeaPad Slim 5')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Lenovo IdeaPad Slim 5', 15990000, 10, N'Laptop cân bằng giữa hiệu năng, độ bền và tính di động.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=IdeaPad+Slim+5', 1, SYSDATETIME(), @LaptopId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'iPhone 15')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'iPhone 15', 19990000, 10, N'Smartphone cao cấp với camera sắc nét và hiệu năng mạnh mẽ.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=iPhone+15', 1, SYSDATETIME(), @SmartphoneId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Samsung Galaxy S24')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Samsung Galaxy S24', 21990000, 9, N'Màn hình đẹp, hiệu năng cao, hỗ trợ tốt cho công việc hằng ngày.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Galaxy+S24', 1, SYSDATETIME(), @SmartphoneId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Xiaomi Redmi Note 13')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Xiaomi Redmi Note 13', 4990000, 22, N'Điện thoại phổ thông có màn hình lớn và pin bền.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Redmi+Note+13', 1, SYSDATETIME(), @SmartphoneId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'iPad Air')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'iPad Air', 16990000, 7, N'Máy tính bảng mỏng nhẹ cho học tập, thiết kế và giải trí.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=iPad+Air', 1, SYSDATETIME(), @TabletId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Samsung Galaxy Tab S9')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Samsung Galaxy Tab S9', 17990000, 6, N'Tablet Android cao cấp với màn hình sắc nét và bút cảm ứng.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Galaxy+Tab+S9', 1, SYSDATETIME(), @TabletId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Samsung Watch')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Samsung Watch', 5990000, 15, N'Đồng hồ thông minh theo dõi sức khỏe và thông báo tiện lợi.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Samsung+Watch', 1, SYSDATETIME(), @WatchId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Apple Watch SE')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Apple Watch SE', 6490000, 11, N'Đồng hồ thông minh đơn giản, đẹp và dễ dùng.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Apple+Watch+SE', 1, SYSDATETIME(), @WatchId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'AirPods Pro')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'AirPods Pro', 4990000, 20, N'Tai nghe không dây chống ồn, âm thanh rõ và gọn nhẹ.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=AirPods+Pro', 1, SYSDATETIME(), @HeadphoneId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Sony WH-1000XM5')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Sony WH-1000XM5', 7990000, 9, N'Tai nghe chụp tai chống ồn, phù hợp làm việc tập trung.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Sony+XM5', 1, SYSDATETIME(), @HeadphoneId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Màn hình LG UltraGear 27 inch')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Màn hình LG UltraGear 27 inch', 6990000, 8, N'Màn hình gaming tần số quét cao, màu sắc rõ nét.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=LG+UltraGear', 1, SYSDATETIME(), @MonitorId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Màn hình Dell 24 inch')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Màn hình Dell 24 inch', 3890000, 13, N'Màn hình văn phòng viền mỏng, hiển thị ổn định.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Dell+Monitor', 1, SYSDATETIME(), @MonitorId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Bàn phím cơ Logitech')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Bàn phím cơ Logitech', 1890000, 18, N'Bàn phím cơ nhỏ gọn, gõ êm, phù hợp làm việc và giải trí.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Logitech+Keyboard', 1, SYSDATETIME(), @KeyboardId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Keychron K2')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Keychron K2', 2290000, 16, N'Bàn phím cơ không dây layout gọn, phù hợp nhiều thiết bị.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Keychron+K2', 1, SYSDATETIME(), @KeyboardId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Chuột không dây Logitech')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Chuột không dây Logitech', 690000, 25, N'Chuột không dây bền, nhẹ, phù hợp sử dụng hằng ngày.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Logitech+Mouse', 1, SYSDATETIME(), @MouseId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Razer DeathAdder V3')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Razer DeathAdder V3', 1590000, 12, N'Chuột gaming nhẹ, cảm biến chính xác cho game thủ.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Razer+Mouse', 1, SYSDATETIME(), @GamingId);
END

IF NOT EXISTS (SELECT 1 FROM dbo.products WHERE ProductName = N'Tay cầm Xbox Wireless')
BEGIN
    INSERT INTO dbo.products (ProductName, Price, Quantity, Description, Image, Status, CreatedDate, CategoryId)
    VALUES (N'Tay cầm Xbox Wireless', 1490000, 14, N'Tay cầm chơi game không dây, kết nối nhanh và cầm chắc tay.', N'https://placehold.co/700x700/e0f2fe/2563eb?text=Xbox+Controller', 1, SYSDATETIME(), @GamingId);
END
GO
