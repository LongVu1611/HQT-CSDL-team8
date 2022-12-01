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
CREATE PROC CAU3A
	@TENPHG NVARCHAR(15), @MAPHG INT, @TRPHG NVARCHAR(9), @NG_NHANCHUC DATE 
AS 
IF EXISTS (SELECT * FROM PHONGBAN WHERE MAPHG = @MAPHG) 
UPDATE PHONGBAN SET TENPHG = @TENPHG, TRPHG = @TRPHG, NG_NHANCHUC = @NG_NHANCHUC 
WHERE MAPHG = @MAPHG ELSE INSERT INTO PHONGBAN VALUES (@TENPHG, @MAPHG, @TRPHG, @NG_NHANCHUC) 
--DROP PROC CAU3A
GO 

EXEC CAU3A 'CNTT', 6, '008', '1985-01-01'
GO



----------------Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào với điều kiện:---------
CREATE PROC CAU3C
	@HONV NVARCHAR(15), @TENLOT NVARCHAR(15), @TENNV NVARCHAR(15), @MANV NVARCHAR(9), @NGSINH DATETIME, @DCHI NVARCHAR(30), @PHAI NVARCHAR(3), @LUONG FLOAT, @PHG INT 
AS 
BEGIN 
	IF NOT EXISTS(SELECT * FROM PHONGBAN WHERE TENPHG = 'IT') 
	BEGIN 
		PRINT N'NHÂN VIÊN PHẢI TRỰC THUỘC PHÒNG IT'; 
		RETURN; 
	END; 
	DECLARE @MA_NQL NVARCHAR(9); 
	IF @LUONG > 25000 
		SET @MA_NQL = '005'; 
	ELSE 
		SET @MA_NQL = '009'; 
	DECLARE @AGE INT; 
	SELECT @AGE = DATEDIFF(YEAR,@NGSINH,GETDATE()) + 1; 
	IF @PHAI = 'NAM' AND (@AGE < 18 OR @AGE >60) 
	BEGIN 
		PRINT N'NAM PHẢI CÓ ĐỘ TUỔI TỪ 18-65'; 
		RETURN; 
	END; 
	ELSE IF @PHAI = 'NỮ' AND (@AGE < 18 OR @AGE >60) 
	BEGIN 
		PRINT N'NỮ PHẢI CÓ ĐỘ TUỔI TỪ 18-60'; 
		RETURN;
	END; 
	INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) 
		VALUES(@HONV,@TENLOT,@TENNV,@MANV,@NGSINH,@DCHI,@PHAI,@LUONG,@MA_NQL,@PHG) 
END; 
GO 

EXEC CAU3C N'TRẦN',N'VĂN',N'AN','012','1995-04-10',N'ĐỒNG NAI','NAM',30000,6;
GO
