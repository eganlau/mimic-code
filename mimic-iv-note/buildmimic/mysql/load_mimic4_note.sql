-- For mimiciv.discharge table
DROP TABLE IF EXISTS mimiciv.discharge;
CREATE TABLE mimiciv.discharge
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  note_type VARCHAR(2) NOT NULL,
  note_seq SMALLINT NOT NULL,
  charttime DATETIME NOT NULL,
  storetime DATETIME,
  text TEXT NOT NULL
);
LOAD DATA LOCAL INFILE 'discharge.csv' INTO TABLE mimiciv.discharge
FIELDS TERMINATED BY ',' ESCAPED BY '' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@note_id,@subject_id,@hadm_id,@note_type,@note_seq,@charttime,@storetime,@text)
SET
note_id = trim(@note_id),
subject_id = trim(@subject_id),
hadm_id = IF(@hadm_id='', NULL, trim(@hadm_id)),
note_type = trim(@note_type),
note_seq = trim(@note_seq),
charttime = @charttime,
storetime = IF(@storetime='', NULL, @storetime),
text = trim(@text);

-- For mimiciv.radiology table
DROP TABLE IF EXISTS mimiciv.radiology;
CREATE TABLE mimiciv.radiology
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  note_type VARCHAR(2) NOT NULL,
  note_seq SMALLINT NOT NULL,
  charttime DATETIME NOT NULL,
  storetime DATETIME,
  text TEXT NOT NULL
);
LOAD DATA LOCAL INFILE 'radiology.csv' INTO TABLE mimiciv.radiology
FIELDS TERMINATED BY ',' ESCAPED BY '' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@note_id,@subject_id,@hadm_id,@note_type,@note_seq,@charttime,@storetime,@text)
SET
note_id = trim(@note_id),
subject_id = trim(@subject_id),
hadm_id = IF(@hadm_id='', NULL, trim(@hadm_id)),
note_type = trim(@note_type),
note_seq = trim(@note_seq),
charttime = @charttime,
storetime = IF(@storetime='', NULL, @storetime),
text = trim(@text);

-- For mimiciv.discharge_detail table
DROP TABLE IF EXISTS mimiciv.discharge_detail;
CREATE TABLE mimiciv.discharge_detail
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  field_name VARCHAR(255) NOT NULL,
  field_value TEXT NOT NULL,
  field_ordinal INTEGER NOT NULL
);
LOAD DATA LOCAL INFILE 'discharge_detail.csv' INTO TABLE mimiciv.discharge_detail
FIELDS TERMINATED BY ',' ESCAPED BY '' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@note_id,@subject_id,@field_name,@field_value,@field_ordinal)
SET
note_id = trim(@note_id),
subject_id = trim(@subject_id),
field_name = trim(@field_name),
field_value = trim(@field_value),
field_ordinal = trim(@field_ordinal);

-- For mimiciv.radiology_detail table
DROP TABLE IF EXISTS mimiciv.radiology_detail;
CREATE TABLE mimiciv.radiology_detail
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  field_name VARCHAR(255) NOT NULL,
  field_value TEXT NOT NULL,
  field_ordinal INTEGER NOT NULL
);
LOAD DATA LOCAL INFILE 'radiology_detail.csv' INTO TABLE mimiciv.radiology_detail
FIELDS TERMINATED BY ',' ESCAPED BY '' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@note_id,@subject_id,@field_name,@field_value,@field_ordinal)
SET
note_id = trim(@note_id),
subject_id = trim(@subject_id),
field_name = trim(@field_name),
field_value = trim(@field_value),
field_ordinal = trim(@field_ordinal);
