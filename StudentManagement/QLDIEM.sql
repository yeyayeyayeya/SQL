use master
create database QLDiem 
use QLDiem
go
--2.1
create table DMKHOA
(
MaKhoa char(2) not null,
TenKhoa nVarChar(20),
constraint PK_Khoa primary key(MAKHOA),

)

create table DMSV
(
MaSV char(3) not null,
HoSV nvarchar(30),
TenSV nvarchar(30),
Phai bit,
NgaySinh Datetime,
NoiSinh nvarchar(25),
MaKH char(2),
HocBong float,
constraint PK_SV primary key(MaSV),
constraint FK_SV_KHOA Foreign key (MaKH) references DMKHOA(MaKhoa)
)

create table DMMH
(
MaMH char(2) not null,
TenMH nvarchar(30),
SoTiet tinyint,
constraint PK_DMMH primary key (MaMH)
)

create table KETQUA
(
MaSV char(3),
MaMH char(2),
LanThi tinyint,
Diem decimal(4,2),
constraint PK_KETQUA primary key (MaSV, MaMH, LanThi),
constraint FK_KETQUA_SV foreign key(MaSV) references DMSV(MaSV),
constraint FK_KETQUA_DMMH foreign key (MaMH) references DMMH(MaMH),
)

insert into DMKHOA
values
('AV', N'Anh Văn'),
('TH', N'Tin Học'),
('TR', N'Triết'),
('VL', N'Vật Lý')

set dateformat dmy
insert into DMSV
values 
('A01',N'Nguyễn Thị', N'Hải', '1','23/02/1993', N'Hà Nội', 'TH', 130000),
('A02',N'Trần Văn', N'Chính', '0', '24/12/1992', N'Bình Định', 'VL', 150000),
('A03',N'Lê Thu Bạch', N'Yến', '1', '21/12/1993', N'Tp HCM', 'TH', 170000),
('A04',N'Trần Anh', N'Tuấn', '0', '20/12/1994', N'Hà Nội', 'AV', 80000),
('B01',N'Trần Thanh', N'Mai', '1', '12/08/1993', N'Hải Phòng', 'TR', 0),
('B02',N'Trần Thị Thu', N'Thủy', '1', '02/01/1994', N'Tp HCM', 'AV', 0)
 
 insert into DMMH
 values
 ('01', N'Cơ sở dữ liệu',45 ),
 ('02', N'Trí tuệ nhân tạo',45 ),
 ('03', N'Truyền tin',45 ),
 ('04', N'Đồ họa',60 ),
 ('05', N'Văn phạm',60 ),
 ('06', N'Kỹ thuật lập trình',45 )

 insert into KETQUA
 values
 ('A01', '01', 1, 3),
 ('A01', '01', 2, 6),
 ('A01', '02', 2, 6),
 ('A01', '03', 1, 5),
 ('A02', '01', 1, 4.5),
 ('A02', '01', 2, 7),
 ('A02', '03', 1, 10),
 ('A02', '05', 1, 9),
 ('A03', '01', 1, 2),
 ('A03', '01', 2, 5),
 ('A03', '03', 1, 2.5),
 ('A03', '03', 2, 4),
 ('A04', '05', 2, 10),
 ('B01', '01', 1, 7),
 ('B01', '03', 1, 2.5),
 ('B01', '03', 2, 5),
 ('B02', '02', 1, 6),
 ('B02', '04', 1, 10)


 select * from DMSV
 select * from DMKHOA
 select * from DMMH
 select * from KETQUA
 
 --2.2
 sp_tables 
 sp_columns DMSV
 sp_pkeys DMMH
 
 --2.3
 alter table DMKHOA add NamTL int
 alter table DMKHOA
 alter column NamTL smallint
 exec sp_rename 'DMKHOA.NamTL', 'NamThanhLap'
 alter table DMKHOA DROP column NamThanhLap
 alter table DMSV DROP FK_SV_KHOA 
 alter table DMSV add constraint FK_SV_KHOA foreign key (MAKH) references DMKHOA (MaKH)

 --2.4
 update DMMH
 set SoTiet=45 where TenMH=N'Văn phạm'
 update DMSV
 set TenSV=N'Kỳ' where HoSV=N'Trần Thanh' and TenSV=N'Mai'
 update DMSV
 set Phai='0' where TenSV=N'Kỳ' and HoSV=N'Trần Thanh'
 update DMSV
 set NgaySinh='05/07/1997' where HoSV=N'Trần Thị Thu' and TenSV=N'Thủy'
 update DMSV
 set HocBong=HocBong+100000 where MaKH='AV'
 delete from DMSV where HocBong=0 --Không xóa được
 -- C. Truy vấn
 --1.1. Lấy ra các môn học có tên bắt đầu bằng chữ "T" (Mã môn, tên môn, số tiết)
 select MaMH, TenMH, SoTiet
 from DMMH
 where TenMH like N'T%'
 --1.2. liệt kê những sv có chữ cái cuối cùng trong tên là "I" (Họ tên, ngày sinh, phái)
 select HoSV, TenSV, NgaySinh, Phai
 from DMSV
 where TenSV like N'%I'
 --1.3. Những khoa có ký tự thứ 2 của tên khoa chứa chữ N (Mã khoa, tên khoa)
 select MaKhoa, TenKhoa
 from DMKHOA
 where TenKhoa like N'_n%'
 --1.4. Những sinh viên trong họ có chữ Thị
 select * from DMSV
 where HoSV like N'%Thị%'
 --1.5. Những sinh viên có ký tự đầu tiên trong tên nằm trong khoảng từ a -> m (mã sv, Họ tên, Phái, Học bổng)
 select HoSV, TenSV, MaSV, Phai, HocBong
 from DMSV
 where left(DMSV.TenSV,1) between 'a' and 'm'
 --1.6 Các sinh viên có học bổng từ 150000 trở lên và sinh ở Hà Nội (học tên, maxkhoa, nơi xinh, học bổng)
 select HoSV, TenSV, MaKH, NoiSinh, HocBong
 from DMSV where HocBong>=150000 and NoiSinh=N'Hà Nội'
 --1.7. Danh sách sinh viên của khoa AV và Khoa VL (Mã sv, mã khoa, phái)
 select MaSV, MaKH, Phai
 from DMSV where MaKH='AV' or MaKH='VL'
 --1.8. Những sinh viên có ngày sinh từ 01/01/1992 đến 05/06/1993 (mã sinh viên, ngày sinh, nơi sinh, học bổng)
 select MaSV, NgaySinh, NoiSinh, HocBong
 from DMSV where NgaySinh between '1992-01-01' and '1993-05-06'
 --1.9. những sinh viên có học bổng từ 80000 đến 150000 (mã sv, ngày sinh, phái, khoa)
 select MaSV, NgaySinh, Phai, MaKH
 from DMSV where HocBong between 80000 and 150000
 --1.10. những môn học có số tiết lớn hơn 30 và nhỏ hơn 45 (Mã môn, tên môn, số tiết)
 select MaMH, TenMH, SoTiet
 from DMMH where SoTiet>30 and SoTiet<45
 --1.11. sinh viên nam của khoa anh văn và khoa tin học (ma sv, họ tên, tên khoa, phái)
