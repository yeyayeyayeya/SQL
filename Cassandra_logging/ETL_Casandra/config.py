# The names (of driver, server, host,...) may vary/differ depending on each device or set by the user.
SQL_SERVER_CONFIG = {
    "driver": "ODBC Driver 17 for SQL Server",  
    "server": "DESKTOP-7COGVJA\\XUANYEN", 
    "database": "SV",
    "trusted_connection": "yes", # in case of using Windows Authentication
}

CASSANDRA_CONFIG = {
    "hosts": ["192.168.174.128"], 
    "port": 9042,
    "keyspace": "sv_keyspace",
}

print("Connected")
