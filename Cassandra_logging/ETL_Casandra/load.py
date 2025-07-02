from cassandra.cluster import Cluster
import pandas as pd
from config import CASSANDRA_CONFIG

def get_cassandra_session():
    cluster = Cluster(CASSANDRA_CONFIG["hosts"])
    session = cluster.connect(CASSANDRA_CONFIG["keyspace"])
    return session

def load_to_cassandra(df, table_name, session):
    for _, row in df.iterrows():
        row_dict = row.to_dict()

        # Convert các field
        for key in row_dict:
            value = row_dict[key]
            if pd.isnull(value):
                row_dict[key] = None
            elif isinstance(value, pd.Timestamp):
                row_dict[key] = value.strftime("%Y-%m-%d")
        
        columns = ", ".join(df.columns)
        placeholders = ", ".join([f"%({col})s" for col in df.columns])
        query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"

        # print(query)  # Debug nếu cần
        # print(row_dict)

        session.execute(query, row_dict)
    print("Load Successfully!")
