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