SELECT DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, DMKHOA.TenKhoa, DMSV.Phai
FROM DMKHOA
INNER JOIN DMSV ON DMKHOA.MaKhoa = DMSV.MaKH
WHERE DMSV.Phai = 0
--1.12. những sinh viên có điểm thi môn csdl nhỏ hơn 5 (mã sv, họ tên, phái, điểm)
/* select DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, DMSV.Phai, KETQUA.Diem
from KETQUA
inner join DMSV on DMSV.MaSV=KETQUA.MaSV
inner join DMMH on DMMH.MaMH=KETQUA.MaMH
where KETQUA.Diem<5 and DMMH.TenMH=N'Cơ sở dữ liệu'
--1.13. những sinh viên học khoa Anh văn không có học bổng (Mã sv, Họ tên, tên kha, nơi sinh, học bổng)
select DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, DMKHOA.TenKhoa, DMSV.NoiSinh, DMSV.HocBong
from DMSV
inner join DMKHOA on DMKHOA.MaKhoa=DMSV.MaKH
where DMSV.HocBong=0 and DMKHOA.TenKhoa=N'Anh Văn' */

--2. Sắp xếp
--2.1. Danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến m (họ tên, ngày sinh, nơi sinh) xếp tăng dần theo tên sinh viên
 /* select HoSV+' ' +TenSV as HoTenSV, NgaySinh, NoiSinh
from DMSV
where TenSV like '%[a-m]%'
order by TenSV ASC
--2.2. sinh viên sắp xếp theo masv tăng dần
select MaSV, HoSV, TenSV, HocBong
from DMSV
order by MaSV ASC
--2.3. 
select HoSV+' '+TenSV as HoTenSV, NgaySinh, HocBong
from DMSV
order by NgaySinh ASC, HocBong DESC
--2.4. 
select MaSV,HoSV+' '+TenSV as HoTenSV, MaKH, HocBong
from DMSV
where HocBong>100000
order by MaKH DESC */
--3. Truy vấn bằng hàn
--3.1. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 2 (họ sinh viên, tên sinh viên, nơi sinh, ngày sinh)
select HoSV, TenSV, NoiSinh, NgaySinh
from DMSV
where NoiSinh like N'Hà Nội' and MONTH(NgaySinh) =2
--3.2. Cho biết những sinh viên có tuổi lớn hơn 20, (học tên sinh viên, tuổi, học bổng)
select HoSV+' '+TenSV as HoTenSV, Tuoi=YEAR(GETDATE())-YEAR(NgaySinh)
from DMSV
where YEAR(GETDATE())-YEAR(NgaySinh)>20
--3.3. Danh sách những sinh viên có tuổi từ 20 đến 25 (Họ tên sv, tuổi, Tên khoa)
select HoSV+' '+TenSV as HoTenSV, Tuoi=YEAR(GETDATE())-YEAR(NgaySinh), TenKhoa
from DMSV
inner join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where YEAR(GETDATE())-YEAR(NgaySinh)>=20 and YEAR(GETDATE())-YEAR(NgaySinh)<=25
--3.4. Danh sách sinh viên sinh vào mùa xuân năm 1990 (Họ tên, phái, ngày sinh)
select HoSV+' '+TenSV as HoTenSV, Phai, NgaySinh
from DMSV where datepart(YEAR, NgaySinh) =1990  and DATEPART(mm, NgaySinh)>=1 and Datepart(MM, NgaySinh)<=3
--3.5. cho biết thông tin về mức học bổng của các sinh viên bao gồm mã sinh viên, phái, mã khoa, mức học bổng. Trong đó học bổng sẽ hiển thị là "học bổng cao", nếu giá trị của học bổng lớn hơn 150000 và ngược lại hiển thị là "mức trung bình"
Select MaSV, Phai, MaKH, Muchocbong=case when HocBong>150000
then 'Hoc bong cao' Else 'Muc trung binh' End
from DMSV
--3.6. 
select DMSV.HoSV, DMSV.TenSV, KETQUA.LanThi, KETQUA.Diem, Ketqua=case
when KETQUA.Diem < 5 then N'RỚT' else N'ĐẬU' end
from DMSV
inner join KETQUA on DMSV.MaSV=KETQUA.MaSV
--4. Truy vấn sử dụng hàm kết hợp: Max, min, count, sum avg và gom nhóm
--4.1. cho biết tổng số sinh viên của toàn trường
select count(*) as SLSV
from DMSV
--4.2. Cho biết tổng sinh viên và sinh viên nữ
select 
count(case when Phai=1 then 1 end) as SVNU,
count(*) as SLSV
from DMSV
--4.3. Cho biết tổng số sinh viên từng khoa
select sv.MaKH, TenKhoa, count(MaSV) as SoSV  
from DMSV sv, DMKHOA kh
where sv.MaKH=kh.MaKhoa
group by sv.MaKH,TenKhoa
--4.4. cho biết số lượng sinh viên học từng môn 
select mh.MaMH, mh.TenMH, count(distinct MaSV) as soSV  
from DMMH mh, KETQUA kq
where mh.MaMH=kq.MaMH
group by mh.MaMH, TenMH
--4.5. cho biết số lượng môn học mà mỗi sinh viên đã học
select sv.MaSV, sv.HoSV+' '+sv.TenSV as HoTenSV, count(distinct MaMH) as SoMH
from DMSV sv, KETQUA kq
where sv.MaSV=kq.MaSV
group by sv.MaSV, sv.HoSV+' '+sv.TenSV
--4.6. cho biết học bổng cao nhất của mỗi khoa
select kh.MaKhoa, kh.TenKhoa, max(HocBong) as HBCaoNhat
from DMSV sv, DMKHOA kh
where sv.MaKH=kh.MaKhoa
group by kh.MaKhoa, kh.TenKhoa
--4.7. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa
select kh.MaKhoa, kh.TenKhoa, 
sum(case when Phai=0 then 1 else 0 end) as TNam,
sum(case when Phai=1 then 1 else 0 end) as TNu
from DMKHOA kh, DMSV sv
where kh.MaKhoa=sv.MaKH
group by kh.MaKhoa, TenKhoa
--4.8. Cho biết số lượng sinh viên theo từng độ tuổi
select 
case 
when YEAR(GETDATE())-YEAR(NgaySinh) between 18 and 20 then '20'
when YEAR(GETDATE())-YEAR(NgaySinh) between 21 and 30 then '30'
else N'Trên 30'
end as DoTuoi, count(MaSV) as SoLuongSV
from DMSV
group by case 
when YEAR(GETDATE())-YEAR(NgaySinh) between 18 and 20 then '20'
when YEAR(GETDATE())-YEAR(NgaySinh) between 21 and 30 then '30'
else N'Trên 30'
end
order by DoTuoi
--4.9. Cho biết số lượng sinh viên rớt và đậu trong lần thi 1
select DMMH.MaMH, DMMH.TenMH, case when Diem>=5 then N'Đậu' else N'Rớt' end as KetQua,  count(distinct MaSV) as SoLuong 
from KETQUA, DMMH
where LanThi=1 and DMMH.MaMH=KETQUA.MaMH
group by case when Diem>=5 then N'Đậu' else N'Rớt' end, DMMH.TenMH, DMMH.MaMH
order by DMMH.MaMH asc
select * from KETQUA

