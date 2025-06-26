USE  MASTER
CREATE DATABASE HKHONG
USE HKHONG
GO 

CREATE TABLE CHUYENBAY(
MACB NCHAR(5) NOT NULL,
GADI NCHAR(5), 
GADEN NCHAR(5),
DODAI INT,
GIODI TIME(0),
GIODEN TIME(0),
CHIPHI INT,
CONSTRAINT PK_CB PRIMARY KEY(MACB))

CREATE TABLE MAYBAY(
MAMB NCHAR(3) NOT NULL,
LOAI NCHAR(20),
TAMBAY INT,
CONSTRAINT PK_MB PRIMARY KEY(MAMB))

CREATE TABLE NHANVIEN(
MANV NCHAR(9) NOT NULL,
TEN NVARCHAR(30),
LUONG INT,
CONSTRAINT PK_NV PRIMARY KEY(MANV))

CREATE TABLE CHUNGNHAN(
MANV NCHAR(9) NOT NULL,
MAMB NCHAR(3) NOT NULL,
CONSTRAINT PK_CN PRIMARY KEY(MANV, MAMB),
CONSTRAINT FK_CN_MB FOREIGN KEY(MAMB) REFERENCES MAYBAY(MAMB),
CONSTRAINT FK_CN_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV))

INSERT INTO CHUYENBAY 
VALUES('VN431','SGN', 'CAH', 3693,'05:55','06:55', 236),
('VN320','SGN', 'DAD', 2798,'06:00','07:10', 221 ),
('VN464','SGN', 'DLI', 2022,'07:20','08:05', 255),
('VN216','SGN', 'DIN', 4170,'10:30','14:20', 262 ),
('VN280','SGN', 'PHP', 11979,'06:00','08:00', 1279),
('VN254','SGN', 'HUI', 8765,'18:40','20:00', 781 ),
('VN338','SGN', 'BMV', 4081,'15:25','16:25', 375),
('VN440','SGN', 'BMV', 4081,'18:30','19:30', 426 ),
('VN651','DAD', 'SGN', 2798,'19:30','08:00', 221),
('VN276','DAD', 'CXR', 1283,'09:00','12:00', 203 ),
('VN374','HAN', 'VII', 510,'11:40','13:25', 120),
('VN375','VII', 'CXR', 752,'14:15','16:00', 181 ),
('VN269','HAN', 'CXR', 1262,'14:10','15:50', 202),
('VN315','HAN', 'DAD', 134,'11:45','13:00', 112 ),
('VN317','HAN', 'UIH', 827,'15:00','15:15', 190),
('VN741','HAN', 'PXU', 395,'06:30','08:30', 120 ),
('VN474','PXU', 'PQC', 1586,'08:40','11:20', 102)

INSERT INTO MAYBAY VALUES
('747', 'Boeing 747 - 400', 13488),
('737', 'Boeing 737 - 800', 5413),
('340', 'Airbus A340 - 300', 11392),
('757', 'Boeing 757 - 300', 6416),
('777', 'Boeing 777 - 300', 10306),
('767', 'Boeing 767 - 400ER', 10360),
('320', 'Airbus A320', 4168),
('319', 'Airbus A319', 2888),
('727', 'Boeing 727', 2406),
('154', 'Tupolev 154', 6565)

INSERT INTO NHANVIEN VALUES
('242518965', N'TRẦN VĂN SƠN', 120433),
('141582651', N'ĐOÀN THỊ MAI', 178345),
('011564812', N'TÔN VĂN QUÝ', 153972),
('567354612', N'QUÁN CẨM LY', 256481),
('552455318', N'LÃ QUẾ', 101745),
('550156548', N'NGUYỄN THỊ CẨM', 205187),
('390487451', N'LÊ VĂN LUẬT', 212156),
('274878974', N'MAI QUỐC MINH', 99890),
('254099823', N'NGUYỄN THỊ QUỲNH', 24450),
('356187925', N'NGUYỄN VINH BẢO', 44740),
('355548984', N'TRẦN THỊ HOÀI AN', 212156),
('310454876', N'TẠ VĂN ĐÔ', 212156),
('489456522', N'NGUYỄN THỊ QUÝ LINH', 127984),
('489221823', N'BUI QUỐC CHÍNH', 23980),
('548977562', N'LÊ VĂN QUÝ', 84476),
('310454877', N'TRẦN VĂN HÀO', 33546),
('142519864', N'NGUYỄN THỊ XUÂN ĐÀO', 227489),
('287321212', N'DƯƠNG VĂN MINH', 48090),
('552455348', N'BÙI THỊ DUNG', 92013),
('248965255', N'TRẦN THI BÁ', 43723),
('159542516', N'LÊ VĂN KỲ', 48250),
('348121549', N'NGUYỄN VĂN THANH', 32899),
('574489457', N'BÙI VĂN LẬP', 20)

