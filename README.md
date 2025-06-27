# 🎓 Student Grade Management – ETL Pipeline

An end-to-end ETL pipeline built using **Python**, which extracts student data from **SQL Server**, transforms it to calculate GPA and academic ranking, and loads it into a **PostgreSQL** data warehouse. The result is also exported as a CSV file, which can be used for reporting and dashboarding.

---

## ✨ Project Overview

This project simulates a real-world student grade management system where you:

- Extract raw data from SQL Server tables: students, subjects, and scores.
- Clean and transform the data:
  - Normalize student names
  - Handle missing values (optional)
  - Compute GPA
  - Classify academic performance (`Giỏi`, `Khá`, `Trung Bình`, `Yếu`)
- Load the final report into:
  - PostgreSQL table: `bang_tong_hop`
  - CSV file: `D:/DB/output.csv`

---

## 🧱 Technologies Used

- **Python 3.10+**
- **pandas** for data transformation
- **SQLAlchemy** & **psycopg2** for PostgreSQL connection
- **pyodbc** for connecting to SQL Server
- **PostgreSQL** as the data warehouse
- *(Optional)*: Metabase / Power BI for dashboarding

---

## 📂 Project Structure

student-grade-management/
├── etl.py                  # Main ETL script
├── migrate_all.py          # Optional: Copy source tables to PostgreSQL
├── config.py.example       # Sample config (hide real credentials)
├── requirements.txt        # Python dependencies
├── requirements-dev.txt    # Dev/test dependencies
├── schema_postgres.sql     # PostgreSQL-compatible schema
├── schema_mssql.sql        # SQL Server-compatible schema
├── data/
│   └── output.csv          # Final report after transformation
├── tests/
│   └── test_etl.py         # Unit tests for ETL pipeline
└── README.md               # You're reading it!

---

## 🔧 Setup Instructions

1. 📥 Clone the repository
```bash
git clone https://github.com/yeyayeyayeya/SQL.git
cd SQL
git checkout student-grade-management
```

2. 📦 Install dependencies
```bash
# For main ETL pipeline (production use)
pip install -r requirements.txt

# For development & testing environment:
pip install -r requirements-dev.txt
```

3. ⚙️ Configure database connections
Create a `config.py` file based on the sample:
```python
SQL_SERVER_CONN_STR = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=YOUR_SQL_SERVER_NAME\\INSTANCE;"  # Replace with your actual SQL Server
    "DATABASE=YOUR_SQL_DATABASE;"
    "Trusted_Connection=yes;"  # Use this if connecting via Windows Authentication
    # Or use SQL Server Authentication:
    # "UID=your_username;PWD=your_password;"
)

POSTGRES_CONN_STR = "postgresql+psycopg2://your_user:your_password@localhost:5432/YOUR_POSTGRES_DB"
```
> 🔐 Important: Avoid committing actual credentials. Use environment variables or a `.env` file in production.

4. 🚀 Run the ETL pipeline
```bash
python etl.py
```

The ETL pipeline will:
- ✅ Extract data from SQL Server (`DMSV`, `DMMH`, `KETQUA`)
- ✅ Calculate GPA and classify academic performance
- ✅ Merge into final report
- ✅ Load into PostgreSQL as `bang_tong_hop`
- ✅ Export to CSV at `D:/DB/output.csv`

5. 🔄 (Optional) Migrate all source tables to PostgreSQL
```bash
python migrate_all.py
```

6. ✅ Sample Output
```
| MaSV | HoTen           | MaMH | TenMH      | Diem | LanThi | GPA  | XepLoai     |
|------|------------------|------|------------|------|--------|------|-------------|
| 001  | Le Van An        | MH01 | Math       | 8.5  | 1      | 8.33 | Excellent    |
| 002  | Nguyen Thi Bich  | MH02 | Physics    | 6.0  | 1      | 6.00 | Average      |
| 003  | Tran Minh Cuong  | MH03 | Chemistry  | 7.0  | 2      | 7.50 | Good         |
```

7. 🧪 Run Unit Tests
```bash
pytest tests/test_etl.py
```
Tests include:
- ✅ Extraction from SQL Server
- ✅ GPA and ranking logic
- ✅ Column name validation
- ✅ Transformation correctness
- ✅ PostgreSQL data load
- ✅ Full ETL pipeline execution

8. 📈 Future Improvements
- ➕ Add more test coverage (e.g. null handling, edge cases)
- 📊 Connect to Metabase or Power BI for dashboard visualization
- ⏰ Automate with cron jobs or pgAgent
- 🔐 Move credentials to `.env` file for better security
- 📦 Package ETL into a reusable module or CLI tool
