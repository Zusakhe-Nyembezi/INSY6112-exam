CREATE DATABASE members_st10388340;

use members_st10388340;

-- Q.3.1
CREATE TABLE Patient (
	PatientID int PRIMARY KEY,
    PatientName varchar(50),
    PatientSurname varchar(50),
    PatientDOB DATE
);

-- Q.3.2
CREATE TABLE Doctor (
	DoctorID int PRIMARY KEY,
    DoctorName varchar(50),
    DoctorSurname varchar(50)
);

-- Q.3.3
CREATE TABLE Appointment (
	AppointmentID int PRIMARY KEY,
    PatientID int,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    DoctorID int,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    AppointmentDate DATE,
    AppointmentTime TIME,
    AppointmentDuration int
);

-- Q.3.4
INSERT INTO Patient ( PatientID, PatientName, PatientSurname, PatientDOB)
VALUES ( 1, 'Debbie', 'Theart', '1980-03-17'),
	   ( 2, 'Thomas', 'Duncan', '1976-08-12');
     

INSERT INTO Doctor ( DoctorID, DoctorName, DoctorSurname )
VALUES (1, 'Zintle', 'Nukani'),
	   (2, 'Ravi', 'Maharaj');
       
INSERT INTO Appointment (AppointmentID, AppointmentDate, AppointmentTime, AppointmentDuration, DoctorID, PatientID)
VALUES (1, '2025-01-15', '09:00', 15, 2, 1),
	   (2, '2025-01-18', '15:00', 30, 2, 2),
	   (3, '2025-01-20', '10:00', 15, 1, 1),
	   (4, '2025-01-21', '11:00', 15, 2, 1);
       
-- Q.3.5 
SELECT * FROM Appointment
WHERE AppointmentDate >= '2025-01-16' AND AppointmentDate <= '2025-01-20';

-- Q.3.6 
SELECT  p.PatientName, p.PatientSurname, COUNT(a.AppointmentID) AS TotalAppointments
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientName, p.PatientSurname
ORDER BY TotalAppointments DESC;

-- Q.3.7 
CREATE VIEW Doctor2Patients AS
SELECT 
    DISTINCT p.PatientName,
    p.PatientSurname
FROM 
    Patient p
JOIN 
    Appointment a ON p.PatientID = a.PatientID
WHERE 
    a.DoctorID = 2
ORDER BY 
    p.PatientSurname ASC;




       