--5. Truy vấn theo điều kiện gom nhóm
--5.1. Cho biết năm sinh nào có 2 sinh viên đang theo học tại trường
select YEAR(NgaySinh) as NamSinh
from DMSV
group by YEAR(NgaySinh)
having count(MaSV)=2
--5.2. Cho biết nơi nào có hơn 2 sinh viên đang theo học tại trường
select NoiSinh, count(MaSV) as SL
from DMSV 
group by NoiSinh
having count(MaSV)>=2
--5.3. Cho biết môn nào có trên 3 sinh viên dự thi
select DMMH.MaMH,DMMH.TenMH, count(distinct MaSV) as SL
from KETQUA, DMMH
where KETQUA.MaMH=DMMH.MaMH
group by DMMH.MaMH,DMMH.TenMH
having count(distinct MaSV)>3
--5.4. Cho biết môn nào có thí sinh thi lại trên 2 lần
select DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, count(KETQUA.MaSV) as SL
from KETQUA, DMSV
where KETQUA.MaSV=DMSV.MaSV
group by DMSV.MaSV, DMSV.HoSV, DMSV.TenSV
having count(KETQUA.MaSV)>2
--5.5. Cho biết sinh viên nam có điểm trung bình lần 1 trên 7.0
select distinct DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, KETQUA.LanThi,  AVG(Diem) as DiemTB
from DMSV, KETQUA
where DMSV.MaSV=KETQUA.MaSV and LanThi=1 and Phai=0
group by DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, KETQUA.LanThi, KETQUA.Diem 
having AVG(Diem)>7
--5.6. Cho biết danh sách sinh viên rớt trên 2 môn ở lần thi 1
select distinct DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, KETQUA.LanThi, Diem
from DMSV, KETQUA
where DMSV.MaSV=KETQUA.MaSV and LanThi=1
group by DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, KETQUA.LanThi, Diem
having Diem<5
--5.7. Cho biết khoa nào có nhiều hơn 2 sinh viên nam
select DMKHOA.MaKhoa, DMKHOA.TenKhoa, COUNT(MaSV) as Sl
from DMKHOA, DMSV
where DMKHOA.MaKhoa=DMSV.MaKH and Phai=0
group by DMKHOA.MaKhoa, DMKHOA.TenKhoa
having COUNT(MaSV)>2
--5.8. Cho biết khoa có 2 sinh viên đạt học bổng từ 100.000 đến 200.000
select DMKHOA.MaKhoa, DMKHOA.TenKhoa, COUNT(MaSV) as Sl
from DMKHOA, DMSV
where DMKHOA.MaKhoa=DMSV.MaKH and HocBong between 100000 and 200000
group by DMKHOA.MaKhoa, DMKHOA.TenKhoa
having count(MaSV)=2
--5.9. Cho biết sinh viên nam học từ 3 môn trở lên
select DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, count(distinct MaMH) as SLMonHoc
from DMSV, KETQUA
where DMSV.MaSV=KETQUA.MaSV and Phai=0
group by DMSV.MaSV, DMSV.HoSV, DMSV.TenSV
having count(distinct MaMH)>=3
--5.10. Cho biết sinh viên có điểm trung bình lần 1 từ 7 trở lên nhưng 
--không có môn nào dưới 5
SELECT sv.MaSV, sv.HoSV, sv.TenSV, AVG(kq.Diem) AS DiemTrungBinh
FROM KetQua kq
JOIN DMSV sv ON kq.MaSV = sv.MaSV
WHERE kq.Diem >= 5 and LanThi=1-- Không có môn nào dưới 5
GROUP BY sv.MaSV, sv.HoSV, sv.TenSV
HAVING AVG(kq.Diem) >= 7 -- Điểm trung bình lần 1 >= 7
ORDER BY DiemTrungBinh DESC;
--5.11. Cho biết môn không có sinh viên rớt ở lần 1
select distinct mh.MaMH, mh.TenMH
from KETQUA kq
join DMMH mh ON kq.MaMH=mh.MaMH
where LanThi=1
group by mh.MaMH, mh.TenMH
having min(Diem)>=5
order by MaMH ASC
--5.12. Cho biết sinh viên đăng ký học hơn 3 môn mà thi lần 1 không bị rớt môn nào
select sv.MaSV, sv.HoSV, sv.TenSV, count(kq.MaSV) as sluong
from KETQUA kq
join DMSV sv on kq.MaSV=sv.MaSV
where LanThi=1 
group by sv.MaSV, sv.HoSV, sv.TenSV
having count(kq.MaSV)>3 and min(Diem)>=5
order by MaSV ASC
select * from KETQUA
select * from DMSV
select * from DMMH
--6. Truy vấn con trả về một giá trị
--6.1. Cho biết những sinh viên có học bổng cao nhất
select *
from DMSV
where HocBong=(select max(HocBong) from DMSV)
--6.2. Cho biết những sinh viên có điểmt hi lần 1 môn cơ sở dữ liệu cao nhất
select *
from DMSV sv
join KETQUA kq on sv.MaSV=kq.MaSV
where kq.Diem=(select max(kq.Diem) from KETQUA kq join DMMH mh on kq.MaMH=mh.MaMH 
where mh.TenMH=N'Cơ sở dữ liệu') and LanThi=1
--6.3. Cho biết sinh viên khoa anh văn có tuổi lớn nhất
select *
from DMSV sv join DMKHOA kh on sv.MaKH=kh.MaKhoa
where YEAR(GETDATE())-YEAR(NgaySinh) = 
(select max(YEAR(GETDATE())-YEAR(NgaySinh)) 
from DMSV sv join DMKHOA kh on sv.MaKH=kh.MaKhoa
where kh.TenKhoa=N'Anh văn')
--6.4. Cho biết những sinh viên có cùng nơi sinh với sinh viên có mã số A01
select *
from DMSV 
where NoiSinh=(select NoiSinh from DMSV where MaSV='A01')
--6.5. Cho biết sinh viên khoa anh văn học môn văn phạm có điểm thi lần 1 thấp nhất
select *
from DMSV, DMKHOA, KETQUA, DMMH
where DMSV.MaKH=DMKHOA.MaKhoa 
and DMSV.MaSV=KETQUA.MaSV 
and DMMH.MaMH=KETQUA.MaMH 
and TenKhoa=N'Anh văn' 
and TenMH=N'Văn phạm' 
and Diem = (
select min(Diem) 
from KETQUA 
where LanThi=1 
)

