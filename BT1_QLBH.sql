create database QLBH
go
use QLBH
go
create table KHACHHANG
(
	MAKH varchar(4) not null,
	HOTEN varchar(50) not null ,
	DCHI varchar(50) not null,
	SODT varchar(20) not null,
	NGSINH smalldatetime not null,
	DOANHSO money not null,
	NGDK smalldatetime not null,
	CONSTRAINT pk_khachhang PRIMARY KEY(MAKH)
)
go
create table NHANVIEN
(
	MANV varchar(4) not null ,
	HOTEN varchar(40) not null,
	SODT varchar(20) not null,
	NGVL smalldatetime,
	CONSTRAINT pk_nhanvien PRIMARY KEY(MANV)
)
go
create table SANPHAM
(
	MASP varchar(4) not null,
	TENSP varchar(40) not null,
	DVT varchar(20) not null,
	NUOCSX varchar(40) not null,
	GIA money,
	CONSTRAINT pk_sanpham PRIMARY KEY(MASP)
)
go
create table HOADON
(
	SOHD int not null,
	NGHD smalldatetime not null,
	MAKH varchar(4) not null,
	MANV varchar(4) not null,
	TRIGIA money not null,
	CONSTRAINT pk_hoadon PRIMARY KEY(SOHD)
)
go
create table CTHD
(
	SOHD int not null ,
	MASP varchar(4) not null,
	SL int not null
)
go
alter table HOADON
ADD
FOREIGN key (MAKH) REFERENCES KHACHHANG(MAKH)
go
alter table HOADON
ADD
FOREIGN key (MANV) REFERENCES NHANVIEN(MANV)
go
alter table CTHD
ADD
FOREIGN key (SOHD) REFERENCES HOADON(SOHD)
go
alter table CTHD
ADD
FOREIGN key (MASP) REFERENCES SANPHAM(MASP)
go

