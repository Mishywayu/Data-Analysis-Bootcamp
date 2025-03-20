-- Create the Hospital Management Database
CREATE DATABASE Hospital_DB;
USE Hospital_DB;

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(15),
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE
);

-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    department VARCHAR(100)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Treatments Table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    diagnosis TEXT,
    prescription TEXT,
    treatment_notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Create Bills Table
CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    bill_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status ENUM('Paid', 'Unpaid', 'Pending'),
    payment_method ENUM('Cash', 'Card', 'Insurance'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);


-- Insert data into Patients table
INSERT INTO Patients (first_name, last_name, dob, gender, contact_number, address, email) VALUES
('Alice', 'Johnson', '1990-05-14', 'Female', '0701234567', '123 Main St, Nairobi', 'alice.johnson@example.com'),
('Brian', 'Smith', '1985-08-21', 'Male', '0702345678', '456 Oak St, Nairobi', 'brian.smith@example.com'),
('Catherine', 'Ngugi', '1995-12-30', 'Female', '0703456789', '789 Pine St, Nairobi', 'catherine.ngugi@example.com'),
('David', 'Kimani', '2000-03-15', 'Male', '0704567890', '101 Maple St, Nairobi', 'david.kimani@example.com'),
('Eunice', 'Mwangi', '1988-07-07', 'Female', '0705678901', '202 Cedar St, Nairobi', 'eunice.mwangi@example.com');

-- Insert data into Doctors table
INSERT INTO Doctors (first_name, last_name, specialization, contact_number, email, department) VALUES
('John', 'Omondi', 'Cardiology', '0711234567', 'john.omondi@hospital.com', 'Cardiology Department'),
('Grace', 'Wanjiru', 'Neurology', '0712345678', 'grace.wanjiru@hospital.com', 'Neurology Department'),
('Peter', 'Kariuki', 'Pediatrics', '0713456789', 'peter.kariuki@hospital.com', 'Pediatrics Department'),
('Ann', 'Mutua', 'Orthopedics', '0714567890', 'ann.mutua@hospital.com', 'Orthopedics Department'),
('James', 'Njenga', 'General Medicine', '0715678901', 'james.njenga@hospital.com', 'General Medicine Department');

-- Insert data into Appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-02-20', '10:00:00', 'Scheduled'),
(2, 2, '2025-02-21', '11:30:00', 'Scheduled'),
(3, 3, '2025-02-19', '09:15:00', 'Completed'),
(4, 4, '2025-02-22', '14:00:00', 'Scheduled'),
(5, 5, '2025-02-18', '16:00:00', 'Completed');

-- Insert data into Treatments table
INSERT INTO Treatments (appointment_id, diagnosis, prescription, treatment_notes) VALUES
(3, 'Migraine', 'Paracetamol, Rest', 'Patient reported severe headaches. Advised rest.'),
(5, 'Fracture', 'Cast, Painkillers', 'Fracture in right arm. Cast applied.'),
(2, 'Epilepsy', 'Anti-epileptic medication', 'Patient showing mild seizure symptoms.'),
(1, 'Hypertension', 'Blood pressure medication', 'High BP detected. Medication prescribed.'),
(4, 'Allergy', 'Antihistamines', 'Allergic reaction to dust. Medication given.');

-- Insert data into Bills table
INSERT INTO Bills (patient_id, treatment_id, bill_date, total_amount, payment_status, payment_method) VALUES
(3, 1, '2025-02-19', 5000.00, 'Paid', 'Card'),
(5, 2, '2025-02-18', 12000.00, 'Unpaid', 'Insurance'),
(2, 3, '2025-02-21', 8000.00, 'Pending', 'Cash'),
(1, 4, '2025-02-20', 3000.00, 'Paid', 'Card'),
(4, 5, '2025-02-22', 4500.00, 'Unpaid', 'Cash');
