/*****************************TAO VIEW LAP 3***************************/
GO
CREATE VIEW MOT AS
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO
SELECT *FROM MOT
GO
CREATE VIEW HAI AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'
GO
SELECT *FROM HAI
GO
CREATE VIEW BA AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
GO
SELECT *FROM BA
GO
CREATE VIEW BON AS
SELECT COUNT(Manv) AS DEM, Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'Nam' GROUP BY Tennv, Phong
GO
SELECT *FROM BON
GO 
CREATE VIEW NAM AS
SELECT COUNT(masp) AS DEM, Hangsx.Mahangsx
FROM Hangsx JOIN Sanpham ON Hangsx.Mahangsx=Sanpham.mahangsx
GROUP BY Hangsx.Mahangsx
GO
SELECT *FROM BON
GO
CREATE VIEW NAM AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
GO
SELECT *FROM NAM
GO
CREATE VIEW SAU AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO
SELECT *FROM SAU
GO
CREATE VIEW BAY AS
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
GO
SELECT *FROM BAY
GO
CREATE VIEW TAM AS
SELECT Nhap.Masp, Ngaynhap, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE NOT EXISTS(SELECT *FROM Xuat)
GO
SELECT *FROM TAM
GO
CREATE VIEW CHIN AS
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
GO
SELECT *FROM CHIN
GO
CREATE VIEW MUOI AS
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT *FROM MUOI
GO
CREATE VIEW MUOI_MOT AS
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT *FROM MUOI_MOT
GO
CREATE VIEW MUOI_HAI AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
ORDER BY giaban DESC
GO
SELECT *FROM MUOI_HAI
GO
CREATE VIEW MUOI_BA AS
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'
GO
SELECT *FROM MUOI_BA
GO
CREATE VIEW MUOI_BON AS
SELECT *FROM Nhanvien WHERE Gioitinh='Nu' AND Phong='Ke toan'
GO
SELECT *FROM MUOI_BON
GO
CREATE VIEW MUOI_LAM AS
SELECT Sohdn, Sanpham.masp, tensp, Tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, mausac, donvitinh, Ngaynhap, Tennv, Phong
FROM Nhap
join Sanpham ON Nhap.Masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
join Nhanvien ON Nhap.Manv = Nhanvien.Manv
ORDER BY Sohdn ASC
GO
SELECT *FROM MUOI_LAM
GO

/*****************************UPDATE VIEW LAP 3***************************/
GO
ALTER VIEW MOT AS
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
WHERE YEAR(Ngaynhap) = 2020
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO
SELECT *FROM MOT
GO
ALTER VIEW HAI AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2020 AND soluongX>0 AND Tenhang = 'Samsung'
GO
SELECT *FROM HAI
GO
ALTER VIEW BA AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2020
GROUP BY Tenhang, tensp, soluongN
GO
SELECT *FROM BA
GO
ALTER VIEW BON AS
SELECT COUNT(Manv) AS DEM, Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'NU' GROUP BY Tennv, Phong
GO
SELECT *FROM BON
GO 
ALTER VIEW NAM AS
SELECT COUNT(masp) AS DEM, Hangsx.Mahangsx
FROM Hangsx JOIN Sanpham ON Hangsx.Mahangsx=Sanpham.mahangsx
GROUP BY Hangsx.Mahangsx
GO
SELECT *FROM BON
GO
ALTER VIEW NAM AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2020
GROUP BY Tenhang, tensp, soluongN
GO
SELECT *FROM NAM
GO
ALTER VIEW SAU AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2020
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO
SELECT *FROM SAU
GO
ALTER VIEW BAY AS
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2020 AND MONTH(Ngaynhap) = 8 AND dongiaN>0
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
GO
SELECT *FROM BAY
GO
ALTER VIEW TAM AS
SELECT Nhap.Masp, Ngaynhap, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE EXISTS(SELECT *FROM Xuat)
GO
SELECT *FROM TAM
GO
ALTER VIEW CHIN AS
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2020 AND YEAR(Ngayxuat) = 2020
GO
SELECT *FROM CHIN
GO
ALTER VIEW MUOI AS
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT *FROM MUOI
GO
ALTER VIEW MUOI_MOT AS
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT *FROM MUOI_MOT
GO
ALTER VIEW MUOI_HAI AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
ORDER BY giaban DESC
GO
SELECT *FROM MUOI_HAI
GO
ALTER VIEW MUOI_BA AS
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='OPPO'
GO
SELECT *FROM MUOI_BA
GO
ALTER VIEW MUOI_BON AS
SELECT *FROM Nhanvien WHERE Gioitinh='Nam' AND Phong='Vat tu'
GO
SELECT *FROM MUOI_BON
GO
ALTER VIEW MUOI_LAM AS
SELECT Sohdn, Sanpham.masp, tensp, Tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, mausac, donvitinh, Ngaynhap, Tennv, Phong
FROM Nhap
join Sanpham ON Nhap.Masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
join Nhanvien ON Nhap.Manv = Nhanvien.Manv
ORDER BY Sohdn ASC
GO
SELECT *FROM MUOI_LAM
GO

/*****************************XOA VIEW LAP 3***************************/
GO
DROP VIEW MOT
GO
DROP VIEW HAI
GO
DROP VIEW BA
GO
DROP VIEW BON
GO
DROP VIEW NAM
GO
DROP VIEW SAU
GO
DROP VIEW BAY
GO
DROP VIEW TAM
GO
DROP VIEW CHIN
GO
DROP VIEW MUOI
GO
DROP VIEW MUOI_MOT
GO
DROP VIEW MUOI_HAI
GO
DROP VIEW MUOI_BA
GO
DROP VIEW MUOI_BON
GO
DROP VIEW MUOI_LAM
GO