CREATE INDEX ON Positions ((t::date));
CREATE INDEX ON Vessels (flag, type);
CREATE INDEX ON Positions (speed);
CREATE INDEX ON Positions (t);
CREATE INDEX ON Positions (vessel_id, speed, t);