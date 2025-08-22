use hospital_readmissions;

-- ENABLING LOCAL DATA LOADING
set global local_infile = 1;

-- importing data one-by-one. first patients then diagnoses then admissions
load data local infile 'C:\\Projects\\Hospital_Readmission\\data\\raw\\patients.csv'
into table patients
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(patient_id, first_name, last_name, date_of_birth, gender, insurance_type);

-- diagnoses
load data local infile 'C:\\Projects\\Hospital_Readmission\\data\\raw\\diagnoses.csv'
into table diagnoses
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- admissions
load data local infile 'C:\\Projects\\Hospital_Readmission\\data\\raw\\admissions.csv'
into table admissions
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(admission_id, patient_id, admission_date, discharge_date, primary_diagnosis, 
discharge_disposition, hospital_service, length_of_stay, total_charges, is_30day_readmission);

-- Clear admissions table
-- TRUNCATE TABLE admissions;

SELECT 
    'patients' as table_name, COUNT(*) as record_count FROM patients
UNION ALL
SELECT 
    'admissions', COUNT(*) FROM admissions  
UNION ALL
SELECT 
    'diagnoses', COUNT(*) FROM diagnoses;
