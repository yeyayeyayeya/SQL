
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
17. Cho biết những nhân viên tham gia tất cả đề án mà có nhân viên ‘987654321’ tham
gia
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
