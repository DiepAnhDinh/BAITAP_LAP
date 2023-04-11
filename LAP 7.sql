/*************B1***********/
CREATE PROC NhapLieuHangSX(@mahangsx nvarchar(10), @tenhang nvarchar(20), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20))
AS 
	IF @tenhang NOT IN (SELECT Tenhang FROM Hangsx)
	BEGIN
		INSERT INTO Hangsx(mahangsx, Tenhang, Diachi, Sodt, email)
		VALUES (@mahangsx, @tenhang, @diachi, @sodt, @email)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Tên hãng đã tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.NhapLieuHangSX 'H02', 'OPPO', 'TP.HCM', '093546532', 'OPPO.email'
GO
/****B2****/
CREATE PROC NhapLieuSP(@masp nvarchar(10), @tenhangsx nvarchar(20), @tensp nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money, @donvitinh nvarchar(10), @mota nvarchar(10))
AS
	IF @masp IN (SELECT Masp FROM Sanpham)
	BEGIN 
		UPDATE Sanpham SET tensp = @tensp, mahangsx = @tenhangsx, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
		WHERE masp = @masp
	END
	ELSE 
	BEGIN 
		INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
		VALUES (@masp, @tenhangsx, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
	END
GO
dbo.NhapLieuSP 'SP06', 'H01', 'Galaxy S23 Ultra', 100, 'Xanh lá', 20000000, 'Chiec', 'Hàng cao cấp'
GO
/****B3****/
CREATE PROC XoaHang (@Tenhang nvarchar(20))
AS
	IF @Tenhang IN (SELECT tenhang FROM Hangsx)
	BEGIN
		DELETE FROM Hangsx 
		WHERE Tenhang = @Tenhang
	END
	ELSE
	BEGIN
		RAISERROR (N'Hãng không tồn tại', 16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaHang 'Xiaomi'
/****B4****/
CREATE PROC ChinhSuaNV(@manv nvarchar(10), @tennv nvarchar(20), @gioitinh nvarchar(10), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20), @phong nvarchar(30), @Flag int)
AS
	IF @Flag = 0
	BEGIN
		UPDATE Nhanvien SET Tennv = @tennv, Gioitinh = @gioitinh, Diachi = @diachi, Sodt = @sodt, email = @email, Phong = @phong
		WHERE manv = @manv
	END
	ELSE 
	BEGIN
		INSERT INTO Nhanvien(manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
		VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
	END
GO
dbo.ChinhsuaNV 'NV04', 'Pham Ba Chi', 'Nam', 'Nghe An', '0976585858', 'bachi@gmail.com', 'Vat tu', 1
GO
/****B5****/
CREATE PROC NhapHang(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
AS
	IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		IF @shdn IN (SELECT Sohdn FROM Nhap)
		BEGIN
			UPDATE Nhap SET masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
			WHERE Sohdn = @shdn
		END
		ELSE
		BEGIN
			INSERT INTO Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
			VALUES (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
		END
	END
	ELSE
	BEGIN
		RAISERROR (N'Mã sản phẩm và mã nhân viên không tồn tại !',16,1)
		ROLLBACK TRAN
	END
GO
dbo.NhapHang 'N09', 'SP09', 'NV08','2023-4-1', 10, 9000000.0000
GO
/****B6****/
CREATE PROC XuatHang(@shdx nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngayxuat date, @soluongX int)
AS
	IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien) AND @soluongX <= (SELECT TOP 1 soluong FROM Sanpham)	
	BEGIN
		IF @shdx IN (SELECT Sohdx FROM Xuat)
		BEGIN
			UPDATE Xuat SET masp = @masp, manv = @manv, Ngayxuat = @ngayxuat, soluongX = @soluongX
			WHERE Sohdx = @shdx
		END
		ELSE
		BEGIN
			INSERT INTO Xuat(Sohdx, masp, manv, Ngayxuat, soluongX)
			VALUES (@shdx, @masp, @manv, @ngayxuat, @soluongX)
		END
	END
	ELSE
	BEGIN
		RAISERROR (N'Mã sản phẩm và mã nhân viên không tồn tại hoặc số lượng xuất nhiều hơn tồn kho !',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XuatHang 'X08', 'SP08', 'NV07','2023-4-1',11
GO
/****B7****/
CREATE PROC XoaNV (@manv nvarchar(10))
AS
	IF @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		DELETE FROM Nhanvien WHERE manv = @manv
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
	END
	ELSE 
	BEGIN
		RAISERROR (N'Mã nhân viên không tồn tại !',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaNV 'NV06'
GO
/****B8****/
CREATE PROC XoaSP (@masp nvarchar(10))
AS
	IF @masp IN (SELECT masp FROM Sanpham)
	BEGIN
		DELETE FROM Sanpham WHERE masp = @masp
		DELETE FROM Nhap WHERE masp = @masp
		DELETE FROM Xuat WHERE masp = @masp
	END
	ELSE 
	BEGIN
		RAISERROR (N'Mã sản phẩm không tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaSP 'SP08'
GO