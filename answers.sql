-- Part 2: Creating a Database
CREATE DATABASE hospital_db;

-- Part 3: Creating Tables
USE hospital_db;           -- selecting a database

-- creating providers table
CREATE TABLE providers(
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    provider_speciality VARCHAR(50) NOT NULL,
    email_address VARCHAR(50),
    phone_number VARCHAR(50),
    date_joined DATE NOT NULL
);

-- creating patients table
CREATE TABLE patients(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    language VARCHAR(30) NOT NULL
);

-- creating visits table
CREATE TABLE visits(
     visit_id INT PRIMARY KEY AUTO_INCREMENT,
     patient_id  INT NOT NULL,
     provider_id INT NOT NULL,
     date_of_visit DATE NOT NULL,
     date_scheduled DATE NOT NULL,
     visit_department_id INT NOT NULL,
     visit_type VARCHAR(50) NOT NULL,
     blood_pressure_systollic INT,
     blood_pressure_diastollic DECIMAL,
     pulse DECIMAL,
     visit_status VARCHAR(50) NOT NULL,
     FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
     FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);
    
-- -- creating admissions table
CREATE TABLE admissions(
    admissiona_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(255) NOT NULL,
    service VARCHAR(255) NOT NULL,
    primary_diagnosis VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- creating ed visits
CREATE TABLE ed_visits(
    ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT NOT NULL,
    patient_id INT NOT NULL,
    acuity INT NOT NULL,
    reason_for_visit VARCHAR(50) NOT NULL,
    ed_disposition  VARCHAR(100) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- creating discharge table
CREATE TABLE discharges(
    discharge_id INT PRIMARY KEY AUTO_INCREMENT,
    admissiona_id INT NOT NULL,
    patient_id INT NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(50) NOT NULL,
    FOREIGN KEY (admissiona_id) REFERENCES admissions(admissiona_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
