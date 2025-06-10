CREATE TABLE VesselTypes (
    code INTEGER PRIMARY KEY,
    description VARCHAR(255)
);
CREATE TABLE Vessels (
    id VARCHAR(255) PRIMARY KEY,
    type INTEGER REFERENCES VesselTypes(code),
    flag VARCHAR(255)
);
CREATE TABLE Positions (
    id INTEGER PRIMARY KEY,
    vessel_id VARCHAR(255) REFERENCES Vessels(id),
    t TIMESTAMP,
    lon DOUBLE PRECISION,
    lat DOUBLE PRECISION,
    heading INTEGER,
    course DOUBLE PRECISION,
    speed DOUBLE PRECISION
);