/*SELECT DMSV.*, DMKHOA.TenKhoa, DMMH.TenMH, KETQUA.Diem
FROM DMSV
INNER JOIN DMKHOA ON DMSV.MaKH = DMKHOA.MaKhoa
INNER JOIN KETQUA ON DMSV.MaSV = KETQUA.MaSV
INNER JOIN DMMH ON KETQUA.MaMH = DMMH.MaMH
WHERE DMKHOA.TenKhoa = N'Anh văn'
AND DMMH.TenMH = N'Văn phạm'
AND KETQUA.Diem = (
    SELECT MIN(KETQUA.Diem)
    FROM KETQUA
    WHERE KETQUA.LanThi = 1
);*/
--6.6. Cho biết sinh viên thi môn cơ sở dữ liệu lần 2 có điểm bằng điểm cao nhất của sinh viên thi môn cơ sở dữ liệu lần 1
select *
from KETQUA
join DMSV on DMSV.MaSV=KETQUA.MaSV
join DMMH on DMMH.MaMH=KETQUA.MaMH
where DMMH.TenMH=N'Cơ sở dữ liệu' 
and LanThi=2 
and Diem=(
select max(Diem) 
from KETQUA
join DMMH on KETQUA.MaMH=DMMH.MaMH
where TenMH=N'Cơ sở dữ liệu' and LanThi=1)
--6.7. Cho biết sinh viên có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác
select *
from KETQUA
join DMSV on DMSV.MaSV=KETQUA.MaSV
join DMMH on DMMH.MaMH=KETQUA.MaMH
where DMMH.TenMH=N'Cơ sở dữ liệu' 
and LanThi=2 
and Diem>(
select max(Diem) 
from KETQUA
join DMMH on KETQUA.MaMH=DMMH.MaMH
where TenMH=N'Cơ sở dữ liệu' and LanThi=1)
--6.8. Cho biết những sinh viên có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn 
select *
from DMSV
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where HocBong>(
select max(HocBong) 
from DMSV
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where TenKhoa=N'Anh văn')
--7. Truy vấn con trả về nhiều giá trị
--7.1. Cho biết sinh viên có nơi sinh cùng với Hải
select * 
from DMSV
where NoiSinh IN (
Select NoiSinh 
from DMSV
where TenSV like N'Hải')
and TenSV not like N'Hải'
--7.2. Cho biết những sinh viên có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn
select *
from DMSV
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where HocBong > ALL (
select HocBong 
from DMSV 
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where TenKhoa=N'Anh văn')
and TenKhoa not like N'Anh văn'
--7.3. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên khoa anh văn
select *
from DMSV
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where HocBong > ANY (
select HocBong 
from DMSV 
join DMKHOA on DMSV.MaKH=DMKHOA.MaKhoa
where TenKhoa=N'Anh văn')
and TenKhoa not like N'Anh văn'
/*7.4. Cho biết sinh viên có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn
tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác*/
select *
from DMSV, DMMH, KETQUA
where TenMH=N'Cơ sở dữ liệu' 
and LanThi=2 
and Diem > all (
select Diem
from KETQUA, DMMH, DMSV
where KETQUA.MaMH=DMMH.MaMH 
and TenMH=N'Cơ sở dữ liệu'
and LanThi=1)
--7.5. Với mỗi sinh viên, cho biết điểm thi cao nhất của môn tương ứng
SELECT SV.MASV,HOSV+' '+TENSV AS HOTEN, TENMH, DIEM
FROM KETQUA K1,DMSV SV,DMMH MH
WHERE SV.MASV=K1.MASV
AND K1.MAMH=MH.MAMH
AND DIEM>=ALL(SELECT DIEM
FROM KETQUA K2
WHERE K1.MASV=K2.MASV)
--7.6. Cho biết môn nào có nhiều sinh viên học nhất
select mh.MaMH, TenMH, count(distinct MaSV) as SLuongSV
from KETQUA kq, DMMH mh
where kq.MaMH=mh.MaMH
group by mh.MaMH, TenMH
having COUNT(distinct MaSV) >= all (
select count(distinct MaSV)
from KETQUA
group by MaMH)
--7.7. Cho biết những khoa có đông sinh viên nam nhất
select kh.MaKhoa, TenKhoa, count(distinct MaKH) as SLuong
from DMSV sv, DMKHOA kh
where sv.MaKH=kh.MaKhoa 
and Phai=0
group by kh.MaKhoa, TenKhoa
having count(distinct MaKH)>=all (
select count(distinct MaKH) 
from DMKHOA)
--7.8. Cho biết khoa nào có đông sinh viên nhận học bổng nhất 
--và khoa nào có ít sinh viên nhận học bổng nhất
with HocBongKhoa as (
select kh.MaKhoa, TenKhoa, count(distinct sv.MaSV) as SoSV_HB
from DMSV sv 
join DMKHOA kh on sv.MaKH=kh.MaKhoa
where sv.HocBong>0
group by kh.MaKhoa, TenKhoa)
select * From HocBongKhoa
where SoSV_HB=(select max(SoSV_HB) 
from HocBongKhoa)
union all
select * from HocBongKhoa
where SoSV_HB=(select min(SoSV_HB) 
from HocBongKhoa)
--7.9.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhất
select mh.MaMH, mh.TenMH, count(distinct kq.MaSV) as SoSV_Rot
from  KETQUA kq, DMMH mh
where kq.MaMH=mh.MaMH
and LanThi=1 and Diem<5
group by mh.MaMH, mh.TenMH
having count(distinct kq.MaSV)>=all(
select count(distinct kq.MaSV)
from KETQUA kq
where Diem<5 and LanThi=1)

