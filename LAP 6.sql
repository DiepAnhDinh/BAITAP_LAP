/******************B.1**************/
CREATE FUNCTION ThongTinSP (@Tenhang nvarchar(20))
RETURNS TABLE RETURN
SELECT Tenhang, tensp FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang = @Tenhang
GO
SELECT *FROM ThongTinSP ('Samsung')
/******************B.2**************/
CREATE FUNCTION DSNhapSP (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, dongiaN, soluong, mausac, soluongN
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE DAY(Ngaynhap) BETWEEN @x AND @y
GO
SELECT * FROM DSNhapSP (2, 4)
/******************B.3**************/
CREATE FUNCTION LuaChon1 (@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong = 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END
GO
SELECT * FROM LuaChon1 (1)
/******************B.4**************/
CREATE FUNCTION ThongTinNV (@Phong nvarchar(30))
RETURNS TABLE RETURN
SELECT Tennv FROM Nhanvien
WHERE Nhanvien.Phong = @Phong
GO
SELECT *FROM ThongTinNV ('Vat tu')
/******************B.5**************/
CREATE FUNCTION DiaChi (@DiaChi nvarchar(30))
RETURNS TABLE RETURN
SELECT Mahangsx, Tenhang FROM Hangsx
WHERE Hangsx.Diachi = @DiaChi
GO
SELECT *FROM DiaChi ('China')
/******************B.6**************/
CREATE FUNCTION DSXuat (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, soluongX
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM DSXuat(2019, 2020)
/******************B.7**************/
CREATE FUNCTION LuaChon3 (@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),Tenhang nvarchar(20) , Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, soluongN FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, soluongX FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
	END
	RETURN
END
GO
SELECT * FROM dbo.LuaChon3(1)
GO
/******************B.8**************/
CREATE FUNCTION NVNhap (@x int)
RETURNS TABLE RETURN
SELECT Nhanvien.Manv, Tennv, Phong
FROM Nhanvien INNER JOIN Nhap ON Nhanvien.Manv = Nhap.Manv
WHERE DAY(Ngaynhap) = @x
GO
SELECT * FROM NVNhap (22)
/******************B.9**************/
CREATE FUNCTION GiaBanSP (@x int, @y int, @z nvarchar(20))
RETURNS TABLE RETURN
SELECT Tenhang, tensp, giaban
FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE @x<=giaban AND giaban<=@y AND Tenhang=@z
GO
SELECT * FROM GiaBanSP (7000000.0000, 19000000.0000, 'OPPO')
/******************B.10**************/
CREATE FUNCTION HamKhongThamBien ()
RETURNS TABLE RETURN
	SELECT tensp, masp, Tenhang FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
GO
SELECT * FROM dbo.HamKhongThamBien()
ORDER BY Tenhang
GO
