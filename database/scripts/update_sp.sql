USE [master]
GO
/****** Object:  Database [db38045]    Script Date: 3/18/2026 3:54:55 PM ******/
CREATE DATABASE [db38045]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db38045', FILENAME = N'D:\Services\MSSQL\Data\db38045.mdf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db38045_log', FILENAME = N'D:\Services\MSSQL\Data\db38045_log.ldf' , SIZE = 8192KB , MAXSIZE = 5242880KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db38045] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db38045].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db38045] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db38045] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db38045] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db38045] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db38045] SET ARITHABORT OFF 
GO
ALTER DATABASE [db38045] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db38045] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db38045] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db38045] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db38045] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db38045] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db38045] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db38045] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db38045] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db38045] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db38045] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db38045] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db38045] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db38045] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db38045] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db38045] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db38045] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db38045] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db38045] SET  MULTI_USER 
GO
ALTER DATABASE [db38045] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db38045] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db38045] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db38045] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db38045] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db38045] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db38045] SET QUERY_STORE = ON
GO
ALTER DATABASE [db38045] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db38045]
GO
/****** Object:  FullTextCatalog [db38045]    Script Date: 3/18/2026 3:54:57 PM ******/
CREATE FULLTEXT CATALOG [db38045] WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 3/18/2026 3:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[Product] [nvarchar](100) NULL,
	[Message] [nvarchar](500) NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/18/2026 3:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 3/18/2026 3:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[Role] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 3/18/2026 3:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[PublicId] [nvarchar](200) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/18/2026 3:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Category] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Weight] [nvarchar](50) NOT NULL,
	[OriginalPrice] [decimal](18, 2) NOT NULL,
	[SellPrice] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TenantKey] [nvarchar](100) NULL,
	[FrontendDomain] [nvarchar](200) NULL,
	[ConnectionString] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Product]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Product]
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsWithDetails]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductsWithDetails]
AS
BEGIN

    SELECT 
        p.Id,
        p.Name,
        p.Price,
        p.Category,
        p.Description,

        -- Images
        pi.Id AS ImageId,
        pi.ProductId,
        pi.ImageUrl,
        pi.PublicId,
        pi.CreatedAt,

        -- Variants
        pv.Id AS VariantId,
        pv.Weight,
        pv.OriginalPrice,
        pv.SellPrice

    FROM Products p
    full outer join ProductImages pi ON pi.ProductId = p.Id
    full outer join ProductVariants pv ON pv.ProductId = p.Id
    WHERE p.IsActive = 1

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSimpleUsers]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_GetSimpleUsers]
AS
BEGIN
    SELECT *
    FROM products p
    LEFT JOIN productvariants pv with (nolock)
        ON pv.productid = p.id AND pv.isactive = 1
    LEFT JOIN productimages pi with (nolock)
        ON pi.productid = p.id
    WHERE p.isactive = 1

END
select * from products
delete from products where name ='4765'
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUser]  
    @Email NVARCHAR(150)  
AS  
BEGIN  
    SELECT   
        Id,  
        Name,  
        Email,  
        PasswordHash,  
        Role,
        PhoneNumber
    FROM Users  
    WHERE Email = @Email  
END  
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsers]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUsers]
    @Username NVARCHAR(100),
    @Password NVARCHAR(200)
AS
BEGIN
    SELECT UserId, Username, Role
    FROM login
    WHERE Username = @Username
      AND PasswordHash = @Password
      AND IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 3/18/2026 3:54:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegisterUser]
    @Name NVARCHAR(100),
    @Email NVARCHAR(150),
    @PasswordHash NVARCHAR(255),
    @PhoneNumber NVARCHAR(20),
    @Role NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already exists', 16, 1)
        RETURN
    END

    INSERT INTO Users
    (Name, Email, PasswordHash, PhoneNumber, Role)
    VALUES
    (@Name, @Email, @PasswordHash, @PhoneNumber, @Role)
END
GO
USE [master]
GO
ALTER DATABASE [db38045] SET  READ_WRITE 
GO
