import pyodbc
from cassandra.cluster import Cluster

# Kết nối SQL Server
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};' 
    'SERVER=DESKTOP-7COGVJA\\XUANYEN;' 
    'DATABASE=SV;' 
    'Trusted_Connection=yes;'
)
cursor = conn.cursor()

# Kết nối Cassandra
cluster = Cluster(['127.0.0.1'])
session = cluster.connect('your_keyspace')

# ========================
# Sync UserLogins
# ========================
cursor.execute("SELECT Id, StudentId, LoginTime, Role, IPAddress, DeviceInfo FROM UserLogins")
rows = cursor.fetchall()

for row in rows:
    session.execute("""
        INSERT INTO user_logins (id, student_id, login_time, role, ip_address, device_info)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (row.Id, row.StudentId, row.LoginTime, row.Role, row.IPAddress, row.DeviceInfo))

print("✅ Synced UserLogins.")

# ========================
# Sync ScoreUpdates
# ========================
cursor.execute("""
    SELECT Id, StudentId, SubjectId, OldScore, NewScore, UpdatedAt, UpdatedBy, UpdatedByName, Note
    FROM ScoreUpdates
""")
rows = cursor.fetchall()

for row in rows:
    session.execute("""
        INSERT INTO score_updates
        (id, student_id, subject_id, old_score, new_score, updated_at, updated_by, updated_by_name, note)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (row.Id, row.StudentId, row.SubjectId, row.OldScore, row.NewScore, row.UpdatedAt,
          row.UpdatedBy, row.UpdatedByName, row.Note))

print("✅ Synced ScoreUpdates.")
