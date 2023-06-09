USE [master]
GO
/****** Object:  Database [QLBanHang]    Script Date: 3/28/2023 1:59:22 PM ******/
CREATE DATABASE [QLBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBanHang.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBanHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBanHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBanHang', N'ON'
GO
USE [QLBanHang]
GO
/****** Object:  Table [dbo].[Hangsx]    Script Date: 3/28/2023 1:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsx](
	[Mahangsx] [nchar](10) NOT NULL,
	[Tenhang] [nvarchar](20) NULL,
	[Diachi] [nvarchar](30) NULL,
	[Sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
 CONSTRAINT [PK_Hangsx] PRIMARY KEY CLUSTERED 
(
	[Mahangsx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 3/28/2023 1:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[Manv] [nchar](10) NOT NULL,
	[Tennv] [nvarchar](20) NULL,
	[Gioitinh] [nchar](10) NULL,
	[Diachi] [nvarchar](30) NULL,
	[Sodt] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[Phong] [nvarchar](30) NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhap]    Script Date: 3/28/2023 1:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhap](
	[Sohdn] [nchar](10) NOT NULL,
	[Masp] [nchar](10) NULL,
	[Manv] [nchar](10) NULL,
	[Ngaynhap] [date] NULL,
	[soluongN] [int] NULL,
	[donggiaN] [money] NULL,
 CONSTRAINT [PK_Nhap] PRIMARY KEY CLUSTERED 
(
	[Sohdn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 3/28/2023 1:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[masp] [nchar](10) NOT NULL,
	[mahangsx] [nchar](10) NOT NULL,
	[tensp] [nvarchar](20) NULL,
	[soluong] [int] NULL,
	[mausac] [nvarchar](20) NULL,
	[giaban] [money] NULL,
	[donvitinh] [nchar](10) NULL,
	[mota] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xuat]    Script Date: 3/28/2023 1:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xuat](
	[Sohdx] [nchar](10) NOT NULL,
	[Masp] [nchar](10) NULL,
	[Manv] [nchar](10) NULL,
	[Ngayxuat] [date] NULL,
	[soluongX] [int] NULL,
 CONSTRAINT [PK_Xuat] PRIMARY KEY CLUSTERED 
(
	[Sohdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Nhanvien] FOREIGN KEY([Manv])
REFERENCES [dbo].[Nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Nhanvien]
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([masp])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Sanpham]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hangsx] FOREIGN KEY([mahangsx])
REFERENCES [dbo].[Hangsx] ([Mahangsx])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hangsx]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK_Xuat_Nhanvien] FOREIGN KEY([Manv])
REFERENCES [dbo].[Nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK_Xuat_Nhanvien]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK_Xuat_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([masp])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK_Xuat_Sanpham]
GO
USE [master]
GO
ALTER DATABASE [QLBanHang] SET  READ_WRITE 
GO


/************************************1.6*************************************/
USE [QLBanHang]
GO

INSERT INTO [dbo].[Hangsx]
           ([Mahangsx],[Tenhang],[Diachi],[Sodt],[email])
     VALUES
           ('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr')
GO

INSERT INTO [dbo].[Hangsx]
           ([Mahangsx],[Tenhang],[Diachi],[Sodt],[email])
     VALUES
           ('H02','OPPO','China','081-08626262','oppo@gmail.com.cn')
GO

INSERT INTO [dbo].[Hangsx]
           ([Mahangsx],[Tenhang],[Diachi],[Sodt],[email])
     VALUES
           ('H03','Vinfone','Viet Nam','084-098262626','vf@gmail.com.vn')
GO

/************************************1.7*************************************/
USE [QLBanHang]
GO

INSERT INTO [dbo].[Nhanvien]
           ([Manv],[Tennv],[Gioitinh],[Diachi],[Sodt],[email],[Phong])
     VALUES
           ('NV01','Nguyen Thi Thu','Nu','Ha Noi','0982626521','thu@gmail.com','Ke toan')
GO

INSERT INTO [dbo].[Nhanvien]
           ([Manv],[Tennv],[Gioitinh],[Diachi],[Sodt],[email],[Phong])
     VALUES
           ('NV02','Le Van Nam','Nam','Bac Ninh','0972525252','nam@gmail.com','Vat tu')
GO

INSERT INTO [dbo].[Nhanvien]
           ([Manv],[Tennv],[Gioitinh],[Diachi],[Sodt],[email],[Phong])
     VALUES
           ('NV03','Tran Hoa Binh','Nu','Ha Noi','0328388388','hb@gmail.com','Ke toan')
GO

/************************************1.8*************************************/
USE [QLBanHang]
GO

INSERT INTO [dbo].[Sanpham]
           ([masp],[mahangsx],[tensp],[soluong],[mausac],[giaban],[donvitinh],[mota])
     VALUES
           ('SP01','H02','F1 Plus',100,'Xam',7000000,'Chiec','Hang can cao cap')
GO

INSERT INTO [dbo].[Sanpham]
           ([masp],[mahangsx],[tensp],[soluong],[mausac],[giaban],[donvitinh],[mota])
     VALUES
           ('SP02','H01','Galaxy Note 11',50,'Do',19000000,'Chiec','Hang cao cap')
GO

INSERT INTO [dbo].[Sanpham]
           ([masp],[mahangsx],[tensp],[soluong],[mausac],[giaban],[donvitinh],[mota])
     VALUES
           ('SP03','H02','F3 Lite',200,'Nau',3000000,'Chiec','Hang pho thong')
GO

INSERT INTO [dbo].[Sanpham]
           ([masp],[mahangsx],[tensp],[soluong],[mausac],[giaban],[donvitinh],[mota])
     VALUES
           ('SP04','H03','Vjoy 3',200,'Xam',1500000,'Chiec','Hang pho thong')
GO
INSERT INTO [dbo].[Sanpham]
           ([masp],[mahangsx],[tensp],[soluong],[mausac],[giaban],[donvitinh],[mota])
     VALUES
           ('SP05','H01','Galaxy V21',500,'Nau',8000000,'Chiec','Hang can cao cap')
GO

/************************************1.9*************************************/
USE [QLBanHang]
GO

INSERT INTO [dbo].[Nhap]
           ([Sohdn],[Masp],[Manv],[Ngaynhap],[soluongN],[donggiaN])
     VALUES
           ('N01','SP02','NV01','02/05/2019',10,17000000)
GO

INSERT INTO [dbo].[Nhap]
           ([Sohdn],[Masp],[Manv],[Ngaynhap],[soluongN],[donggiaN])
     VALUES
           ('N02','SP01','NV02','04/07/2020',30,6000000)
GO

INSERT INTO [dbo].[Nhap]
           ([Sohdn],[Masp],[Manv],[Ngaynhap],[soluongN],[donggiaN])
     VALUES
           ('N03','SP04','NV02','05/17/2020',20,1200000)
GO
INSERT INTO [dbo].[Nhap]
           ([Sohdn],[Masp],[Manv],[Ngaynhap],[soluongN],[donggiaN])
     VALUES
           ('N04','SP01','NV03','03/22/2020',10,6200000)
GO

INSERT INTO [dbo].[Nhap]
           ([Sohdn],[Masp],[Manv],[Ngaynhap],[soluongN],[donggiaN])
     VALUES
           ('N05','SP05','NV01','07/07/2020',20,7000000)
GO

/************************************1.10*************************************/
USE [QLBanHang]
GO

INSERT INTO [dbo].[Xuat]
           ([Sohdx],[Masp],[Manv],[Ngayxuat],[soluongX])
     VALUES
           ('X01','SP03','NV02','06-04-2020',5)
GO

INSERT INTO [dbo].[Xuat]
           ([Sohdx],[Masp],[Manv],[Ngayxuat],[soluongX])
     VALUES
           ('X02','SP01','NV03','03-05-2019',3)
GO

INSERT INTO [dbo].[Xuat]
           ([Sohdx],[Masp],[Manv],[Ngayxuat],[soluongX])
     VALUES
           ('X03','SP02','NV01','12-12-2020',1)
GO

INSERT INTO [dbo].[Xuat]
           ([Sohdx],[Masp],[Manv],[Ngayxuat],[soluongX])
     VALUES
           ('X04','SP03','NV02','06-02-2020',2)
GO

INSERT INTO [dbo].[Xuat]
           ([Sohdx],[Masp],[Manv],[Ngayxuat],[soluongX])
     VALUES
           ('X05','SP05','NV01','05-18-2020',1)
GO
