CREATE TYPE position_type AS ENUM ('Spearman', 'Two_handed', 'Catalyst', 'One_handed', 'Archer');
CREATE TYPE role AS ENUM ('Main_DPS', 'Sub_DPS', 'Healer', 'Support', 'Shieldman');
CREATE TYPE element AS ENUM ('Пиро', 'Крио', 'Анемо', 'Гео', 'Гидро', 'Электро');
CREATE TYPE weapon_type AS ENUM ('Spear', 'Two_handed', 'Catalyst', 'One_handed', 'Bow');

CREATE TABLE Bonus (
    Bonus_id SERIAL PRIMARY KEY,
    Type TEXT NOT NULL,
    Value REAL NOT NULL DEFAULT 0 CHECK (value >=0)
);

CREATE TABLE Characteristic (
    Characteristic_id SERIAL PRIMARY KEY,
    Type TEXT NOT NULL,
    Value REAL NOT NULL DEFAULT 0 CHECK (value >=0)
);

CREATE TABLE Artifact (
    Artifact_id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Type TEXT NOT NULL,
    Main_characteristic INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Side_characteristic_1 INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Side_characteristic_2 INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Side_characteristic_3 INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Side_characteristic_4 INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT
);

CREATE TABLE Artifact_set (
    Artifact_set_id SERIAL PRIMARY KEY,
    Artifact_1 INT REFERENCES Artifact ON DELETE RESTRICT,
    Artifact_2 INT REFERENCES Artifact ON DELETE RESTRICT,
    Artifact_3 INT REFERENCES Artifact ON DELETE RESTRICT,
    Artifact_4 INT REFERENCES Artifact ON DELETE RESTRICT,
    Artifact_5 INT REFERENCES Artifact ON DELETE RESTRICT,
    Bonus_1 INT REFERENCES Bonus ON DELETE RESTRICT,
    Bonus_2 INT REFERENCES Bonus ON DELETE RESTRICT
);

CREATE TABLE Weapon (
    Weapon_id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Weapon_type weapon_type NOT NULL,
    Main_characteristic INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Side_characteristic INT NOT NULL REFERENCES Characteristic ON DELETE RESTRICT,
    Bonus INT NOT NULL REFERENCES Bonus ON DELETE RESTRICT
);

CREATE TABLE Talent (
    Talent_id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Type TEXT NOT NULL,
    Level INT NOT NULL DEFAULT 1 CHECK (Level >=1)
);

CREATE TABLE Character (
    Name TEXT PRIMARY KEY,
    Level INT NOT NULL DEFAULT 1 CHECK (Level >=1),
    HP INT NOT NULL DEFAULT 0 CHECK (HP >=0),
    Basic_attack INT NOT NULL DEFAULT 1 CHECK (Basic_attack >=1),
    Crit_damage REAL NOT NULL DEFAULT 50.0 CHECK (Crit_damage >=50.0),
    CD_chance REAL NOT NULL DEFAULT 5.0 CHECK (CD_chance >=5.0),
    Position_type position_type NOT NULL,
    Element element NOT NULL,
    Role role NOT NULL,
    Artifact_set INT NOT NULL REFERENCES Artifact_set ON DELETE RESTRICT,
    Talent_1 INT NOT NULL REFERENCES Talent ON DELETE RESTRICT,
    Talent_2 INT NOT NULL REFERENCES Talent ON DELETE RESTRICT,
    Talent_3 INT NOT NULL REFERENCES Talent ON DELETE RESTRICT,
    Weapon INT NOT NULL REFERENCES Weapon ON DELETE RESTRICT
);

CREATE TABLE Team (
    Team_id SERIAL PRIMARY KEY,
    Character_1 TEXT NOT NULL REFERENCES Character ON DELETE RESTRICT,
    Character_2 TEXT REFERENCES Character ON DELETE RESTRICT,
    Character_3 TEXT REFERENCES Character ON DELETE RESTRICT,
    Character_4 TEXT REFERENCES Character ON DELETE RESTRICT,
    Bonus INT REFERENCES Bonus ON DELETE RESTRICT

);
