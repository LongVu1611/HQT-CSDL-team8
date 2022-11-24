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