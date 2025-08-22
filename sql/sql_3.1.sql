-- this is the code for loading diagnoses without changing its enum format 
-- initially it was -->>   severity_level enum('Minor', 'Moderate', 'Major', 'Extreme'), not null
-- but we changed it to -->> severity_level varchar(10),
LOAD DATA LOCAL INFILE 'C:\\Projects\\Hospital_Readmission\\data\\raw\\diagnoses.csv'
INTO TABLE diagnoses
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS  -- Skip header if exists
(@code, @name, @severity, @created)
SET 
    diagnosis_code = NULLIF(TRIM(@code), ''),
    diagnosis_name = NULLIF(TRIM(@name), ''),
    severity_level = CASE 
        WHEN TRIM(@severity) = 'Minor' THEN 'Minor'
        WHEN TRIM(@severity) = 'Moderate' THEN 'Moderate'
        WHEN TRIM(@severity) = 'Major' THEN 'Major'
        WHEN TRIM(@severity) = 'Extreme' THEN 'Extreme'
        ELSE NULL  -- Will fail gracefully due to NOT NULL constraint
    END,
    created_at = IFNULL(@created, CURRENT_TIMESTAMP);