CREATE TABLE Roster ( --Create Roster table
name VARCHAR PRIMARY KEY(50),
POS VARCHAR(3),
BAT VARCHAR(2),
THW VARCHAR(2),
Age INT,
HT FLOAT,
WT INT,
Jersey INT
)

;BULK INSERT dbo.Roster --throw data from csv into Roster table
FROM 'C:\Temp\Dodgers - Roster (1).csv'
WITH (
FIRSTROW =2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001'
);

ALTER TABLE Roster --make name not nullable so we can change it to PK
ALTER COLUMN name VARCHAR(50) NOT NULL;

ALTER TABLE Roster --drop PK constraint for jersey column
DROP CONSTRAINT [PK__Roster__E21BF0FE2E1FAB48]

ALTER TABLE Roster --make name column new PK
ADD CONSTRAINT [PK__Roster__E21BF0FE2E1FAB48] PRIMARY KEY (name);

CREATE TABLE Hitting (--Table for hitting statistics
name VARCHAR(50) FOREIGN KEY REFERENCES Roster(name),
G int,
AB int,
R int,
H int,
"2B" int,
"3B" int,
HR int,
RBI int,
BB int,
K int,
SB int,
CS int,
BAVG float,
OBP float,
SLG float,
OPS float
)

BULK INSERT dbo.Hitting --throw data from csv into Hitting table
FROM 'C:\Temp\Dodgers - Hitting.csv'
WITH (
FIRSTROW =2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001'
)

CREATE TABLE Pitching (--Table for pitching stats
name VARCHAR(50) FOREIGN KEY REFERENCES Roster(name),
W int,
L int,
G int,
GS int,
CG int,
SV int,
H int,
R int,
ER int,
HR int,
BB int,
K int,
HLD int,
IP float,
ERA float,
WHIP float,
BAA float,
BS int
)

BULK INSERT dbo.Pitching --throw data from csv into Pitching table
FROM 'C:\Temp\Dodgers - Pitching2.csv'
WITH (
FIRSTROW =2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001'
)
