
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