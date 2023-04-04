/***********B.1***********/
GO
CREATE FUNCTION Lay_TenHangSx(@masp nchar(10))
RETURNS TABLE RETURN
SELECT Tenhang
FROM Hangsx INNER JOIN Sanpham ON Hangsx.Mahangsx = Sanpham.mahangsx 
WHERE Sanpham.masp = @masp
GO
SELECT *FROM Lay_TenHangSx('SP01')

/***********B.2***********/
CREATE FUNCTION Lay_Tong(@x int, @y int)
RETURNS int 
AS
BEGIN
DECLARE @tongtien int 
SELECT @tongtien = SUM(soluongN*dongiaN)
FROM Nhap WHERE YEAR(Ngaynhap) BETWEEN @x AND @y
RETURN @tongtien
END
GO
SELECT dbo.Lay_Tong('2019', '2020')

/***********B.3***********/
CREATE FUNCTION Lay_ThayDoiNX(@x nvarchar(20), @y int)
RETURNS int 
AS
BEGIN
DECLARE @N_X int 
SELECT @N_X = SUM(soluongN-soluongX)
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp
WHERE Sanpham.tensp = @x AND YEAR(Ngayxuat) = @y
RETURN @N_X
END
GO
SELECT dbo.Lay_ThayDoiNX('Galaxy Note 11', '2020')

/***********B.4***********/
CREATE FUNCTION Lay_TongNgay(@x int, @y int)
RETURNS int 
AS
BEGIN
DECLARE @tongtien int 
SELECT @tongtien = SUM(soluongN*dongiaN)
FROM Nhap WHERE DAY(Ngaynhap) BETWEEN @x AND @y
RETURN @tongtien
END
GO
SELECT dbo.Lay_TongNgay('2', '4')

/***********B.5***********/
CREATE FUNCTION Lay_TongXuatTrongNam(@A nvarchar(20), @x int)
RETURNS int 
AS
BEGIN
DECLARE @gtXuat int 
SELECT @gtXuat = SUM(soluongX*giaban)
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang = @A AND YEAR(Ngayxuat) = @x
RETURN @gtXuat
END
GO
SELECT dbo.Lay_TongXuatTrongNam('Samsung', '2019')

/***********B.6***********/
CREATE FUNCTION Lay_slNV(@Phong nvarchar(30))
RETURNS nvarchar(20)
AS
BEGIN
DECLARE @slnv int 
SELECT @slnv = COUNT(Manv)
FROM Nhanvien
WHERE Nhanvien.Phong = @Phong
RETURN @slnv
END
GO
SELECT dbo.Lay_slNV('Ke toan')

/***********B.7***********/
CREATE FUNCTION Lay_TongSpXuatNgay(@x nvarchar(20), @y int)
RETURNS int 
AS
BEGIN
DECLARE @slXtheoNgay int 
SELECT @slXtheoNgay = SUM(soluongX)
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp
WHERE Sanpham.tensp = @x AND DAY(Ngayxuat) = @Y
RETURN @slXtheoNgay
END
GO
SELECT dbo.Lay_TongSpXuatNgay('F3 Lite', '2')

/***********B.8***********/
