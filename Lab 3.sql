----------------------BÀI 1---------------------------------------------------------------------------------------
-----------------------Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.-----------------
SELECT TEN_CONG_VIEC AS 'TÊN CÔNG VIỆC' ,CAST (SUM(THOIGIAN) AS DECIMAL(5,2) ) AS'TỔNG SỐ GIỜ LÀM VIỆC'
FROM PHANCONG,CONGVIEC
WHERE PHANCONG.MADA=CONGVIEC.MADA
GROUP BY TEN_CONG_VIEC
GO
-----------------------Xuất định dạng “tổng số giờ làm việc” kiểu varchar---------------
SELECT TEN_CONG_VIEC AS 'TÊN CÔNG VIỆC' ,CAST (SUM(THOIGIAN) AS varchar ) AS'TỔNG SỐ GIỜ LÀM VIỆC'
FROM PHANCONG,CONGVIEC
WHERE PHANCONG.MADA=CONGVIEC.MADA
GROUP BY TEN_CONG_VIEC
GO
---------------------------Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu phẩy để phân biệt phần nguyên và phần thập phân.--------------------------
SELECT TENPHG AS 'PHÒNG BAN', REPLACE(CAST (AVG(LUONG) AS DECIMAL(10,2)),'.',',')
FROM NHANVIEN, PHONGBAN
WHERE PHG=MAPHG
GROUP BY TENPHG
GO

-------------------Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3 chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace--------------------------
SELECT TENPHG AS 'PHÒNG BAN', LEFT (CAST (AVG(LUONG) AS VARCHAR(10)),3) + 
REPLACE (CAST (AVG(LUONG) AS VARCHAR(10)) ,LEFT (CAST (AVG(LUONG) AS VARCHAR(10)),3 ),',')AS 'LƯƠNG TRUNG BÌNH'
FROM NHANVIEN, PHONGBAN
WHERE PHG=MAPHG
GROUP BY TENPHG
GO

-----------------BÀI 2--------------------------------------------------------------------------
-----------Xuất định dạng “tổng số giờ làm việc” với hàm CEILING---------------
SELECT TENDEAN AS 'TÊN ĐỀ ÁN', CEILING(SUM(THOIGIAN)) AS 'TỔNG SỐ GIỜ LÀM VIỆC'
FROM DEAN,PHANCONG
WHERE DEAN.MADA=PHANCONG.MADA
GROUP BY TENDEAN
GO

-------------Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR-----------
SELECT TENDEAN AS 'TÊN ĐỀ ÁN', FLOOR(SUM(THOIGIAN)) AS 'TỔNG SỐ GIỜ LÀM VIỆC'
FROM DEAN,PHANCONG
WHERE DEAN.MADA=PHANCONG.MADA
GROUP BY TENDEAN
GO

---------- Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân--------
SELECT TENDEAN AS 'TÊN ĐỀ ÁN', ROUND(SUM(THOIGIAN),2) AS 'TỔNG SỐ GIỜ LÀM VIỆC'
FROM DEAN,PHANCONG
WHERE DEAN.MADA=PHANCONG.MADA
GROUP BY TENDEAN
GO

-------Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"-------
SELECT HONV+' '+TENLOT+' '+TENNV AS'HỌ VÀ TÊN' , LUONG AS 'LƯƠNG'
FROM NHANVIEN
WHERE LUONG >(SELECT ROUND(avg(LUONG), 2) FROM NHANVIEN WHERE PHG= (SELECT MAPHG FROM PHONGBAN WHERE TENPHG=N'Nghiên cứu'))
GO

----------------------------BÀI 3---------------------------------------------------
------------➢ Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân, thỏa các yêu cầu--------------------
----------------------Dữ liệu cột HONV được viết in hoa toàn bộ-----------------------
SELECT UPPER(HONV+' '+TENLOT+' '+TENNV), LUONG FROM NHANVIEN
WHERE LUONG >(SELECT ROUND(avg(LUONG), 2) FROM NHANVIEN WHERE PHG= (SELECT MAPHG FROM PHONGBAN WHERE TENPHG=N'Nghiên cứu'))
----------BAI 4----------
------------Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965-------------
SELECT TENNV
FROM NHANVIEN
WHERE YEAR(NGSINH) between 1960 and 1965
-------Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.------
SELECT YEAR(GETDATE())-YEAR(NGSINH) as 'Tuoi' FROM NHANVIEN
