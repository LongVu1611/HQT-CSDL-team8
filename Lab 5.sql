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

-------------câu 2d----------------------
create proc cau2_d @Trphg nvarchar(10) as
begin
select  * from NHANVIEN inner join PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
where TRPHG = @Trphg
end
go
exec cau2_d '006'
