from extract import extract_table
from transform import transform_dataframe
from load import get_cassandra_session, load_to_cassandra

def run_pipeline(table_name):
    print(f"Bắt đầu pipeline cho bảng: {table_name}")
    
    df = extract_table(table_name)
    print(f"Đã extract {len(df)} dòng từ SQL Server")
    
    df = transform_dataframe(df, table_name)
    print(f"Đã transform dữ liệu")
    
    session = get_cassandra_session()
    load_to_cassandra(df, table_name, session)
    print(f"Đã load xong dữ liệu sang Cassandra")

if __name__ == "__main__":
    # Liệt kê các bảng bạn muốn sync
    tables = ["DMSV", "DMKHOA", "DMMH", "KETQUA", "DMGV"]
    
    for table in tables:
        run_pipeline(table)