SELECT KQ.MaMH, MH.TenMH, COUNT(KQ.MaSV) AS SoLuongRot
FROM KETQUA KQ
JOIN DMMH MH ON KQ.MaMH = MH.MaMH
WHERE KQ.LanThi = 1 AND KQ.Diem < 5
GROUP BY KQ.MaMH, MH.TenMH
having COUNT(KQ.MaSV)>=all(
select COUNT(KQ1.MaSV)
from KETQUA KQ1
where KQ1.LanThi=1 and KQ1.Diem<5
group by KQ1.MaMH
)
--7.10.Cho biết 3 sinh viên có học nhiều môn nhất.
SELECT TOP 3 s.MaSV, HoSV, TenSV, COUNT(DISTINCT(MaMH)) as SoMon
FROM DMSV s, KETQUA k
WHERE s.MASV = k.MASV
GROUP BY s.MaSV, HoSV, TenSV
ORDER BY COUNT(DISTINCT(MaMH)) DESC

--8. Phép trừ
--8.1. Cho biết sinh viên chưa thi môn CSDL
select *
from DMSV
where MaSV not in (
select kq.MaSV
from DMMH mh, KETQUA kq
where mh.MaMH=kq.MaMH
and TenMH=N'Cơ sở dữ liệu')
--8.2. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2
select *
from DMSV sv, KETQUA kq
where sv.MaSV=kq.MaSV 
and LanThi=2
and kq.MaSV not in (
select kq.MaSV
from KETQUA kq
where LanThi=1)
--8.3. Cho biết môn nào không có sinh viên khoa anh văn học
select *
from DMMH
where MaMH not in (
select distinct kq.MaMH
from KETQUA kq, DMKHOA kh, DMSV sv
where kq.MaSV=sv.MaSV 
and sv.MaKH=kh.MaKhoa
and TenKhoa=N'Anh văn')
--8.4. Cho biết những sinh viên khoa Anh văn chưa học môn Văn phạm
select *
from DMSV sv, DMKHOA kh
where sv.MaKH=kh.MaKhoa 
and TenKhoa=N'Anh văn'
and sv.MaSV not in (
select kq.MaSV
from KETQUA kq, DMMH mh
where kq.MaMH=mh.MaMH 
and TenMH=N'Văn phạm')
--8.5. Cho biết những môn không có sinh viên rớt lần 1
select *
from DMMH mh
where mh.MaMH not in (
select kq.MaMH
from DMMH mh, KETQUA kq
where mh.MaMH=kq.MaMH 
and LanThi=1
and Diem<5)
--8.6. Cho biết những khoa không có sinh viên nữ
select kh.MaKhoa, kh.TenKhoa
from DMKHOA kh, DMSV sv
where kh.MaKhoa=sv.MaKH 
and sv.MaSV not in (
select sv.MaSV
from DMSV sv
where Phai=1)
/*8.7. Cho biết những sinh viên:
- Học khoa anh văn có học bổng hoặc chưa bao giờ rớt*/
select sv.MaSV, HoSV, TenSV, sv.MaKH
from DMSV sv, DMKHOA kh
where sv.MaKH=kh.MaKhoa
and TenKhoa like N'Anh văn'
and HocBong>0
union
select sv.MaSV, HoSV, TenSV, sv.MaKH
from DMSV sv, KETQUA kq
where sv.MaSV not in (
select MaSV
from KETQUA
where Diem<5)

