-----BAI 2---------
--------------Xuất định dạng “tổng số giờ làm việc” với hàm CEILING-----------------------
select TENDEAN, ceiling (cast (sum(THOIGIAN) as decimal(5,2))) as 'tong so gio lam viec' FROM CONGVIEC
inner join DEAN on CONGVIEC.MADA=DEAN. MADA
inner join PHANCONG on CONGVIEC.MADA=PHANCONG. MADA
group by TENDEAN

--------------Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR-----------------------
select TENDEAN, floor (cast (sum(THOIGIAN) as decimal(5,2))) as 'tong so gio lam viec' FROM CONGVIEC
inner join DEAN on CONGVIEC.MADA=DEAN. MADA
inner join PHANCONG on CONGVIEC.MADA=PHANCONG. MADA
group by TENDEAN

-------------Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"-----------------------------

SELECT HONV+' '+TENLOT+' '+TENNV, LUONG FROM NHANVIEN
WHERE LUONG >(SELECT ROUND(avg(LUONG), 2) FROM NHANVIEN WHERE PHG= (SELECT MAPHG FROM PHONGBAN WHERE TENPHG=N'Nghiên cứu'))

------BAI 3------------
SELECT UPPER(HONV+' '+TENLOT+' '+TENNV), LUONG FROM NHANVIEN
WHERE LUONG >(SELECT ROUND(avg(LUONG), 2) FROM NHANVIEN WHERE PHG= (SELECT MAPHG FROM PHONGBAN WHERE TENPHG=N'Nghiên cứu'))
----------BAI 4----------
-------Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.------
SELECT YEAR(GETDATE())-YEAR(NGSINH) as 'Tuoi' FROM NHANVIEN