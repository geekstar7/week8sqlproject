-- clinic_db.sql
-- Clinic Booking System Database
-- Author: Stallone Mathenge
-- Description: MySQL schema for managing doctors, patients, appointments, and treatments in a clinic

-- Clean start (drop tables if they exist)
DROP TABLE IF EXISTS AppointmentTreatment;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Treatments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;

-- ==========================
-- Doctors Table
-- ==========================
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- ==========================
-- Patients Table
-- ==========================
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) NOT NULL
);

-- ==========================
-- Treatments Table
-- ==========================
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentName VARCHAR(100) NOT NULL UNIQUE,
    Cost DECIMAL(10,2) NOT NULL
);

-- ==========================
-- Appointments Table
-- ==========================
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME NOT NULL,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- ==========================
-- AppointmentTreatment Table (M:M relationship)
-- ==========================
CREATE TABLE AppointmentTreatment (
    AppointmentID INT,
    TreatmentID INT,
    PRIMARY KEY (AppointmentID, TreatmentID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

-- ==========================
-- Sample Data (Optional)
-- ==========================
-- INSERT INTO Doctors (Name, Specialty, Email) VALUES
-- ('Dr. Alice Kimani', 'Dermatology', 'alice@clinic.com');

-- INSERT INTO Patients (Name, DateOfBirth, Email, Phone) VALUES
-- ('Jane Njeri', '1992-06-10', 'jane@example.com', '0700123456');

-- INSERT INTO Treatments (TreatmentName, Cost) VALUES
-- ('Skin Analysis', 2500.00);

-- INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Notes) VALUES
-- (1, 1, '2025-06-01 14:00:00', 'First visit');

-- INSERT INTO AppointmentTreatment (AppointmentID, TreatmentID) VALUES
-- (1, 1);