INSERT INTO CHUNGNHAN VALUES
('567354612','747'),
('567354612','737'),
('567354612','757'),
('567354612','777'),
('567354612','767'),
('567354612','727'),
('567354612','340'),
('552455318','737'),
('552455318','319'),
('552455318','747'),
('552455318','767'),
('390487451','340'),
('390487451','320'),
('390487451','319'),
('274878974','757'),
('274878974','767'),
('355548984','154'),
('142519864','747'),
('142519864','757'),
('142519864','777'),
('142519864','767'),
('142519864','737'),
('142519864','340'),
('142519864','320'),
('159542516','747'),
('159542516','737'),
('159542516','340'),
('159542516','757'),
('159542516','777'),
('159542516','767'),
('159542516','320'),
('159542516','319'),
('159542516','727'),
('159542516','154'),
('242518965','737'),
('242518965','757'),
('141582651','737'),
('141582651','757'),
('141582651','767'),
('011564812','737'),
('011564812','757'),
('574489457','154')

/*DROP DATABASE HKHONG
DROP TABLE CHUNGNHAN
DROP TABLE MAYBAY
DROP TABLE NHANVIEN
DROP TABLE CHUYENBAY*/
/*
--Yêu cầu: Thực hiện các yêu cầu sau:
1. Cho biết các chuyến bay xuất phát từ SG(SGN) đi Buôn Mê Thuộc (BMV)
2. Có bao nhiêu chuyến bay xuất phát từ SG
3. Cho biết tổng số lương phải trả cho các nhân viên
4. Cho biết các nhân viên có thể lái máy bay mã 747
5. Cho biết các chuyến bay có thể thực hiện bởi máy bay Airbus A320
6. Cho biết các phi công vừa lái được máy bay Boeing vừa lái được Airbus
7. Cho biết các loại máy bay có thể thực hiện chuyến bay VN280.
8. Với mỗi loại máy bay có phi công lái cho biết mã số, loại máy bay và tổng số phi công 
có thể lái máy bay đó.
9. Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay về ga A. Cho biết các đường
bay nào có thể đáp ứng yêu cầu này.
10.Với mỗi địa điểm xuất phát cho biết bao nhiêu chuyến bay khởi hành trước 12 :00.
11.Cho biết những phi công lái 1được 3 lại máy bay.
12.Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, cho biết mã phi công và tầm bay
lớn nhất của các loại máy bay mà phi công đó có thể lái.
13.Cho biết những phi công có thể lái nhiều loại máy bay nhất.
14.Cho biết những phi công có thể lái ít loại máy bay nhất.
15.Cho biết những nhân viên không phải là phi công.
16.Cho biết những phi công có lương cao nhất.
17.Cho biết những tiếp viên có lương cao nhì.
18.Cho biết tổng số lương phải trả cho các phi công.
19.Tìm các chuyến bay có thể thực hiện bởi các loại máy bay Boeing.
20.Cho biết các máy bay có thể được sử dụng để thực hiện chuyến bay từ Sài Gòn (GSN)
đến Huế (HUI)
21.Tìm các chuyến bay có thể lái bởi các phi công có lương lớn hơn 100,000.
22.Cho biết các phi công có lương nhỏ hơn chi phí thấp nhất của đường bay từ Sài Gòn
(SGN) đến Buôn Mê Thuộc (BMV).
23.Cho biết những nhân viên có lương cao thứ nhất hoặc thứ nhì.
24.Cho biết tên và lương của của các nhân viên không phải là phi công có lương lớn hơn
trung bình của tất cả các phi công.
25.Cho biết tên các phi công có thể lái máy bay có tầm bay lớn hơn 4800km nhưng không
có chứng nhận máy bay Boeing.
26.Cho biết những phi công lái ít nhất 3 loại máy bay có tầm bay xa hơn 3200km.
27.Với mỗi phi công cho biết mã số, tên nhân viên và tổng số loại máy bay mà phi công đó
có thể lái.
28.Với mỗi phi công cho biết mã số, tên và tổng số loại máy bay Boeing mà phi công đó có
thể lái.
29.Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công có thể lái loại máy bay
đó.
30.Với mỗi loại máy bay cho biết loại máy bay và tổng số chuyến bay không thể thực hiện
bởi loại máy bay đó.
31.Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương
trung bình của các phi công có thể lái loại máy bay đó.
32.Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công không lái loại máy bay
đó.
33.Với mỗi nhân viên có biết mã số, tên nhân viên và tổng số chuyến bay xuất phát từ Sài
gòn mà nhân viên đó có thể lái.
34.Với mỗi phi công cho biết mã số, tên phi công và tổng số chuyến bay xuất phát từ Sài
gòn mà nhân viên đó có thể lái.
35.Với với chuyến bay cho biết mã số chuyến bay và tổng số loại máy bay có thể thực hiện
chuyến bay đó.
36.Với với chuyến bay cho biết mã số chuyến bay và tổng số loại máy bay không thể thực
hiện chuyến bay đó.
37.Cho biết tên các loại máy bay mà tất cả các phi công có thể lái đều có lương lớn hơn
200,000.
38.Tìm các phi công có thể lái tất cả các loại máy bay.
39.Tìm các phi công có thể lái tất cả các loại máy bay Boeing.
40.Cho biết thông tin các đường bay mà tất cả các phi công có thể bay trên đường bay đó
đều có lương lớn hơn 100,000
*/


