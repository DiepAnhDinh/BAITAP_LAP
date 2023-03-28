/***B.1***/
SELECT *FROM INFORMATION_SCHEMA.TABLES

/***B.2***/
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
ORDER BY giaban DESC

/***B.3***/
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'

/***B.4***/
SELECT *FROM Nhanvien WHERE Gioitinh='Nu' AND Phong='Ke toan'

/***B.5***/
SELECT Sohdn, Sanpham.masp, tensp, Tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, mausac, donvitinh, Ngaynhap, Tennv, Phong
FROM Nhap
join Sanpham ON Nhap.Masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
join Nhanvien ON Nhap.Manv = Nhanvien.Manv
ORDER BY Sohdn ASC

/***B.6***/
SELECT DISTINCT Sohdx, Xuat.Masp, tensp, Tenhang, soluongX, giaban, tienxuat=soluongX*giaban, mausac, donvitinh, Ngayxuat, Tennv, Phong
FROM Xuat
join Sanpham ON Xuat.Masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
join Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018 AND MONTH(Ngayxuat) = 10 ORDER BY Sohdx ASC

/***B.7***/
SELECT Sohdn, Sanpham.masp, tensp, soluongN, dongiaN, Ngaynhap, Tennv, Phong
FROM Nhap
join Sanpham ON Nhap.Masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
join Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE Hangsx.Tenhang = 'Samsung' AND YEAR(Ngaynhap) = 2017

/***B.8***/
SELECT TOP 10 *FROM Xuat WHERE YEAR(soluongX) = 20218 ORDER BY soluongX ASC

/***B.9***/
SELECT TOP 10 *FROM Sanpham ORDER BY giaban DESC

/***B.10***/
SELECT *FROM Sanpham join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE 100000<giaban AND giaban<500000 AND Hangsx.Tenhang = 'Samsung'

/***B.11***/
