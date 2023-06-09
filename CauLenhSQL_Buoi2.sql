USE [master]
GO
/****** Object:  Database [QuanLyDeAn2]    Script Date: 3/21/2023 4:19:16 PM ******/
CREATE DATABASE [QuanLyDeAn2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDeAn2_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyDeAn2_Data.mdf' , SIZE = 20480KB , MAXSIZE = 512000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDeAn2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyDeAn2_log.ldf' , SIZE = 2048KB , MAXSIZE = 49152KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyDeAn2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDeAn2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDeAn2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDeAn2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDeAn2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDeAn2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDeAn2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyDeAn2] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDeAn2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDeAn2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDeAn2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDeAn2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyDeAn2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyDeAn2', N'ON'
GO
USE [QuanLyDeAn2]
GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 3/21/2023 4:19:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEAN](
	[MaDA] [varchar](2) NOT NULL,
	[TenDA] [nvarchar](50) NULL,
	[DDiemDA] [varchar](20) NULL,
 CONSTRAINT [PK_DEAN] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/21/2023 4:19:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](9) NOT NULL,
	[HoNV] [nvarchar](15) NULL,
	[Tenlot] [nvarchar](30) NULL,
	[TenNV] [nvarchar](30) NULL,
	[NgSinh] [smalldatetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[Phai] [nvarchar](3) NULL,
	[Luong] [numeric](18, 0) NULL,
	[Phong] [varchar](2) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 3/21/2023 4:19:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MaNV] [varchar](9) NOT NULL,
	[MaDA] [varchar](2) NOT NULL,
	[ThoiGian] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 3/21/2023 4:19:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[MaPhg] [varchar](2) NOT NULL,
	[TenPhg] [nvarchar](20) NULL,
 CONSTRAINT [PK_PHONGBAN] PRIMARY KEY CLUSTERED 
(
	[MaPhg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 3/21/2023 4:19:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MaNV] [varchar](9) NOT NULL,
	[TenTN] [varchar](20) NOT NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Phai] [varchar](3) NULL,
	[QuanHe] [varchar](15) NULL,
 CONSTRAINT [PK_THANNHAN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[TenTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [QuanLyDeAn2] SET  READ_WRITE 
GO


/************************ BAI 4 ***************************/


/************ Cau 4.1 *************/
USE QuanLyDeAn
ALTER TABLE PHONGBAN 
ALTER COLUMN TenPhg nvarchar(30)

/************ Cau 4.2 *************/
USE QuanLyDeAn
ALTER TABLE DEAN
ALTER COLUMN DDiemDA nvarchar(20)

/*********** Cau 4.3 *************/
USE QuanLyDeAn
ALTER TABLE THANNHAN ALTER COLUMN TenTN nvarchar(20)
ALTER TABLE THANNHAN ALTER COLUMN Phai nvarchar(3)
ALTER TABLE THANNHAN ALTER COLUMN QuanHe nvarchar(15)

/************* Cau 4.4 ************/
USE QuanLyDeAn2
ALTER TABLE NHANVIEN ADD SoDienThoai varchar(15)

/************** Cau 4.5 *************/
USE QuanLyDeAn2
ALTER TABLE NHANVIEN DROP COLUMN SoDienThoai


/************************ BAI 5 ***************************/

 /**************** Table NHANVIEN *****************/
 USE [QuanLyDeAn]
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (123,'Đinh','Bá','Tiến',27/2/1982,'Mộ Đức','Nam',NULL,4)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (234,'Nguyễn','Thanh','Tùng',12/8/1956,'Sơn Tịnh','Nam',NULL,5)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (345,'Bùi','Thúy','Vũ',NULL,'Tư Nghĩa','Nữ',NULL,4)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (456,'Lê','Thị','Nhàn',12/7/1962,'Mộ Đức','Nữ',NULL,4)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (567,'Nguyễn','Mạnh','Hùng',25/3/1985,'Sơn Tịnh','Nam',NULL,5)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (678,'Trần','Hồng','Quang',NULL,'Bình Sơn','Nam',NULL,5)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (789,'Trần','Thanh','Tâm',17/6/1972,'Tp Quảng Ngãi','Nam',NULL,5)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (890,'Cao','Thanh','Huyền',NULL,'Tư Nghĩa','Nữ',NULL,1)
GO

INSERT INTO [dbo].[NHANVIEN]
           ([MaNV],[HoNV],[TenLot],[TenNV],[NgSinh],[DiaChi],[Phai],[Luong],[Phong])
     VALUES
           (901,'Vương','Ngọc','Quyền',12/12/1987,'Mộ Đức','Nam',NULL,1)
GO


/******************** Table PHONGBAN *****************/
USE [QuanLyDeAn]
GO

INSERT INTO [dbo].[PHONGBAN]
           ([MaPhg]
           ,[TenPhg])
     VALUES
           (1
           ,'Quản lý')
GO

INSERT INTO [dbo].[PHONGBAN]
           ([MaPhg]
           ,[TenPhg])
     VALUES
           (4
           ,'Điều hành')
GO

INSERT INTO [dbo].[PHONGBAN]
           ([MaPhg]
           ,[TenPhg])
     VALUES
           (5
           ,'Nghiên cứu')
GO


/******************** Table DEAN *******************/
USE [QuanLyDeAn]
GO

USE [QuanLyDeAn]
GO

INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (1,'Nâng cao chất lượng muối','Sa Huỳnh')
GO
INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (10,'Xây dựng nhà máy chế biến thủy sản','Dung Quất')
GO
INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (2,'Phát triển hạ tầng mạng','Tp Quảng Ngãi')
GO
INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (20,'Truyền tải cáp quang','Tp Quảng Ngãi')
GO
INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (3,'Tin học hóa trường học','Ba Tơ')
GO
INSERT INTO [dbo].[DEAN]
           ([MaDA],[TenDA],[DDiemDA])
     VALUES
           (30,'Đạo tạo nhân lực','Tịnh Phong')
GO


/**************** Table PHANCONG ****************/
USE [QuanLyDeAn]
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (123,1,33)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (123,2,8)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (345,10,10)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (345,20,10)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (345,3,10)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (456,1,20)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (456,2,20)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (678,3,40)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (789,10,35)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (789,20,30)
GO

INSERT INTO [dbo].[PHANCONG]
           ([MaNV],[MaDA],[ThoiGian])
     VALUES
           (789,30,5)
GO


/****************** Table THANNHAN ******************/
USE [QuanLyDeAn]
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (123,'Châu',30/10/2005,'Nữ','Con gái')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (123,'Duy',25/10/2001,'Nam','Con trai')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (123,'Phương',30/10/1985,'Nữ','Vợ chồng')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (234,'Thanh',05/04/1980,'Nữ','Con gái')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (345,'Dương',30/10/1956,'Nam','Vợ chồng')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (345,'Khang',25/10/1982,'Nam','Con trai')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (456,'Hùng',01/01/1987,'Nam','Con trai')
GO

INSERT INTO [dbo].[THANNHAN]
           ([MaNV],[TenTN],[NgaySinh],[Phai],[QuanHe])
     VALUES
           (901,'Thương',05/04/1989,'Nữ','Vợ chồng')
GO