--1. Cho biết các chuyến bay xuất phát từ SG(SGN) đi Buôn Mê Thuộc (BMV)
SELECT *
FROM CHUYENBAY
WHERE GADI='SGN' AND GADEN='BMV'

--2. Có bao nhiêu chuyến bay xuất phát từ SG
SELECT GADI, COUNT(MACB) AS SOLUONGCB
FROM CHUYENBAY
WHERE GADI='SGN'
GROUP BY GADI

--3. Cho biết tổng số lương phải trả cho các nhân viên
SELECT SUM(LUONG)AS TONGLUONG
FROM NHANVIEN

--4. Cho biết các nhân viên có thể lái máy bay mã 747
SELECT K1.*, K2.MAMB
FROM NHANVIEN K1
JOIN CHUNGNHAN K2 ON K1.MANV=K2.MANV
WHERE K2.MAMB='747'

--5. Cho biết các chuyến bay có thể thực hiện bởi máy bay Airbus A320
--Phân tích: Vì Mỗi máy bay chỉ có thể thực hiện các chuyến bay có ĐỘ DÀI đường bay nhỏ hơn TẦM BAY của máy bay đó. 
--> LẤY RA NHỮNG CHUYẾN BAY (BẢNG CHUYENBAY) CÓ ĐỘ DÀI ĐƯỜNG BAY < TẦM BAY CỦA MÁY BAY AIRBUS A320 (BẢNG MAYBAY)
SELECT K1.*
FROM CHUYENBAY K1, MAYBAY K2
WHERE K2.LOAI = 'Airbus A320' AND K1.DODAI<K2.TAMBAY 
--HOẶC
SELECT K1.*
FROM CHUYENBAY K1
JOIN MAYBAY K2 ON K1.DODAI<K2.TAMBAY 
WHERE K2.LOAI = 'Airbus A320'  

