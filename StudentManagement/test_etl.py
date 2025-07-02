import pandas as pd
import pytest
from etl import transform, load
from unittest.mock import patch
import os

# 1️⃣ Test GPA calculation and classification
def test_transform_gpa_and_xeploai():
    dmsv = pd.DataFrame({
        'MaSV': ['001'],
        'HoSV': ['Nguyen'],
        'TenSV': ['An'],
        'Phai': [1],
        'NgaySinh': ['2000-01-01'],
        'NoiSinh': ['HN'],
        'MaKH': ['KH'],
        'HocBong': [0]
    })

    dmmh = pd.DataFrame({
        'MaMH': ['MH01'],
        'TenMH': ['Toan'],
        'SoTiet': [30]
    })

    ketqua = pd.DataFrame({
        'MaSV': ['001', '001'],
        'MaMH': ['MH01', 'MH01'],
        'LanThi': [1, 2],
        'Diem': [7.0, 9.0]
    })

    df = transform(dmsv, dmmh, ketqua)

    assert 'GPA' in df.columns
    assert 'XepLoai' in df.columns
    assert round(df['GPA'].iloc[0], 2) == 8.00
    assert df['XepLoai'].iloc[0] == 'Giỏi'

# 2️⃣ Test column order
def test_transform_column_order():
    df = pd.DataFrame(columns=['MaSV', 'HoTen', 'MaMH', 'TenMH', 'Diem', 'LanThi', 'GPA', 'XepLoai'])
    expected = ['MaSV', 'HoTen', 'MaMH', 'TenMH', 'Diem', 'LanThi', 'GPA', 'XepLoai']
    assert list(df.columns) == expected

# 3️⃣ Test missing 'Diem' column
def test_transform_missing_diem_column():
    dmsv = pd.DataFrame({'MaSV': ['001'], 'HoSV': ['Le'], 'TenSV': ['Linh'], 'Phai': [0], 'NgaySinh': ['2001-02-02'],
                         'NoiSinh': ['HCM'], 'MaKH': ['KH'], 'HocBong': [1000]})
    dmmh = pd.DataFrame({'MaMH': ['MH02'], 'TenMH': ['Ly'], 'SoTiet': [30]})
    ketqua = pd.DataFrame({'MaSV': ['001'], 'MaMH': ['MH02'], 'LanThi': [1]})  # No 'Diem'

    with pytest.raises(KeyError):
        transform(dmsv, dmmh, ketqua)

# 4️⃣ Test empty data input
def test_transform_empty_data():
    dmsv = pd.DataFrame(columns=['MaSV', 'HoSV', 'TenSV', 'Phai', 'NgaySinh', 'NoiSinh', 'MaKH', 'HocBong'])
    dmmh = pd.DataFrame(columns=['MaMH', 'TenMH', 'SoTiet'])
    ketqua = pd.DataFrame(columns=['MaSV', 'MaMH', 'LanThi', 'Diem'])

    df = transform(dmsv, dmmh, ketqua)

    assert df.empty
    assert list(df.columns) == ['MaSV', 'HoTen', 'MaMH', 'TenMH', 'Diem', 'LanThi', 'GPA', 'XepLoai']

# 5️⃣ Edge case: GPA thresholds
@pytest.mark.parametrize("score,expected", [
    (8.0, "Giỏi"),
    (6.5, "Khá"),
    (5.0, "Trung Bình"),
    (4.9, "Yếu")
])
def test_xeploai_logic(score, expected):
    dmsv = pd.DataFrame({'MaSV': ['001'], 'HoSV': ['Test'], 'TenSV': ['Case'], 'Phai': [1],
                         'NgaySinh': [''], 'NoiSinh': [''], 'MaKH': [''], 'HocBong': [0]})
    dmmh = pd.DataFrame({'MaMH': ['MH01'], 'TenMH': ['Test'], 'SoTiet': [1]})
    ketqua = pd.DataFrame({'MaSV': ['001'], 'MaMH': ['MH01'], 'LanThi': [1], 'Diem': [score]})

    df = transform(dmsv, dmmh, ketqua)
    assert df['XepLoai'].iloc[0] == expected

# 6️⃣ Test load(): writes CSV to path
def test_load_writes_csv(tmp_path):
    df = pd.DataFrame({
        'MaSV': ['001'],
        'HoTen': ['Nguyen An'],
        'MaMH': ['MH01'],
        'TenMH': ['Math'],
        'Diem': [9.0],
        'LanThi': [1],
        'GPA': [9.0],
        'XepLoai': ['Giỏi']
    })

    test_path = tmp_path / "output.csv"
    df.to_csv(test_path, index=False)

    assert test_path.exists()
    assert test_path.stat().st_size > 0

# 7️⃣ Test load(): mock to_sql
def test_load_calls_to_sql():
    df = pd.DataFrame({
        'MaSV': ['002'],
        'HoTen': ['Le Hoa'],
        'MaMH': ['MH02'],
        'TenMH': ['Physics'],
        'Diem': [7.5],
        'LanThi': [1],
        'GPA': [7.5],
        'XepLoai': ['Khá']
    })

    with patch("pandas.DataFrame.to_sql") as mock_to_sql:
        load(df)
        mock_to_sql.assert_called_once()
