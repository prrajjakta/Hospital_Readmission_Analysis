use hospital_readmissions;

-- PATIENTS TABLE->> CORE DEMOGRAPHIC INFORMATION
create table patients (
	patient_id varchar(10) primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    gender enum('M', 'F') not null,
    insurance_type varchar(20) not null,
    created_at timestamp default current_timestamp,
    index idx_patient_dob (date_of_birth),
    index idx_patient_insurance (insurance_type)
);


-- DIAGNOSES LOOKUP TABLE
create table diagnoses (
	diagnosis_code varchar(10) primary key,
    diagnosis_name varchar(100) not null,
    severity_level varchar(10),
    created_at timestamp default current_timestamp
);

-- admissions table: core fact table
create table admissions (
	admission_id varchar(12) primary key,
    patient_id varchar(10) not null,
    admission_date date not null,
    discharge_date date not null,
    primary_diagnosis varchar(100) not null,
    discharge_disposition varchar(30) not null,
    hospital_service varchar(20) not null,
    length_of_stay int not null,
    total_charges decimal(10, 2) not null,
    is_30day_readmission tinyint default 0,
    created_at timestamp default current_timestamp,
    
    foreign key (patient_id) references patients(patient_id),
    
    index idx_admission_patient (patient_id),
    index idx_admission_dates (admission_date, discharge_date),
    index idx_admission_diagnosis (primary_diagnosis),
    index idx_readmission_flag (is_30day_readmission),
    
    constraint chk_discharge_after_admission check (discharge_date >= admission_date),
    constraint chk_positive_los check (length_of_stay > 0),
    constraint chk_positive_charges check (total_charges > 0)
);

-- VERIFICATION CHECK 
show tables;
describe patients;
describe admissions;
describe diagnoses;