--6. Cho biết các phi công vừa lái được máy bay Boeing vừa lái được Airbus
SELECT *
FROM NHANVIEN
WHERE MANV IN (
	SELECT MANV
	FROM CHUNGNHAN K1
	JOIN MAYBAY K2 ON K1.MAMB=K2.MAMB
	WHERE K2.LOAI LIKE '%Boeing%'
	INTERSECT
	SELECT MANV
	FROM CHUNGNHAN K3
	JOIN MAYBAY K4 ON K3.MAMB=K4.MAMB
	WHERE K4.LOAI LIKE '%Airbus%')

--7. Cho biết các loại máy bay có thể thực hiện chuyến bay VN280.
SELECT K1.*
FROM MAYBAY K1
JOIN CHUYENBAY K2 ON K1.TAMBAY>K2.DODAI
WHERE MACB='VN280'

--8. Với mỗi loại máy bay có phi công lái cho biết mã số, loại máy bay và tổng số phi công 
--có thể lái máy bay đó.
SELECT K1.MAMB, K1.LOAI, COUNT(DISTINCT K2.MANV) AS TONGSOPHICONG
FROM MAYBAY K1
JOIN CHUNGNHAN K2 ON K1.MAMB=K2.MAMB
GROUP BY K1.MAMB, K1.LOAI

--9. Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay về ga A. Cho biết các đường
--bay nào có thể đáp ứng yêu cầu này.
SELECT *
FROM CHUYENBAY K1, CHUYENBAY K2
WHERE K1.GADEN=K2.GADI AND K1.GADI=K2.GADEN AND (K1.GIODEN<K2.GIODI OR K2.GIODEN<K1.GIODI)

--10. Với mỗi địa điểm xuất phát cho biết bao nhiêu chuyến bay khởi hành trước 12 :00.
--Làm như bth:
SELECT GADI, COUNT(MACB) AS SOCBTRUOC12H
FROM CHUYENBAY
WHERE GIODI<'12:00'
GROUP BY GADI
--Nhưng cách này chỉ cho ra kết quả của những điểm có cb thõa đk, các địa điểm không có cb thỏa đk sẽ không xuất hiện
--Làm cách khác:
SELECT GD.GADI, COUNT(MACB) AS SOCBTRUOC12H
FROM 
(SELECT DISTINCT GADI FROM CHUYENBAY) AS GD
--GD(Gadi) là bảng phụ lấy tất cả địa điểm xuất phát để đảm bảo mọi địa điểm đều có mặt trong kq
LEFT JOIN 
    CHUYENBAY CB ON GD.GaDi = CB.GaDi AND CB.GioDi < '12:00'
--LEFT JOIN để giữ lại những địa điểm không có cb thỏa đk
GROUP BY GD.GADI

--11.Cho biết những phi công lái được 3 lại máy bay.
SELECT K1.MANV, K1.TEN, COUNT(K2.MAMB) AS SOLOAI
FROM NHANVIEN K1
JOIN CHUNGNHAN K2 ON K1.MANV=K2.MANV
GROUP BY K1.MANV, K1.TEN
HAVING COUNT(K2.MAMB)=3
--12.Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, cho biết mã phi công và tầm bay lớn nhất của các loại máy bay mà phi công đó có thể lái.
SELECT K5.MANV, MAX(TAMBAY) AS TAMBAYLONNHAT
FROM CHUNGNHAN K5
JOIN MAYBAY K6 ON K5.MAMB=K6.MAMB
GROUP BY K5.MANV
HAVING COUNT(K6.MAMB)>3

--13.Cho biết những phi công có thể lái nhiều loại máy bay nhất.
WITH SOLOAI AS(
	SELECT MANV, COUNT(DISTINCT MAMB) AS SOLOAIMB
	FROM CHUNGNHAN
	GROUP BY MANV)
SELECT K1.MANV, K1.TEN, K2.SOLOAIMB
FROM SOLOAI K2
JOIN NHANVIEN K1 ON K1.MANV=K2.MANV
WHERE K2.SOLOAIMB
	= (SELECT MAX(SOLOAI.SOLOAIMB)
	FROM SOLOAI)

