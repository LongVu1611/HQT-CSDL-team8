----Bài 1 .Nhập vào MaNV cho biết tuổi của nhân viên này.
SELECT YEAR(GETDATE()) - YEAR(NGSINH) as N'Tuổi'
FROM NHANVIEN 
WHERE MANV = '001'

if OBJECT_ID('fn_TuoiNV') is not null
	drop function fn_tuoiNV
go

CREATE FUNCTION fn_TuoiNV(@MaNV nvarchar(9))
RETURNS INT
AS 
BEGIN
	RETURN(SELECT YEAR(GETDATE()) - YEAR(NGSINH) AS N'TUỔI'
		FROM NHANVIEN WHERE MANV = @MaNV)
END

print 'Tuổi nhân viên: ' + convert(nvarchar, dbo.fn_TuoiNV('001'))
----Bài 1.Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
SELECT MA_NVIEN, COUNT(MADA) FROM PHANCONG
GROUP BY MA_NVIEN

SELECT COUNT(MADA) FROM PHANCONG WHERE MA_NVIEN = '004'

IF OBJECT_ID('fn_DemDeAnNV') is not null
	drop function fn_DemDeAnNV
go
CREATE FUNCTION fn_DemDeAnNV(@MaNV varchar(9))
returns int
as
	begin
		return(select count(MADA) from PHANCONG where MA_NVIEN = @MaNV)
	end

print ' Số dự án nhân viên đã tham gia là : ' + convert(varchar, dbo.fn_DemDeAnNV('004'))
----Bài 1 .Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
create function fn_demnv_phai(@Phai nvarchar(5) = N'%')
returns int
as 
	begin
		return(select count(*) 
		from NHANVIEN
		where PHAI like @Phai)
	end
 ----Bài 1. Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng đó. 
 if OBJECT_ID('fn_Luong_NhanVien_PB')is not null
	drop function fn_Luong_NhanVien_PB 
go
create function fn_Luong_NhanVien_PB(@TenPhongBan nvarchar(20))
returns @tbLuongNV table(fullname nvarchar (50), luong float)
as 
	begin
		declare @LuongTB float
		select @LuongTB = AVG(LUONG) from NHANVIEN
		inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
		where TENPHG = @TenPhongBan
		--print 'Luong Trung Binh: '+ convert(nvarchar.@LuongTB)
		--insert vao table
		insert into @tbLuongNV
			select HONV+' '+TENLOT+' '+TENNV, LUONG from NHANVIEN
			where LUONG > @LuongTB
		return
	end

select * from dbo.fn_Luong_NhanVien_PB('IT')
---- Bài 1. Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
if object_id('fn_soLuongDeAnTheoPB') is not null
	drop function fn_soLuongDeAnTheoPB
	go
CREATE FUNCTION fn_soLuongDeAnTheoPB(@MaPB int)
returns @tbListPB table(TenPB nvarchar(20), MATP nvarchar(10), TenTP nvarchar(50), soLuong int)
as 
begin
	insert into @tbListPB
	SELECT TENPHG, TRPHG, HONV + ' ' + TENLOT + ' ' + TENNV as 'Ten truong phong', 
	COUNT(MADA) as 'SOLUONGDEAN' FROM PHONGBAN
		INNER JOIN DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
		INNER JOIN NHANVIEN ON NHANVIEN.MANV = PHONGBAN.TRPHG
		WHERE PHONGBAN.MAPHG = @MaPB
		GROUP BY TENPHG, TRPHG, TENNV, HONV, TENLOT
	return
end

select * from dbo.fn_soLuongDeAnTheoPB(1)

----Bài 2. Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
select HONV,TENPHG,DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG

create view v_DD_PhongBan
as
select HONV,TENPHG,DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG

select * from v_DD_PhongBan

----Bài 2 .Hiển thị thông tin TenNv, Lương, Tuổi.
