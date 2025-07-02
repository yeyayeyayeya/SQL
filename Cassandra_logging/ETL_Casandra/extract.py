import pandas as pd
import pyodbc
from config import SQL_SERVER_CONFIG

def extract_table(table_name):
    conn_str = (
        f"DRIVER={{{SQL_SERVER_CONFIG['driver']}}};"
        f"SERVER={SQL_SERVER_CONFIG['server']};"
        f"DATABASE={SQL_SERVER_CONFIG['database']};"
        f"Trusted_Connection={SQL_SERVER_CONFIG['trusted_connection']};"
    )
    conn = pyodbc.connect(conn_str)
    query = f"SELECT * FROM {table_name}"
    df = pd.read_sql(query, conn)
    conn.close()
    return df
print("Extract Successfully!")