insert into NHANVIEN values ('NV01','Nguyen Nhu Nhat','0927345678',cast('2006/04/13' as date))
insert into NHANVIEN values ('NV02','Le Thi Phi Yen','0987567390',cast('2006/04/21' as date))
insert into NHANVIEN values ('NV03','Nguyen Van B','0997047382',CAST('2006/04/27' as date))
insert into NHANVIEN values ('NV04','Ngo Thanh Tuan','0913758498',CAST('2006/06/4' as date))
insert into NHANVIEN values ('NV05','Nguyen Thi Truc Thanh','0918590387',CAST('2006/07/20' as date))
Insert into KHACHHANG values ('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TPHCM', '08823451', cast('1960/10/22' as date), 13060, cast('2006/07/22' as date))
Insert into KHACHHANG values ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', cast('1974/03/04' as date), 280, cast('2006/07/30' as date))
Insert into KHACHHANG values ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', cast('1980/06/12' as date), 3860, cast('2006/08/05' as date))
Insert into KHACHHANG values ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', cast('1965/03/09' as date), 250, cast('2006/10/02' as date))
Insert into KHACHHANG values ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', cast('1950/03/10' as date), 21, cast('2006/10/28' as date))
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738', cast('1981/12/31' as date),915,cast('2006/11/24' as date))
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565',cast('1971/04/06' as date),125,cast('2006/01/12' as date))
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756',cast('1971/01/10' as date),365,cast('2006/12/13' as date))
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763',cast('1979/09/03' as date),70,cast('2007/01/14' as date))
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904',cast('1983/05/02' as date),67.5,cast('2007/01/16' as date))
insert into SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) values ('BC01', 'But chi', 'cay', 'Singapore', 3000)
insert into SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) values ('BC02', 'But chi', 'cay', 'Singapore', 5000)
insert into SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) values ('BC03', 'But chi', 'cay', 'Viet Nam', 3500)
insert into SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) values ('BC04', 'But chi', 'hop', 'Viet Nam', 39000)
insert into SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) values ('BB01', 'But bi', 'cay', 'Viet Nam', 5000)
insert into SANPHAM values('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values('TV03','Tap 100 giay tot','quyen','Viet Nam',300)
insert into SANPHAM values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values('TV05','Tap 100 trang','chuc','Viet Nam',2300)
insert into SANPHAM values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values('ST04','So tay','quyen','Thai Lan',55000)
insert into SANPHAM values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values('ST10','But long','cay','Trung Quoc',7000)
insert into HOADON values (1001,CAST('2006/4/13' as date),'KH01','NV01',320000)
insert into HOADON values (1002,CAST('2006/08/12' as date),'KH01','NV02',840000)
insert into HOADON values (1003,CAST('2006/08/23' as date),'KH02','NV01',100000)
insert into HOADON values (1004,CAST('2006/09/01' as date),'KH02','NV01',180000)
insert into HOADON values (1005,CAST('2006/10/20' as date),'KH01','NV02',3800000)
insert into HOADON values (1006,CAST('2006/10/16' as date),'KH01','NV03',2430000)
insert into HOADON values(1007,cast('2006/10/28' as date),'KH03','NV03',510000)
insert into HOADON values(1008,cast('2006/10/28' as date),'KH01','NV03',440000)
insert into HOADON values(1009,cast('2006/10/28' as date),'KH03','NV04',200000)
insert into HOADON values(1010,cast('2006/11/01' as date),'KH01','NV01',5200000)
insert into HOADON values(1011,cast('2006/11/04' as date),'KH04','NV03',25000)
insert into HOADON values(1012,cast('2006/11/30' as date),'KH05','NV03',21000)
insert into HOADON values(1013,cast('2006/12/12' as date),'KH06','NV01',5000)
insert into HOADON values(1014,cast('2006/12/31' as date),'KH03','NV02',3150000)
insert into HOADON values(1015,cast('2007/01/01' as date),'KH06','NV01',910000)
insert into HOADON values(1016,cast('2007/01/01' as date),'KH07','NV02',12500)
insert into HOADON values(1017,cast('2007/01/02' as date),'KH08','NV03',35000)
insert into HOADON values(1018,cast('2007/01/13' as date),'KH08','NV03',330000)
insert into HOADON values(1019,cast('2007/01/13' as date),'KH01','NV03',30000)
insert into HOADON values(1020,cast('2007/01/14' as date),'KH09','NV04',70000)
insert into HOADON values(1021,cast('2007/01/16' as date),'KH10','NV03',67500)

insert into CTHD values(1001,'TV02',10)
insert into CTHD values(1001,'ST01',5)
insert into CTHD values(1001,'BC01',5)
insert into CTHD values(1001,'BC02',10)
insert into CTHD values(1001,'ST08',10)
insert into CTHD values(1002,'BC04',20)
insert into CTHD values(1002,'BB01',20)
insert into CTHD values(1002,'BB02',20)
insert into CTHD values(1003,'BB03',10)
insert into CTHD values(1004,'TV01',20)
insert into CTHD values(1004,'TV02',10)
insert into CTHD values(1004,'TV03',10)
insert into CTHD values(1004,'TV04',10)
insert into CTHD values(1005,'TV05',50)
insert into CTHD values(1005,'TV06',50)
insert into CTHD values(1006,'TV07',20)
insert into CTHD values(1006,'ST01',30)
insert into CTHD values(1006,'ST02',10)
insert into CTHD values(1007,'ST03',10)
insert into CTHD values(1008,'ST04',8)
insert into CTHD values(1009,'ST05',10)
insert into CTHD values(1010,'TV07',50)
insert into CTHD values(1010,'ST07',50)
insert into CTHD values(1010,'ST08',100)
insert into CTHD values(1010,'ST04',50)
insert into CTHD values(1010,'TV03',100)
insert into CTHD values(1011,'ST06',50)
insert into CTHD values(1012,'ST07',3)
insert into CTHD values(1013,'ST08',5)
insert into CTHD values(1014,'BC02',80)
insert into CTHD values(1014,'BB02',100)
insert into CTHD values(1014,'BC04',60)
insert into CTHD values(1014,'BB01',50)
insert into CTHD values(1015,'BB02',30)
insert into CTHD values(1015,'BB03',7)
insert into CTHD values(1016,'TV01',5)
insert into CTHD values(1017,'TV02',1)
insert into CTHD values(1017,'TV03',1)
insert into CTHD values(1017,'TV04',5)
insert into CTHD values(1018,'ST04',6)
insert into CTHD values(1019,'ST05',1)
insert into CTHD values(1019,'ST06',2)
insert into CTHD values(1020,'ST07',10)
insert into CTHD values(1021,'ST08',5)
insert into CTHD values(1021,'TV01',7)
insert into CTHD values(1021,'TV02',10)
