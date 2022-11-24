--------Viết chương trình xem xét tãng lươg cho nhân viên---------
SELECT IIF(LUONG>=LTB,'KHONGTANGLUONG','TANGLUONG')
AS THUONG,TENNV,LUONG,LTB
FROM
(SELECT TENNV,LUONG,LTB FROM NHANVIEN,
(SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC
SELECT * FROM NHANVIEN
SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG


-----------Viết chương trình phân loại nhân viên dựa vào mức lương----------------
SELECT IIF(LUONG>=LTB,'TRUONG PHONG','NHAN VIEN')
AS CHUCVU,TENNV,LUONG
FROM
(SELECT TENNV,LUONG,LTB FROM NHANVIEN,
(SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC
SELECT * FROM NHANVIEN
SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG
--.VIẾT CHƯƠNG TRÌNH HIỂN THỊ TENNV NHƯ HÌNH BÊN DƯỚI, TÙY VÀO CỘT PHÁI CỦA NHÂN VIÊN
SELECT TENNV = CASE PHAI
WHEN 'NAM' THEN 'MR.' +[TENNV]
ELSE 'MS.'+[TENNV]
END
FROM NHANVIEN

----Viết chương trình tính thuế mà nhân viên phải đóng theo công thức:--------------
SELECT TENNV, LUONG, THUE = CASE
WHEN LUONG between 0 and 25000 THEN LUONG*0.1
WHEN LUONG between 25000 and 30000 THEN LUONG*0.12
WHEN LUONG between 30000 and 45000 THEN LUONG*0.15
WHEN LUONG between 45000 and 50000 THEN LUONG*0.2
ELSE LUONG*0.25
END
FROM NHANVIEN

-------------Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.------------
DECLARE @D INT = 2;
WHILE @D <(SELECT COUNT(MANV) FROM NHANVIEN )
	BEGIN 
		SELECT * FROM NHANVIEN WHERE CAST (MANV AS INT ) = @D
		SET @D = @D +2 ;
		END
GO
-------------Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.------------
DECLARE @D1 INT = 2 , @I INT;
WHILE @D1 <(SELECT COUNT(MANV) FROM NHANVIEN )
	BEGIN 
	IF (@D1 = 4 )
		BEGIN SET @D1 = @D1 + 2
			END
		SELECT * FROM NHANVIEN WHERE CAST (MANV AS INT ) = @D1
		SET @D1 = @D1 +2 ;
	END
GO
-------Thực hiện chèn dữ liệu vào, nếu nhập được thì thông báo thành công,còn không thì ngược lại--------
BEGIN TRY 
INSERT PHONGBAN (TENPHG, MAPHG, TRPHG,NG_NHANCHUC)
VALUES('SDD',5,'06','1989-10-12')
PRINT'thêm dữ liệu thành công'
END TRY
BEGIN CATCH
PRINT 'thêm dữ liệu thất bại' + CONVERT(VARCHAR, ERROR_NUMBER(),1)
+ ': ' + ERROR_MESSAGE()
END CATCH

-----Tính tổng các số từ 1 đến 10----------------
DECLARE @tong int = 0,@c int,@g int = 1;
SET @c = 10 
WHILE (@g<=@c)
BEGIN
if (@g %2 =0)
SET @tong = @tong + @g
SET @g = @g + 1 
END
PRINT ('Ket qua la: ' )
PRINT @tong


-----Tính tổng các số từ 1 đến 10 trừ số 4----------------
DECLARE @tong1 int = 0,@d INT = 10,@F INT
SET @F = 1
WHILE (@f<=@d)
BEGIN
if (@f %2 =0)
SET @tong1 = @tong1 + @f
SET @f = @f + 1 
if(@f = 4)
SET @tong1 = @tong1 - 4
END
PRINT ('Ket qua la: ' )
PRINT @tong1