/*8.8. Cho biết những sinh viên:
- Không có học bổng hoặc bị rớt môn học*/
select sv.MaSV, HoSV, TenSV
from DMSV sv
where HocBong<=0
union
select sv.MaSV, HoSV, TenSV
from DMSV sv, KETQUA kq
where sv.MaSV=kq.MaSV
and LanThi=1
and Diem<5
and sv.MaSV not in (
select MaSV
from KETQUA
where LanThi=2)
union
select sv.MaSV, HoSV, TenSV
from DMSV sv, KETQUA kq
where sv.MaSV=kq.MaSV
and LanThi=2
and Diem<5
--9. Truy vấn dùng phép chia
--9.1 Cho biết những môn được tất cả các sinh viên theo học 
--(môn học mà không có sinh viên nào không học)
select *
from DMMH mh
where not exists (
select * from DMSV sv
where not exists (
select * from KETQUA kq
where kq.MaSV=sv.MaSV
and kq.MaMH=mh.MaMH))
--9.2. Cho biết những sinh viên học những môn giống sinh viên có mã A02
SELECT DISTINCT*
FROM DMSV S
WHERE S.MaSV <> 'A02'
AND EXISTS (
    SELECT 1
    FROM KETQUA K1
    WHERE K1.MaSV = S.MaSV
    AND EXISTS (
        SELECT 1
        FROM KETQUA K2
        WHERE K2.MaSV = 'A02'
        AND K2.MaMH = K1.MaMH
    )
);

