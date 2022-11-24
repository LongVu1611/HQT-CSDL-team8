--------Vi?t chýõng tr?nh xem xét tãng lýõng cho nhân viên---------
select iif(luong>=ltb,'Khong tang luong','tang luong')
as thuong,tennv,luong,ltb
from
(select tennv,luong,ltb from NHANVIEN,
(select phg,avg(luong) as 'ltb' from NHANVIEN group by phg) as temp
where NHANVIEN.PHG=temp.PHG) as abc
select * from NHANVIEN
select phg,avg(luong) as 'ltb' from NHANVIEN group by phg


-----------Vi?t chýõng tr?nh phân lo?i nhân viên d?a vào m?c lýõng----------------
select iif(luong>=ltb,'truong phong','nhan vien')
as chucvu,tennv,luong
from
(select tennv,luong,ltb from NHANVIEN,
(select phg,avg(luong) as 'ltb' from NHANVIEN group by phg) as temp
where NHANVIEN.PHG=temp.PHG) as abc
select * from NHANVIEN
select phg,avg(luong) as 'ltb' from NHANVIEN group by phg