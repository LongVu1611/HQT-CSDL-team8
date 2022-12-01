------------Câu 1 a)In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu-------------
CREATE PROC XINCHAO
@TEN NVARCHAR (20)
AS
BEGIN
PRINT N'XIN CHÀO ' + @TEN;
END
EXEC XINCHAO N'NHÓM 8'
GO
-------------Câu 1 b)Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.---------------
CREATE PROC TONG
@S1 INT , @S2 INT
AS
DECLARE @TG INT
SET @TG = @S1+@S2
PRINT CONCAT ('TONG LA:' , @TG)
EXEC TONG 4,5
GO
---------------Câu 1 c)Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.

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

------------Câu 1 d)Nhập vào 2 số. In ra ước chung lớn nhất của chúng-------
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

CREATE PROC THONGTINNV
	@MANV nvarchar(9)
AS
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MANV = @MANV
END

GO

CREATE PROC NVTHAMGIA
	@MADA INT
AS
BEGIN
	SELECT COUNT(MA_NVIEN) FROM PHANCONG
	WHERE MADA = @MADA
END

-------------Câu 2e--------------
create proc cau2_e @Manv nvarchar(10),@Mapb nvarchar(10) as
begin
if exists (select * from NHANVIEN where MANV = @Manv and PHG = @Mapb)
	print' Có'
else
	print ' Không'
end
go
exec cau2_e '002','4'
