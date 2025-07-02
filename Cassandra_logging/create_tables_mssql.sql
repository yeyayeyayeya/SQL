CREATE TABLE UserLogins (
    Id uniqueidentifier PRIMARY KEY,
    StudentId nvarchar(10),
    LoginTime datetime,
    Role nvarchar(10),
    IPAddress nvarchar(50),
    DeviceInfo nvarchar(100)
);

CREATE TABLE ScoreUpdates (
    Id uniqueidentifier PRIMARY KEY,
    StudentId nvarchar(10),
    SubjectId nvarchar(10),
    OldScore float,
    NewScore float,
    UpdatedAt datetime,
    UpdatedBy nvarchar(10),
    UpdatedByName nvarchar(100),
    Note nvarchar(200)
);