--14.Cho biết những phi công có thể lái ít loại máy bay nhất.
WITH SOLOAI AS(
	SELECT MANV, COUNT(DISTINCT MAMB) AS SOLOAIMB
	FROM CHUNGNHAN
	GROUP BY MANV)
SELECT K1.MANV, K1.TEN, K2.SOLOAIMB
FROM SOLOAI K2
JOIN NHANVIEN K1 ON K1.MANV=K2.MANV
WHERE K2.SOLOAIMB
	= (SELECT MIN(SOLOAI.SOLOAIMB)
	FROM SOLOAI)

--15.Cho biết những nhân viên không phải là phi công.
SELECT *
FROM NHANVIEN K1
WHERE K1.MANV NOT IN(
		SELECT K4.MANV
		FROM CHUNGNHAN K3
		JOIN NHANVIEN K4 ON K3.MANV=K4.MANV)
--16.Cho biết những phi công có lương cao nhất.

SELECT K1.MANV, K1.TEN, K1.LUONG
FROM NHANVIEN K1
WHERE K1.MANV IN(
		SELECT DISTINCT K3.MANV
		FROM CHUNGNHAN K3
		)
		AND K1.LUONG=(SELECT MAX(LUONG) FROM NHANVIEN K4 JOIN CHUNGNHAN K5 ON K4.MANV=K5.MANV)
GROUP BY K1.MANV, K1.TEN, K1.LUONG

--17.Cho biết những tiếp viên có lương cao nhì.

SELECT K1.MANV, K1.TEN, K1.LUONG
FROM NHANVIEN K1 
WHERE K1.MANV NOT IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
AND LUONG = (
SELECT MAX(LUONG)
FROM NHANVIEN K2
WHERE K2.MANV NOT IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
AND LUONG < (
	SELECT MAX(LUONG) FROM NHANVIEN K3
	WHERE K3.MANV NOT IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
	)
)

--18.Cho biết tổng số lương phải trả cho các phi công.
SELECT SUM(LUONG) AS TONGLUONG
FROM NHANVIEN K1 
WHERE K1.MANV IN (
	SELECT DISTINCT MANV FROM CHUNGNHAN)

--19.Tìm các chuyến bay có thể thực hiện bởi các loại máy bay Boeing.
SELECT K1.*
FROM CHUYENBAY K1
WHERE K1.MACB IN (SELECT K2.MACB FROM CHUYENBAY K2
				JOIN MAYBAY K3 ON K2.DODAI<K3.TAMBAY
				WHERE K3.LOAI LIKE '%Boeing%')
--20.Cho biết các máy bay có thể được sử dụng để thực hiện chuyến bay từ Sài Gòn (SGN) đến Huế (HUI)
SELECT K1.*
FROM MAYBAY K1
JOIN CHUYENBAY K2 ON K1.TAMBAY>K2.DODAI
WHERE K2.GADI='SGN' AND K2.GADEN='HUI'

--21.Tìm các chuyến bay có thể lái bởi các phi công có lương lớn hơn 100,000.
SELECT DISTINCT K1.*
FROM CHUYENBAY K1
JOIN MAYBAY K2 ON K1.DODAI<K2.TAMBAY
WHERE K2.MAMB IN (
				SELECT DISTINCT K2.MAMB
				FROM CHUNGNHAN K2 JOIN NHANVIEN K3 ON K2.MANV=K3.MANV
				WHERE K3.LUONG>100000)

--22.Cho biết các phi công có lương nhỏ hơn chi phí thấp nhất của đường bay từ Sài Gòn (SGN) đến Buôn Mê Thuộc (BMV).
SELECT K1.*
FROM NHANVIEN K1
WHERE K1.MANV IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
AND K1.LUONG<(
			SELECT MIN(K.CHIPHI)
			FROM CHUYENBAY K 
			WHERE K.GADI='SGN' AND K.GADEN='BMV')

--23.Cho biết những nhân viên có lương cao thứ nhất hoặc thứ nhì.
SELECT *
FROM NHANVIEN
WHERE LUONG IN (SELECT DISTINCT TOP 2 LUONG
				FROM NHANVIEN
				ORDER BY LUONG DESC)

