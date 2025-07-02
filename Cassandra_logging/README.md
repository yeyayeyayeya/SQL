# ✨ Câu 2 - Ghi log đăng nhập & cập nhật điểm qua Cassandra

## Mục tiêu

- Ghi nhận lịch sử đăng nhập & cập nhật điểm.
- MSSQL giữ bảng chính.
- Sync sang Cassandra.
- Dashboard hiển thị qua Metabase.

## Tables

### UserLogins

- Id (uniqueidentifier)
- StudentId
- LoginTime
- Role
- IPAddress
- DeviceInfo

### ScoreUpdates

- Id
- StudentId
- SubjectId
- OldScore
- NewScore
- UpdatedAt
- UpdatedBy
- UpdatedByName
- Note

## Luồng

1️⃣ Lưu dữ liệu vào MSSQL (`create_tables_mssql.sql`).  
2️⃣ Import data CSV vào MSSQL (`import_mssql.py`).  
3️⃣ Sync data sang Cassandra (`pipeline.py`).  
4️⃣ Dashboard đọc từ Cassandra => Metabase.

## Usage

```bash
python import_mssql.py
python pipeline.py
```

## 📊 Metabase

- Connect trực tiếp Cassandra để build dashboard (login counts, updates timeline,...).
