---- Bài 2 :Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
----1.Nhập dữ liệu cho các quan hệ trên(link file BT1_QLBH của Nhóm 8 )
----2.Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * FROM SANPHAM,KHACHHANG
----3.Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)

UPDATE SANPHAM SET GIA=GIA+GIA/(100/5) 
WHERE NUOCSX='Thai Lan'

----4.Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống(cho quan hệ SANPHAM1).

UPDATE SANPHAM SET GIA =GIA/(100/5)+GIA 
WHERE NUOCSX='Trung Quoc' AND GIA >10000

----5.Cập nhật giá trị LOAIKH là “Vip”

UPDATE KHACHHANG SET LOAIKH ='VIP' 
WHERE (NGDK<cast('2007/1/1' as date) AND DOANHSO>=10000000) 
OR (NGDK>cast('2007/1/1' as date) AND DOANHSO >=2000000)

----Bài 3 :Ngôn ngữ truy vấn dữ liệu có cấu trúc:
----1.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='Trung Quoc'
----2.In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP,TENSP
FROM  SANPHAM
WHERE DVT='cay' OR DVT='quyen'
----3.In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP,TENSP
FROM  SANPHAM
WHERE MASP LIKE 'B%01'
----4.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='Trung Quoc' AND GIA BETWEEN 30000 AND 40000
----5.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP
FROM  SANPHAM
WHERE (NUOCSX='Trung Quoc' OR NUOCSX='Thai Lan') AND GIA BETWEEN 30000 AND 40000
----6.In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE NGHD=cast('2007/01/01' as date) OR NGHD=cast('2007/01/02' as date) 
----7.In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007
ORDER BY  NGHD ASC,TRIGIA DESC
----8.In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT A.MAKH,HOTEN
FROM  HOADON A, KHACHHANG B
WHERE A.MAKH=B.MAKH AND NGHD=cast('2007/01/01' as date) 
----9.In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT SOHD,TRIGIA
FROM  HOADON A, NHANVIEN B
WHERE A.MANV=B.MANV AND NGHD=cast('2006/10/28' as date)  AND HOTEN='Nguyen Van B' 
----10.In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT C.MASP, TENSP
FROM  HOADON A, KHACHHANG B, CTHD C, SANPHAM D
WHERE A.MAKH=B.MAKH AND A.SOHD=C.SOHD AND C.MASP=D.MASP AND
  MONTH(NGHD)=10 AND YEAR(NGHD)=2006 AND HOTEN='Nguyen Van A'