--9.3. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.
SELECT DISTINCT*
FROM DMSV S
JOIN KETQUA K1 ON S.MaSV = K1.MaSV
WHERE NOT EXISTS (
    SELECT * FROM KETQUA K2
    WHERE K2.MaSV = 'A02' 
    AND NOT EXISTS (
        SELECT * FROM KETQUA K3
        WHERE K3.MaSV = S.MaSV
        AND K3.MaMH = K2.MaMH
    )
)
AND NOT EXISTS (
    SELECT * FROM KETQUA K4
    WHERE K4.MaSV = S.MaSV
    AND NOT EXISTS (
        SELECT * FROM KETQUA K5
        WHERE K5.MaSV = 'A02'
        AND K5.MaMH = K4.MaMH
    )
)
AND S.MaSV <> 'A02'; -- Loại bỏ chính sinh viên A02


--10.Kết ngoài
--10.1. với mỗi mon học cho biết bao nhiêu sinh viên đã học môn đó
SELECT K1.MaMH, K1.TenMH, COUNT(K2.MaSV) AS SOLUONG
FROM DMMH K1 JOIN KETQUA K2 ON K1.MaMH=K2.MaMH
GROUP BY K1.MaMH, K1.TenMH 
--10.2. Với mỗi khoa, cho biết có bao nhiêu sinh viên
SELECT TenKhoa, K3.MaKhoa, COUNT(K1.MaSV) AS SOLUONG
FROM DMSV K1 JOIN DMKHOA K3 ON K1.MaKH=K3.MaKhoa
GROUP BY TenKhoa, K3.MaKhoa
--10.3. VỚI MỖI SINH VIÊN, CHO BIẾT ĐÃ HỌC BAO NHIÊU MÔN
SELECT K1.MaSV, HoSV+' '+TenSV AS HOTEN, COUNT(MaMH) AS SOLUONG
FROM DMSV K1 JOIN KETQUA K2 ON K1.MaSV=K2.MaSV
GROUP BY K1.MaSV, HoSV+' '+TenSV 
--11. THỰC HIỆN INSERT, UPDATE, DELETE
--11.1. TẠO MỘT BẢNG MỚI TÊN SinhVien_KetQua: GỒM MASV, HOSV, TENSV, SOMONHOC
--SAU ĐÓ THÊM DỮ LIỆU VÀO BẢNG NÀY DỰA VÀO DỮ LIỆU ĐÃ CÓ
CREATE TABLE SinhVien_KetQua
(MASV NCHAR(3) NOT NULL,
HOSV NVARCHAR(30),
TENSV NVARCHAR(30),
SOMONHOC tinyint
constraint PK_SinhVien_KetQua primary key (MASV),)
INSERT INTO SinhVien_KetQua(MASV, HOSV, TENSV, SOMONHOC)
SELECT K1.MaSV, HoSV, TenSV, COUNT(DISTINCT MaMH)
FROM DMSV K1, KETQUA K2
WHERE K1.MaSV=K2.MaSV
GROUP BY K1.MaSV, HoSV, TenSV
--11.2. Thêm vào bảng KHoa cột Siso, lần lượt cập nhật sỉ số vào khoa từ dữ liếu sinh viên
ALTER TABLE DMKHOA 
ADD SISO INT;
UPDATE DMKHOA
SET SISO=(SELECT COUNT(*)
FROM DMSV 
WHERE MaKhoa='TH')
WHERE MaKhoa='TH'
UPDATE DMKHOA
SET SISO=(SELECT COUNT(*)
FROM DMSV 
WHERE MaKhoa='TR')
WHERE MaKhoa='TR'
UPDATE DMKHOA
SET SISO=(SELECT COUNT(*)
FROM DMSV 
WHERE MaKhoa='VL')
WHERE MaKhoa='VL'
UPDATE DMKHOA
SET SISO=(SELECT COUNT(*)
FROM DMSV 
WHERE MaKhoa='AV')
WHERE MaKhoa='AV'
--11.3. Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1
UPDATE DMSV
SET HocBong=0
WHERE MaSV IN(
SELECT MaSV
FROM KETQUA
WHERE LanThi=1
AND Diem<5
GROUP BY MaSV
HAVING COUNT(DISTINCT MaMH)>=2
)
--11.4. Tăng thêm 1 điểm cho các sinh viên rớt lần 2
--Nhưng chỉ tăng tối đa 5 điểm
UPDATE KETQUA
SET Diem=Diem+1
WHERE MaSV IN(
SELECT MaSV
FROM KETQUA
WHERE LanThi=2
AND Diem<5
GROUP BY MaSV)
SELECT *FROM DMMH
SELECT *FROM KETQUA

