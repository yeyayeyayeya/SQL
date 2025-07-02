import pytest 
import pandas as pd
from etl import transform
import os

def test_transform_data():
    dmsv = pd.DataFrame({
        'MaSV': ['001'],
        'HoSV': ['Nguyen Văn'],
        'TenSV': ['Anh'],
        'Phai': [1],
        'NgaySinh': ['2003-01-29'],
        'NoiSinh': ['Hồ Chí Minh'],
        'MaKH': ['01'],
        'HocBong': [500000]
    })
    dmmh = pd.DataFrame({
        'MaMH': ['MH01'],
        'TenMH': ['Toán'],
        'SoTiet': [45]
    })
    ketqua = pd.DataFrame({
        'MaSV': ['001'],
        'MaMH': ['MH01'],
        'LanThi': [1],
        'Diem': [8.5]
    })
    df = transform(dmsv, dmmh, ketqua)
    assert not df.empty
    assert 'GPA' in df.columns
    assert df.loc[0, 'XepLoai'] == 'Giỏi'

def test_Gioi():
    score = 8.0
    expected = "Giỏi"
    dmsv = pd.DataFrame({
        'MaSV': ['001'],
        'HoSV': ['Ngoc'],
        'TenSV': ['Hieu'],
        'Phai': ['1'],
        'NgaySinh': [''],
        'NoiSinh': [''],
        'MaKH': [''],
        'HocBong': [0]
    })
    dmmh = pd.DataFrame({
        'MaMH': ['MH01'],
        'TenMH': ['Toan'],
        'SoTiet': [3]
    })
    ketqua = pd.DataFrame({
        'MaSV': ['001'],
        'MaMH': ['MH01'],
        'LanThi': [1],
        'Diem': [8.5]
    })
    df=transform(dmsv, dmmh, ketqua)
    assert df['XepLoai'].iloc[0] == expected

def test_load(tmp_path):
    df = pd.DataFrame({
        'MaSV': ['001'],
        'HoTen': ['Ngoc Hieu'],
        'MaMH': ['MH01'],
        'TenMH': ['Toan'],
        'Diem': [8.5],
        'LanThi': [1],
        'GPA': [8.5],
        'XepLoai': ['Gioi']
    })
    test_path = tmp_path / "output.csv"
    df.to_csv(test_path, index=False)

    assert test_path.exists()
    assert test_path.stat().st_size > 0



