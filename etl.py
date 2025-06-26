import pandas as pd
import pyodbc
from sqlalchemy import create_engine
from config import SQL_SERVER_CONN_STR, POSTGRES_CONN_STR

# 1. Extract từ SQL Server
def extract():
    conn = pyodbc.connect(SQL_SERVER_CONN_STR)

    dmsv = pd.read_sql("SELECT * FROM DMSV", conn)
    dmmh = pd.read_sql("SELECT * FROM DMMH", conn)
    ketqua = pd.read_sql("SELECT * FROM KETQUA", conn)

    conn.close()

    print("📌 Cột dmmh:", dmmh.columns)
    print("📌 Cột dmsv:", dmsv.columns)
    print("📌 Cột ketqua:", ketqua.columns)

    return dmsv, dmmh, ketqua

# 2. Transform
def transform(dmsv, dmmh, ketqua):
    # Chuẩn hóa tên cột
    dmsv.columns = [col.strip().lower() for col in dmsv.columns]
    dmmh.columns = [col.strip().lower() for col in dmmh.columns]
    ketqua.columns = [col.strip().lower() for col in ketqua.columns]

    # Đổi tên chính xác
    dmsv = dmsv.rename(columns={'masv': 'MaSV', 'hosv': 'HoSV', 'tensv': 'TenSV'})
    dmmh = dmmh.rename(columns={'mamh': 'MaMH', 'tenmh': 'TenMH'})
    ketqua = ketqua.rename(columns={
    'masv': 'MaSV',
    'mamh': 'MaMH',
    'diem': 'Diem',
    'lanthi': 'LanThi'
})


    # Ghép họ tên sinh viên
    dmsv['HoTen'] = dmsv['HoSV'].str.strip().str.title() + ' ' + dmsv['TenSV'].str.strip().str.title()

    # Ensure Diem column is numeric to avoid errors on empty input
    ketqua['Diem'] = pd.to_numeric(ketqua['Diem'], errors='coerce')
    # Tính GPA
    gpa = ketqua.groupby('MaSV')['Diem'].mean().round(2).reset_index().rename(columns={'Diem': 'GPA'})

    def xeploai(gpa):
        if gpa >= 8: return 'Giỏi'
        elif gpa >= 6.5: return 'Khá'
        elif gpa >= 5: return 'Trung Bình'
        else: return 'Yếu'

    gpa['XepLoai'] = gpa['GPA'].apply(xeploai)

    # Merge bảng tổng hợp
    df = ketqua.merge(dmsv[['MaSV', 'HoTen']], on='MaSV', how='left') \
              .merge(dmmh[['MaMH', 'TenMH']], on='MaMH', how='left') \
              .merge(gpa[['MaSV', 'GPA', 'XepLoai']], on='MaSV', how='left')

    # In ra tên cột sau khi merge để debug
    print("✅ Cột sau khi merge cuối cùng:", df.columns.tolist())

    df = df[['MaSV', 'HoTen', 'MaMH', 'TenMH', 'Diem', 'LanThi', 'GPA', 'XepLoai']]
    return df


# 3. Load vào PostgreSQL + CSV
import os

def load(df):
    # Tạo thư mục D:\DB nếu chưa có
    os.makedirs("D:/DB", exist_ok=True)

    # Kết nối PostgreSQL
    engine = create_engine(POSTGRES_CONN_STR)
    df.to_sql("bang_tong_hop", engine, if_exists="replace", index=False)

    # Ghi file CSV vào D:\DB\output.csv
    df.to_csv("D:/DB/output.csv", index=False)

    print("✅ Đã nạp vào PostgreSQL và lưu tại D:/DB/output.csv")

# 4. Chạy toàn bộ
if __name__ == "__main__":
    print("🚀 Bắt đầu pipeline ELT...")
    dmsv, dmmh, ketqua = extract()
    final_df = transform(dmsv, dmmh, ketqua)
    load(final_df)
    print("🎉 Pipeline hoàn tất.")
