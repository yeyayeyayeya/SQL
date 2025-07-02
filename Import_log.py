import pandas as pd
import pyodbc

# --- Config kết nối SQL Server ---
conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=DESKTOP-7COGVJA\\XUANYEN;"
    "DATABASE=SV;"
    "Trusted_Connection=yes;"
)
cursor = conn.cursor()

# --- Hàm import CSV ---
def import_csv_to_sql(file_path, table_name):
    df = pd.read_csv(file_path, encoding='utf-8-sig')
    
    for index, row in df.iterrows():
        columns = ", ".join(row.index)
        placeholders = ", ".join(["?"] * len(row))
        sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
        cursor.execute(sql, tuple(row))
    
    conn.commit()
    print(f"✅ Đã import thành công: {file_path} => {table_name}")

# --- Gọi hàm cho từng file ---
import_csv_to_sql("user_logins.csv", "UserLogins")
import_csv_to_sql("score_updates.csv", "ScoreUpdates")

# --- Đóng kết nối ---
cursor.close()
conn.close()
print("🎉 Tất cả dữ liệu đã import xong!")
