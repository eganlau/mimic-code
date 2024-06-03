use mimiciv;

DROP PROCEDURE IF EXISTS PROC_DROP_FOREIGN_KEY;
DELIMITER $$
CREATE PROCEDURE PROC_DROP_FOREIGN_KEY(IN tableName VARCHAR(64), IN constraintName VARCHAR(64))
BEGIN
  IF EXISTS(
    SELECT * FROM information_schema.table_constraints
    WHERE 
      table_schema    = DATABASE()     AND
      table_name      = tableName      AND
      constraint_name = constraintName AND
      constraint_type = 'FOREIGN KEY')
  THEN
    SET @query = CONCAT('ALTER TABLE ', tableName, ' DROP FOREIGN KEY ', constraintName, ';');
    PREPARE stmt FROM @query; 
    EXECUTE stmt; 
    DEALLOCATE PREPARE stmt; 
  END IF; 
END$$
DELIMITER ;

-- subject_id
CALL PROC_DROP_FOREIGN_KEY('discharge', 'discharge_fk_subject_id');
ALTER TABLE discharge
ADD CONSTRAINT discharge_fk_subject_id
  FOREIGN KEY (subject_id)
  REFERENCES patients(subject_id);

-- hadm_ids
CALL PROC_DROP_FOREIGN_KEY('discharge', 'discharge_fk_hadm_id');
ALTER TABLE discharge
ADD CONSTRAINT discharge_fk_hadm_id
  FOREIGN KEY (hadm_id)
  REFERENCES admissions(hadm_id);

-- subject_id
CALL PROC_DROP_FOREIGN_KEY('discharge_detail', 'discharge_detail_fk_subject_id');
ALTER TABLE discharge_detail
ADD CONSTRAINT discharge_detail_fk_subject_id
  FOREIGN KEY (subject_id)
  REFERENCES patients(subject_id);
  
-- subject_id
CALL PROC_DROP_FOREIGN_KEY('radiology', 'radiology_fk_subject_id');
ALTER TABLE radiology
ADD CONSTRAINT radiology_fk_subject_id
  FOREIGN KEY (subject_id)
  REFERENCES patients(subject_id);

-- hadm_ids
CALL PROC_DROP_FOREIGN_KEY('radiology', 'radiology_fk_hadm_id');
ALTER TABLE radiology
ADD CONSTRAINT radiology_fk_hadm_id
  FOREIGN KEY (hadm_id)
  REFERENCES admissions(hadm_id);

-- subject_id
CALL PROC_DROP_FOREIGN_KEY('radiology_detail', 'radiology_detail_fk_subject_id');
ALTER TABLE radiology_detail
ADD CONSTRAINT radiology_detail_fk_subject_id
  FOREIGN KEY (subject_id)
  REFERENCES patients(subject_id);