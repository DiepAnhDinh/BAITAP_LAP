/**********B.1**********/
CREATE PROC themNV (@MaNV nchar(10), @Tennv nvarchar(20), @Gioitinh nchar(10), @Diachi nvarchar(30), @Sodt nvarchar(30), @email nvarchar(30), @Phong nvarchar(30), @Flag int)
AS
	IF @Gioitinh IN('Nam','Nu')
	BEGIN
		IF @Flag=0
		BEGIN
			INSERT INTO Nhanvien (Manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
			VALUES (@MaNV, @Tennv, @Gioitinh, @Diachi, @Sodt, @email, @Phong)
		END
		ELSE
		BEGIN
			UPDATE Nhanvien SET Tennv=@Tennv, Gioitinh=@Gioitinh, Diachi=@Diachi, Sodt=@Sodt, email=@email, Phong=@Phong
			WHERE Manv=@MaNV
		END
			RAISERROR (N'Ma loi 0',16,1)
		END
		ELSE
		BEGIN
			RAISERROR(N'Ma loi 1',16,1)
			ROLLBACK TRAN
		END
	GO
dbo.themNV 'NV05', 'Phan Nhu Cuong', 'Nam', '865, Hoan Kiem, Ha Noi', '077790234', 'nhucuong@gmail.com', 'Xay dung', 0
GO
/**********B.2**********/
CREATE PROC ThemSPM (@masp nchar(10), @Tenhang nvarchar(20), @tensp nvarchar(20), @soluong int, @mausac nvarchar(20), @giaban money, @donvitinh nchar(10), @mota nvarchar(MAX), @Flag int)
AS
	IF @Flag = 0
	BEGIN
		IF @Tenhang NOT IN (SELECT mahangsx FROM Sanpham )
		BEGIN
			RAISERROR (N'Ma loi 1',16,1)
			ROLLBACK TRAN
		END
		IF @soluong < 0 
		BEGIN
			RAISERROR (N'Ma loi 2',16,1)
			ROLLBACK TRAN
		END
		IF @Tenhang IN (SELECT mahangsx FROM Sanpham) AND @soluong > 0
		BEGIN
			INSERT INTO Sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
			VALUES(@masp, @Tenhang, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
	ELSE
	BEGIN
		IF @Tenhang NOT IN (SELECT mahangsx FROM Sanpham )
		BEGIN
			RAISERROR (N'Ma loi 1',16,1)
			ROLLBACK TRAN
		END
		IF @soluong < 0 
		BEGIN
			RAISERROR (N'Ma loi 2',16,1)
			ROLLBACK TRAN
		END
		ELSE
		BEGIN
			UPDATE Sanpham SET mahangsx = @Tenhang, tensp = @tensp, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
			WHERE masp = @masp
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
GO
dbo.ThemSPM 'SP07', 'H02', 'Reno 8', 99, 'Galaxy', 10000000.0000, 'Chiec', 'Hang can cao cap', 0
/**********B.3**********/
CREATE PROC XoaNhanVien (@manv nvarchar(10))
AS
	IF @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		DELETE FROM Nhanvien WHERE manv = @manv
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
		RAISERROR(N'Ma loi 0',16,1)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaNhanVien 'NV06'
GO
/**********B.4**********/
CREATE PROC XoaSanPham (@masp nvarchar(10))
AS
	IF @masp IN (SELECT masp FROM Sanpham)
	BEGIN
		DELETE FROM Sanpham WHERE masp = @masp
		DELETE FROM Nhap WHERE Masp = @masp
		DELETE FROM Xuat WHERE Masp = @masp
		RAISERROR(N'Ma loi 0',16,1)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaSanPham 'SP08'
GO
/**********B.5**********/
CREATE PROC KTraHangSX(@Mahangsx nchar(10), @Tenhang nvarchar(20),@Diachi nvarchar(30), @Sodt nvarchar(20), @email nvarchar(30))
AS
	IF @Tenhang NOT IN (SELECT Tenhang FROM Hangsx)
	BEGIN
		RAISERROR (N'Ma loi 0',16,1)
		ROLLBACK TRAN
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
dbo.KTraHangSX 'H04', 'Apple', 'America', '099-99999', 'apple@gmail.com.kr'
/**********B.6**********/
CREATE PROC DLNhap(@shdn nchar(10), @masp nchar(10), @manv nchar(10), @ngaynhap date, @soluongN int, @dongiaN money)
AS
	IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		IF @shdn IN (SELECT Sohdn FROM Nhap)
		BEGIN
			UPDATE Nhap SET masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
			WHERE Sohdn = @shdn
			RAISERROR (N'Ma loi 0',16,1)
		END
		ELSE
		BEGIN
			INSERT INTO Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
			VALUES (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
	ELSE
	BEGIN
		IF @masp NOT IN (SELECT masp FROM Sanpham) OR @manv NOT IN (SELECT manv FROM Nhanvien)
		BEGIN
			IF @masp NOT IN (SELECT masp FROM Sanpham)
			BEGIN
				RAISERROR (N'Ma loi 1',16,1)
				ROLLBACK TRAN
			END
			ELSE
			BEGIN
				RAISERROR (N'Ma loi 2',16,1)
				ROLLBACK TRAN
			END
		END
	END
GO
dbo.DLNhap 'N01', 'SP02', 'NV01', '2019-05-02', 10, 17000000.0000
/**********B.7**********/
CREATE PROC DLXuat(@shdx nchar(10), @masp nchar(10), @manv nchar(10), @ngayxuat date, @soluongX int)
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
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
	ELSE
	BEGIN
		IF @masp NOT IN(SELECT masp FROM Sanpham) OR @manv NOT IN (SELECT manv FROM Nhanvien) OR @soluongX >= (SELECT TOP 1 soluong FROM Sanpham)	
		BEGIN
			IF @masp NOT IN(SELECT masp FROM Sanpham)
			BEGIN
				RAISERROR (N'Ma loi 1',16,1)
				ROLLBACK TRAN
			END
			IF @manv NOT IN (SELECT manv FROM Nhanvien)
			BEGIN
				RAISERROR (N'Ma loi 2',16,1)
				ROLLBACK TRAN
			END
			ELSE
			BEGIN
				RAISERROR (N'Ma loi 1',16,1)
				ROLLBACK TRAN
			END
		END
	END
GO
dbo.DLXuat 'X01', 'SP03', 'NV02', '2020-06-04', 5