--11.5. Tắng học bổng đến 1000000 cho những sinh viên có
--điểm trung bình lần 1 trên 7 và không có điểm nào dưới 5
UPDATE DMSV
SET HocBong=1000000
WHERE MaSV IN (
SELECT MaSV
FROM KETQUA
WHERE LanThi=1
AND 5<= ALL(
SELECT Diem 
FROM KETQUA)
GROUP BY MaSV
HAVING AVG(Diem)>7 )

--11.6. Xóa tất cả sinh viên không dự thi môn nào
DELETE FROM DMSV
WHERE MaSV NOT IN (SELECT DISTINCT MaSV FROM KETQUA)
--11.7. XÓa những môn mà không có sinh viên học
DELETE FROM DMMH
WHERE MaMH NOT IN (SELECT DISTINCT MaMH FROM KETQUA)
--------------------
--12. TẠO VIEW
--12.1. Danh sách sinh viên thuộc khoa AV
CREATE VIEW V_CAU1
AS
SELECT *
FROM DMSV
WHERE MaKH='AV'
WITH CHECK OPTION
--Thêm một sinh viên mới vào câu 1, kiểm tra kết quả trong view và table
--Thêm một sinh viên mới
set dateformat dmy
INSERT INTO DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
VALUES('A05', N'Lý Anh', N'Hào', 0, '29/01/1998', N'Điện Biên', 'AV', 150000)
SELECT *FROM DMSV
SELECT *FROM V_CAU3
-->THÔNG TIN SINH VIÊN MỚI ĐÃ ĐƯỢC CẬP NHẬT VÀO V_CAU1
--12.2. Danh sách sinh viên không bị rớt môn nào
CREATE VIEW V_CAU2
AS
SELECT *
FROM DMSV
WHERE MaSV IN (
SELECT MaSV
FROM KETQUA
GROUP BY MaSV
HAVING MIN(Diem)<=5)
--12.3. Danh sách sinh viên vừa học môn văn phạm vừa học môn cơ sở dữ liệu
CREATE VIEW V_CAU3
AS
SELECT k1.MaSV,HoSV, TenSV
FROM DMSV K1, KETQUA K2, DMMH K3
WHERE K1.MaSV=K2.MaSV
AND K2.MaMH=K3.MaMH
AND TenMH=N'Cơ sở dữ liệu'
AND TenMH=N'Văn phạm'
--12.4. Trong mỗi sinh viên cho biết môn có điểm thi lớn nhất.
--mã sv, họ tên, tên môn, điểm
CREATE VIEW V_CAU4
AS
SELECT K2.MaSV, K2.HoSV+' '+K2.TenSV AS HOTENSV, TenMH, Diem
FROM KETQUA K1 
JOIN DMSV K2 ON K1.MaSV=K2.MaSV
JOIN DMMH K3 ON K1.MaMH=K3.MaMH
AND K1.Diem = (
SELECT MAX(Diem)
FROM KETQUA K4
WHERE K4.MaSV=K1.MaSV)
				
GROUP BY K2.MaSV, K2.HoSV+' '+K2.TenSV, TenMH, Diem
--12.5. Danh sách sinh những khoa có 2 sinh viên nữa trở lên
CREATE VIEW V_CAU5
AS
SELECT K1.MaKhoa, K1.TenKhoa, COUNT(MaSV) AS SLSVNU
FROM DMKHOA K1
JOIN DMSV K2 ON K1.MaKhoa=K2.MaKH
WHERE Phai=1
GROUP BY K1.MaKhoa, K1.TenKhoa
HAVING COUNT(MaSV) >=2
--12.6. Danh sách sinh viên
--KHông rớt lần 1
--HOặc ko học môn văn phạm
CREATE VIEW V_CAU6
AS
SELECT DISTINCT SV.MaSV, SV.HoSV, SV.TenSV
FROM DMSV SV
JOIN KETQUA KQ ON SV.MaSV = KQ.MaSV
WHERE KQ.Diem >= 5 
   OR KQ.MaMH NOT IN (SELECT MaMH FROM DMMH WHERE TenMH = 'Văn Phạm');



