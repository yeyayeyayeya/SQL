# config.py
# The names (of driver, server, host,...) may vary/differ depending on each device or set by the user.
SQL_SERVER_CONN_STR = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=DESKTOP-7COGVJA\\XUANYEN;"
    "DATABASE=SV;"
    "Trusted_Connection=yes;" #in case using Windows Authentication
)

POSTGRES_CONN_STR = "postgresql+psycopg2://postgres:yen@localhost:5432/ql_diem"
