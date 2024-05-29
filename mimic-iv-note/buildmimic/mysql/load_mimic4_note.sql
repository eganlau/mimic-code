-- For mimiciv_note.discharge table
DROP TABLE IF EXISTS mimiciv_note.discharge;
CREATE TABLE mimiciv_note.discharge
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  note_type VARCHAR(2) NOT NULL,
  note_seq SMALLINT NOT NULL,
  charttime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  text TEXT NOT NULL
);
LOAD DATA LOCAL INFILE 'discharge.csv' INTO TABLE mimiciv_note.discharge
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
charttime = trim(@charttime),
storetime = IF(@storetime='', NULL, trim(@storetime)),
text = trim(@text);

-- For mimiciv_note.radiology table
DROP TABLE IF EXISTS mimiciv_note.radiology;
CREATE TABLE mimiciv_note.radiology
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  note_type VARCHAR(2) NOT NULL,
  note_seq SMALLINT NOT NULL,
  charttime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  text TEXT NOT NULL
);
LOAD DATA LOCAL INFILE 'radiology.csv' INTO TABLE mimiciv_note.radiology
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
charttime = trim(@charttime),
storetime = IF(@storetime='', NULL, trim(@storetime)),
text = trim(@text);

-- For mimiciv_note.discharge_detail table
DROP TABLE IF EXISTS mimiciv_note.discharge_detail;
CREATE TABLE mimiciv_note.discharge_detail
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  field_name VARCHAR(255) NOT NULL,
  field_value TEXT NOT NULL,
  field_ordinal INTEGER NOT NULL
);
LOAD DATA LOCAL INFILE 'discharge_detail.csv' INTO TABLE mimiciv_note.discharge_detail
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

-- For mimiciv_note.radiology_detail table
DROP TABLE IF EXISTS mimiciv_note.radiology_detail;
CREATE TABLE mimiciv_note.radiology_detail
(
  note_id VARCHAR(25) NOT NULL,
  subject_id INTEGER NOT NULL,
  field_name VARCHAR(255) NOT NULL,
  field_value TEXT NOT NULL,
  field_ordinal INTEGER NOT NULL
);
LOAD DATA LOCAL INFILE 'radiology_detail.csv' INTO TABLE mimiciv_note.radiology_detail
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
