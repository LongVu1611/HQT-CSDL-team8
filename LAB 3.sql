-----------------------Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.-----------------
SELECT MADA AS 'MÃ ĐỒ ÁN' ,CAST (SUM(THOIGIAN) AS DECIMAL(5,2) ) AS'TỔNG SỐ GIỜ LÀM VIỆC'
FROM PHANCONG
GROUP BY MADA
GO
-----------------------Xuất định dạng “tổng số giờ làm việc” kiểu varchar---------------
SELECT MADA AS 'MÃ ĐỒ ÁN' ,CAST (SUM(THOIGIAN) AS varchar ) AS'TỔNG SỐ GIỜ LÀM VIỆC'
FROM PHANCONG
GROUP BY MADA
GO