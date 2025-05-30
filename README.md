
Bài tập 2. Quản lý đề án công ty
NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
DIADIEM_PHG(MAPHG, DIADIEM)
THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
DEAN(TENDA, MADA, DDIEM_DA, PHONG)
PHANCONG(MA_NVIEN, SODA, THOIGIAN)
Yêu cầu: Định nghĩa các quan hệ, tạo ràng buộc khóa chính, khóa ngoại, nhập liệu
đúng ràng buộc và thực hiện những câu sau đây
1. Danh sách những đề án có:
o Người tham gia có họ “Dinh”
o Có người trưởng phòng chủ trì đề án họ “Dinh”
2. Cho biết những nhân viên có cùng tên với người thân.
3. Cho biết những nhân viên không có người thân nào.
4. Cho biết danh sách những nhân viên có 2 thân nhân trở lên.
5. Cho biết những trưởng phòng có tối thiểu 1 thân nhân.
6. Cho biết những trưởng phòng có mức lương ít hơn (ít nhất một) nhân viên của mình.
7. Cho biết tên phòng, số lượng nhân viên và tổng lương của từng phòng.
8. Cho biết mã nhân viên (MA_NVIEN) nào có nhiều thân nhân nhất.
9. Với mỗi nhân viên, cho biết họ tên nhân viên và số thân nhân của nhân viên.
10. Cho biết lương trung bình của tất các nhân viên nữ.
11. Cho biết tên của các nhân viên và tên các phòng ban mà họ phụ trách nếu có.
12. Cho biết họ tên nhân viên và tên các đề án mà nhân viên đó tham gia.
13. Cho biết họ tên trưởng phòng của phòng có đông nhân viên nhất.
14. Ứng với mỗi phòng cho biết họ, tên nhân viên có mức lương CAO nhất.
15. Cho biết nhân viên tham gia tất cả các đề án.
16. Cho phép nhân viên làm việc cho tất cả các đề án mà phònng số 5 chủ trì.
17. Cho biết những nhân viên tham gia tất cả đề án mà có nhân viên ‘987654321’ tham gia
Bài tập 3. Cơ sở dữ liệu Hàng Không
CHUYENBAY(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi)
CHUYENBAY: Mỗi chuyến bay có một mã số duy nhất, đường bay, giờ đi, giờ đến. Thông tin
đường bay được mô tả bởi ga đi, ga đến, độ dài đường bay và chi phí trả cho phi công.
MAYBAY(MaMB, Loai, TamBay)
MAYBAY: Mỗi máy bay có một mã số duy nhất, tên phân loại và tầm bay là khoảng cách xa
nhất mà máy bay có thể bay mà không cần tiếp nhiên liệu. Mỗi máy bay chỉ có thể thực hiện
các chuyến bay có độ dài đường bay nhỏ hơn tầm bay của máy bay đó.
NHANVIEN(MaNV, Ten, Luong)
NHANVIEN: thông tin về nhân viên và phi hành đoàn gồm phi công và tiếp viên. Mỗi nhân
viên có một mã số duy nhấy, tên và lương.
CHUNGNHAN(MaNV, MaMB)
CHUNGNHAN: mô tả thông tin về khả năng điều khiển máy bay của phi công. Nếu nhân viên
là phi công thì nhân viên đó có chứng chỉ chứng nhận có thể lái một loại máy bay nào đó. Một
phi công có thể lái một chuyến bay nếu như phi công đó được chứng nhận có khả năng lái loại
máy bay có thể thực hiện chuyến bay đó
Yêu cầu : Viết SQL để thực hiện cá yêu cầu sau :
1. Cho biết các chuyến bay xuất phát từ Sài Gòn (SGN) đi Buôn Mê Thuộc (BMV)
2. Có bao nhiêu chuyến bay xuất phát từ Sài Gòn (SGN).
3. Cho biết tổng số lương phải trả cho các nhân viên.
4. Cho biết các nhân viên có thể lái máy bay có mã 747.
5. Cho biết các chuyến bay có thể thực hiện bới máy bay Airbus A320.
6. Cho biết các phi công vừa lái được máy bay Boeing vừa lái được Airbus.
7. Cho biết các loại máy bay có thể thực hiện chuyến bay VN280.
8. Với mỗi loại máy bay có phi công lái cho biết mã số, loại máy bay và tổng số phi công
có thể lái máy bay đó.
9. Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay về ga A. Cho biết các
đường bay nào có thể đáp ứng yêu cầu này.
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
có tthể lái.
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
đều có lương lớn hơn 100,000.
   