--24.Cho biết tên và lương của của các nhân viên không phải là phi công có lương lớn hơn
--trung bình của tất cả các phi công.
SELECT K1.TEN, K1.LUONG
FROM NHANVIEN K1
WHERE K1.MANV NOT IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
AND K1.LUONG > (
				SELECT AVG(K.LUONG) AS LUONGTB
				FROM NHANVIEN K
				WHERE K.MANV IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
)

--25.Cho biết tên các phi công có thể lái máy bay có tầm bay lớn hơn 4800km nhưng không
--có chứng nhận máy bay Boeing.
SELECT DISTINCT K1.TEN
FROM NHANVIEN K1 
JOIN CHUNGNHAN K2 ON K1.MANV=K2.MANV
JOIN MAYBAY K3 ON K2.MAMB=K3.MAMB
WHERE K3.TAMBAY>4800
AND K3.LOAI NOT LIKE '%Boeing%'

--26.Cho biết những phi công lái ít nhất 3 loại máy bay có tầm bay xa hơn 3200km.
SELECT K3.MANV, K3.TEN, K3.LUONG
FROM CHUNGNHAN K1
JOIN MAYBAY K2 ON K1.MAMB=K2.MAMB
JOIN NHANVIEN K3 ON K1.MANV=K3.MANV
WHERE K2.TAMBAY>3200
GROUP BY K3.MANV, K3.TEN, K3.LUONG
HAVING COUNT(DISTINCT K1.MAMB)>=3

--27.Với mỗi phi công cho biết mã số, tên nhân viên và tổng số loại máy bay mà phi công đó
--có tthể lái.
SELECT K3.MANV, K3.TEN, COUNT(DISTINCT K1.MAMB) AS TONGSOLOAI
FROM CHUNGNHAN K1
JOIN MAYBAY K2 ON K1.MAMB=K2.MAMB
JOIN NHANVIEN K3 ON K1.MANV=K3.MANV
WHERE K3.MANV IN (SELECT DISTINCT MANV FROM CHUNGNHAN)
GROUP BY K3.MANV, K3.TEN

--28.Với mỗi phi công cho biết mã số, tên và tổng số loại máy bay Boeing mà phi công đó có
--thể lái.
SELECT K3.MANV, K3.TEN, COUNT(DISTINCT K1.MAMB) AS TONGSOLOAI
FROM CHUNGNHAN K1
JOIN MAYBAY K2 ON K1.MAMB=K2.MAMB
JOIN NHANVIEN K3 ON K1.MANV=K3.MANV
WHERE K3.MANV IN (SELECT DISTINCT MANV FROM CHUNGNHAN) AND K2.LOAI LIKE '%Boeing%'
GROUP BY K3.MANV, K3.TEN

--29.Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công có thể lái loại máy bay đó.
SELECT K2.LOAI, COUNT(K1.MANV) AS TONGSOPC
FROM CHUNGNHAN K1
JOIN MAYBAY K2 ON K1.MAMB=K2.MAMB
JOIN NHANVIEN K3 ON K1.MANV=K3.MANV
GROUP BY K2.LOAI

--30.Với mỗi loại máy bay cho biết loại máy bay và tổng số chuyến bay không thể thực hiện
--bởi loại máy bay đó.
SELECT K1.LOAI, COUNT(K2.MACB) AS SOCBKHONGTH
FROM MAYBAY K1
JOIN CHUYENBAY K2 ON K1.TAMBAY<K2.DODAI
GROUP BY K1.LOAI

--31.Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương
--trung bình của các phi công có thể lái loại máy bay đó.
SELECT K3.LOAI, AVG(K1.LUONG) AS LUONGTB
FROM NHANVIEN K1
JOIN CHUNGNHAN K2 ON K1.MANV=K2.MANV
JOIN MAYBAY K3 ON K2.MAMB=K3.MAMB
WHERE TAMBAY>3200
GROUP BY K3.LOAI

