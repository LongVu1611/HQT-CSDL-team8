-------------Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.------------
declare @dem int = 2;
while @dem <(select count(manv) from NHANVIEN )
	begin 
		select * from NHANVIEN where cast (manv as int ) = @dem
		set @dem = @dem +2 ;
		end
-------------Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.------------
declare @dem1 int = 2 , @i int;
while @dem1 <(select count(manv) from NHANVIEN )
	begin 
	if (@dem1 = 4 )
		begin set @dem1 = @dem1 + 2
			end
		select * from NHANVIEN where cast (manv as int ) = @dem1
		set @dem1 = @dem1 +2 ;
	end
