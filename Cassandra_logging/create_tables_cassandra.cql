CREATE KEYSPACE IF NOT EXISTS sv WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE sv;

CREATE TABLE IF NOT EXISTS userlogins (
    id uuid PRIMARY KEY,
    studentid text,
    logintime timestamp,
    role text,
    ipaddress text,
    deviceinfo text
);

CREATE TABLE IF NOT EXISTS scoreupdates (
    id uuid PRIMARY KEY,
    studentid text,
    subjectid text,
    oldscore float,
    newscore float,
    updatedat timestamp,
    updatedby text,
    updatedbyname text,
    note text
);
