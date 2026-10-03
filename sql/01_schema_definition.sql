-- Create Dimension: Clinics
CREATE TABLE Dim_Clinics (
    clinic_region VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    latitude NUMERIC(8, 4) NOT NULL,
    longitude NUMERIC(8, 4) NOT NULL
);

-- Create Fact: Vaccinations
CREATE TABLE Fact_Vaccinations (
    record_id INT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    patient_age_group VARCHAR(30) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    clinic_region VARCHAR(50) REFERENCES Dim_Clinics(clinic_region),
    vaccine_type VARCHAR(50) NOT NULL,
    dose_sequence VARCHAR(20) NOT NULL,
    scheduled_date DATE NOT NULL,
    administered_date DATE,
    status VARCHAR(30) CHECK (status IN ('Completed', 'Overdue Completed', 'Missed')),
    adverse_reaction_reported VARCHAR(3) CHECK (adverse_reaction_reported IN ('Yes', 'No'))
);
