# Cassandra Logging Extension for Student Management System

## Overview

This branch is an extension of the existing student management system project. It focuses on adding log tables to track user activities such as login events and grade updates. The main purpose is to simulate how modern web-based student grade management systems record and store logs for security, auditing, and transparency.

## Purpose

- Simulate user login tracking: record who logged in, when, from which IP address, and using which device.
- Simulate grade update tracking: record who updated a grade, when, the old score, the new score, and any notes.
- Sync these logs from SQL Server (SSMS) to Cassandra for distributed and scalable storage.
- Allow the data to be visualized in BI tools like Metabase.

## Contents

- `Cassandra_logging/etl_pipeline.py`: ETL pipeline script for transforming and syncing data from SQL Server to Cassandra.
- `Cassandra_logging/import_log.py`: Script to import CSV log data into SQL Server.
- `Cassandra_logging/tables_cassandra.cql`: CQL scripts to create the required log tables in Cassandra.
- `Cassandra_logging/user_logins.csv`: Sample data for user login logs.
- `Cassandra_logging/score_updates.csv`: Sample data for score update logs.
- `Cassandra_logging/README.md`: This documentation file.

## Workflow

1. Import the CSV files into SQL Server using the `import_log.py` script.
2. Run the `etl_pipeline.py` script to sync the data from SQL Server to Cassandra.
3. Verify the data in Cassandra to ensure it matches the data in SQL Server.
4. Connect Metabase or another BI tool to Cassandra to create dashboards and reports.

## Notes

- The login and score update logs are simulated data, meant to represent a realistic scenario of tracking access and grade changes in a university system.
- This design helps administrators and system owners keep track of user activities and ensures data integrity.

## Branch information

This code is maintained in a separate branch named `feature/cassandra-logs`. It extends the original student management system but does not modify the main student or course tables. Instead, it adds additional functionality for logging and monitoring.

## Usage

```bash
# Move to your project directory
cd SQL

# Switch to the logging feature branch
git checkout feature/cassandra-logs

# Install dependencies if required
pip install -r requirements.txt

# Import log data into SQL Server
python Cassandra_logging/import_log.py

# Sync data to Cassandra
python Cassandra_logging/etl_pipeline.py

