---------------------Câu 1--------------------
CREATE PROC XINCHAO
@TEN NVARCHAR (20)
AS
BEGIN
PRINT N'XIN CHÀO ' + @TEN;
END
EXEC XINCHAO N'NHÓM 8'
GO

CREATE PROC TONG
@S1 INT , @S2 INT
AS
DECLARE @TG INT
SET @TG = @S1+@S2
PRINT CONCAT ('TONG LA:' , @TG)
EXEC TONG 4,5
GO

CREATE PROC TONGSOCHAN
@N INT 
AS
DECLARE @TONG INT = 0,@DEM INT =2;
WHILE @DEM<@N
BEGIN
SET @TONG=@TONG+@DEM
SET @DEM=@DEM+2
END
PRINT'TONG' + CAST (@TONG AS VARCHAR(4))
EXEC TONGSOCHAN 8
GO

CREATE PROC UOCCHUNG
@A INT ,@B INT 
AS
WHILE (@A!=@B)
IF(@A>@B)
SET @A-=@B
ELSE
SET @B-=@A
RETURN @A
DECLARE @C INT 
EXEC @C=UOCCHUNG 30,40
SELECT @C 

GO

---------------------Câu 2--------------------
-------------Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.---------------------
CREATE PROC CAU2A
	@MANV nvarchar(9)
AS
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MANV = @MANV
END

GO

EXEC CAU2A '003'
GO

-------------Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó---------------
CREATE PROC CAU2B
	@MADA INT
AS
BEGIN
	SELECT COUNT(MA_NVIEN) AS 'SỐ LƯỢNG NHÂN VIÊN THAM GIA ĐỀ ÁN' FROM PHANCONG
	WHERE MADA = @MADA
END
GO

EXEC CAU2B'10'
GO

-------------Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA------------------
CREATE PROC CAU2C 
	@MADA INT,@DDIEM_DA NVARCHAR(15) 
AS 
BEGIN 
	SELECT COUNT(MANV) AS 'SỐ LƯỢNG NHÂN VIÊN' , MADA AS 'MÃ ĐỀ ÁN', TENPHG AS 'MÃ ĐỀ ÁN',DDIEM_DA AS 'ĐỊA ĐIỂM ĐỀ ÁN'FROM PHONGBAN 
	INNER JOIN NHANVIEN ON NHANVIEN.PHG = PHONGBAN.MAPHG 
	INNER JOIN DEAN ON DEAN.PHONG = PHONGBAN.MAPHG WHERE MADA = @MADA AND DDIEM_DA = @DDIEM_DA 
	GROUP BY TENPHG,MADA,DDIEM_DA 
END 
GO 

EXEC CAU2C 3,'TP HCM'
GO


-------------------Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.---------------
CREATE PROC CAU2D 
	@TRPHG NVARCHAR(10) 
AS 
BEGIN 
	SELECT * FROM NHANVIEN 
	INNER JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG 
	WHERE TRPHG = @TRPHG 
END 
GO 

EXEC CAU2D '006'
GO

----------------------Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không----------------
CREATE PROC CAU2E 
	@MANV NVARCHAR(10),@MAPB NVARCHAR(10) 
AS
BEGIN
IF EXISTS (SELECT * FROM NHANVIEN WHERE MANV = @MANV AND PHG = @MAPB)
	PRINT' CÓ'
ELSE
	PRINT ' KHÔNG'
END
GO

EXEC CAU2E '002','4'
GO

---------------------- Câu 3 -----------------------------
-------------------Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.------------------