--32.Với mỗi loại máy bay cho biết loại máy bay và tổng số phi công không lái loại máy bay đó.
SELECT K1.LOAI, COUNT(DISTINCT K2.MANV) AS PCKHONGLAI
FROM MAYBAY K1
JOIN NHANVIEN K2 ON EXISTS (
SELECT 1 FROM CHUNGNHAN K3 WHERE K2.MANV=K3.MANV)
WHERE NOT EXISTS (
SELECT 1 FROM CHUNGNHAN K4 
WHERE K4.MAMB=K1.MAMB AND K4.MANV=K2.MANV)
GROUP BY K1.LOAI

--33.Với mỗi nhân viên có biết mã số, tên nhân viên và tổng số chuyến bay xuất phát từ Sài
--Gòn mà nhân viên đó có thể lái.

SELECT K1.MANV, K1.TEN, COUNT(DISTINCT K4.MACB) AS CBTUSG
FROM NHANVIEN K1
JOIN CHUNGNHAN K2 ON K1.MANV=K2.MANV
JOIN MAYBAY K3 ON K2.MAMB=K3.MAMB
JOIN CHUYENBAY K4 ON k4.DODAI<k3.TAMBAY
WHERE K4.GADI = 'SGN'
GROUP BY K1.MANV, K1.TEN

--35.Với với chuyến bay cho biết mã số chuyến bay và tổng số loại máy bay có thể thực hiện chuyến bay đó.
SELECT K1.MACB, COUNT(DISTINCT K2.LOAI) AS SOLOAI
FROM CHUYENBAY K1
JOIN MAYBAY K2 ON K1.DODAI<K2.TAMBAY
GROUP BY K1.MACB

--36.Với mỗi chuyến bay cho biết mã số chuyến bay và tổng số loại máy bay không thể thực hiện chuyến bay đó.
SELECT K1.MACB, COUNT(DISTINCT K2.LOAI) AS SOLOAIMB_KHONGBAYDUOC
FROM CHUYENBAY K1
JOIN MAYBAY K2 ON K1.DODAI>K2.TAMBAY
GROUP BY K1.MACB

--37.Cho biết tên các loại máy bay mà tất cả các phi công có thể lái đều có lương lớn hơn 200,000.
SELECT K1.LOAI
FROM MAYBAY K1
WHERE NOT EXISTS (
SELECT 1 FROM CHUNGNHAN K2 JOIN NHANVIEN K3 ON K2.MANV=K3.MANV
WHERE K1.MAMB=K2.MAMB AND K3.LUONG<=200000)

--38.Tìm các phi công có thể lái tất cả các loại máy bay.
SELECT K1.*
FROM NHANVIEN K1
WHERE K1.MANV IN (
				SELECT K2.MANV
				FROM CHUNGNHAN K2 JOIN MAYBAY K3 ON K2.MAMB=K3.MAMB
				GROUP BY K2.MANV
				HAVING COUNT(DISTINCT K3.LOAI) =(
						SELECT COUNT(DISTINCT K4.LOAI) FROM MAYBAY K4))
--39.Tìm các phi công có thể lái tất cả các loại máy bay Boeing.
SELECT K1.*
FROM NHANVIEN K1
WHERE K1.MANV IN (
				SELECT K2.MANV
				FROM CHUNGNHAN K2 JOIN MAYBAY K3 ON K2.MAMB=K3.MAMB
				WHERE K3.LOAI LIKE '%Boeing%'
				GROUP BY K2.MANV
				HAVING COUNT(DISTINCT K3.LOAI) =(
						SELECT COUNT(DISTINCT K4.LOAI) FROM MAYBAY K4))

--40.Cho biết thông tin các đường bay mà tất cả các phi công có thể bay trên đường bay đó đều có lương lớn hơn 100,000
SELECT K1.*
FROM CHUYENBAY K1
WHERE NOT EXISTS (
    SELECT 1
    FROM CHUNGNHAN K2
    JOIN MAYBAY K3 ON K2.MaMB = K3.MaMB
    JOIN NHANVIEN K4 ON K4.MaNV = K2.MaNV
    WHERE K3.TAMBAY >= K1.DODAI
      AND K4.LUONG <= 100000
)
