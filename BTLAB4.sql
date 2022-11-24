--------Viết chương trình xem xét tãng lươg cho nhân viên---------
select iif(luong>=ltb,'Khong tang luong','tang luong')
as thuong,tennv,luong,ltb
from
(select tennv,luong,ltb from NHANVIEN,
(select phg,avg(luong) as 'ltb' from NHANVIEN group by phg) as temp
where NHANVIEN.PHG=temp.PHG) as abc
select * from NHANVIEN
select phg,avg(luong) as 'ltb' from NHANVIEN group by phg


-----------Viết chương trình phân loại nhân viên dựa vào mức lương----------------
select iif(luong>=ltb,'truong phong','nhan vien')
as chucvu,tennv,luong
from
(select tennv,luong,ltb from NHANVIEN,
(select phg,avg(luong) as 'ltb' from NHANVIEN group by phg) as temp
where NHANVIEN.PHG=temp.PHG) as abc
select * from NHANVIEN
select phg,avg(luong) as 'ltb' from NHANVIEN group by phg
--.Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
SELECT TENNV = CASE PHAI
WHEN 'NAM' THEN 'Mr.' +[TENNV]
ELSE 'Ms.'+[TENNV]
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
declare @d int = 2;
while @d <(select count(manv) from NHANVIEN )
	begin 
		select * from NHANVIEN where cast (manv as int ) = @d
		set @d = @d +2 ;
		end
GO
-------------Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.------------
declare @d1 int = 2 , @i int;
while @d1 <(select count(manv) from NHANVIEN )
	begin 
	if (@d1 = 4 )
		begin set @d1 = @d1 + 2
			end
		select * from NHANVIEN where cast (manv as int ) = @d1
		set @d1 = @d1 +2 ;
	end
GO
