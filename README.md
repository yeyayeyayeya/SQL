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
├── etl.py # Main ETL script
├── config.py.example # Sample config (hide real credentials)
├── requirements.txt # Python dependencies
├── data/
│ └── output.csv # Final report after transformation
├── schema.sql # SQL scripts to create original tables (optional)
└── README.md # You're reading it!


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
pip install -r requirements.txt

# Or manually install if requirements.txt is not available:
pip install pandas pyodbc sqlalchemy psycopg2
```

3. ⚙️ Configure database connections
```python
# Open config.py and fill in your own connection details

SQL_SERVER_CONN_STR = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=YOUR_SQL_SERVER_NAME\\INSTANCE;"  # Replace with your actual SQL Server
    "DATABASE=YOUR_SQL_DATABASE;"
    "Trusted_Connection=yes;"  # Use this if connecting via Windows Authentication
# If using SQL Server Authentication instead, replace with:
# UID=your_username;PWD=your_password;"
)

POSTGRES_CONN_STR = "postgresql+psycopg2://your_user:your_password@localhost:5432/YOUR_POSTGRES_DB" 
# Replace with your actual password and POSTGRES DB
```

> 🔐 Important: Avoid committing actual credentials. Use environment variables or a `.env` file in production.

4. 🚀 Run the ETL pipeline
```bash
python etl.py
```

The ETL pipeline will:
- ✅ Extract data from SQL Server
- ✅ Calculate GPA and classify academic performance
- ✅ Load the result into PostgreSQL table `bang_tong_hop`
- ✅ Export to CSV file at `D:/DB/output.csv`

5. ✅ Sample Output
```
| MaSV | HoTen           | MaMH | TenMH      | Diem | LanThi | GPA  | XepLoai     |
|------|------------------|------|------------|------|--------|------|-------------|
| 001  | Le Van An        | MH01 | Math       | 8.5  | 1      | 8.33 | Excellent    |
| 002  | Nguyen Thi Bich  | MH02 | Physics    | 6.0  | 1      | 6.00 | Average      |
| 003  | Tran Minh Cuong  | MH03 | Chemistry  | 7.0  | 2      | 7.50 | Good         |
```

6. 📈 Future Improvements
- ➕ Add unit tests for GPA calculation and ranking
- 📊 Connect to Metabase or Power BI for dashboarding
- ⏰ Automate the pipeline using cron jobs or pgAgent
- 🔐 Move database credentials to .env file for security
- 📦 Package the ETL as a reusable Python module or CLI tool

