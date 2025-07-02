import pandas as pd
import pyodbc
from sqlalchemy import create_engine
from config import SQL_SERVER_CONN_STR, POSTGRES_CONN_STR

# Bước 1: Kết nối nguồn SQL Server
sql_conn = pyodbc.connect(SQL_SERVER_CONN_STR)

# Bước 2: Kết nối đích PostgreSQL
pg_engine = create_engine(POSTGRES_CONN_STR)

# Bước 3: Danh sách bảng cần chuyển
tables = ["DMKHOA", "DMSV", "DMMH", "KETQUA"]

for table in tables:
    print(f"🔄 Đang xử lý bảng {table}...")

    # Đọc từ SQL Server
    df = pd.read_sql(f"SELECT * FROM {table}", sql_conn)

    # Đẩy sang PostgreSQL
    df.to_sql(table.lower(), pg_engine, if_exists='replace', index=False)

    print(f"✅ Đã chuyển bảng {table} sang PostgreSQL.")

sql_conn.close()
print("🎉 Hoàn tất chuyển toàn bộ bảng.")
