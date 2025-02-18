USE Hospital_DB;

select * from appointments;
select * from bills;
select * from doctors;
select * from patients;
select * from treatments;

-- Query to display patient name, doctor name, appointment date, and status.
select concat(a.first_name,' ',a.last_name) as patient_name,
	   concat(b.first_name, ' ', b.last_name) as doctor_name,
       c.appointment_date,
       c.status
from appointments c
join patients a on c.patient_id = a.patient_id
join doctors b on c.doctor_id = b.doctor_id
group by patient_name
order by patient_name
;

-- List all treatments along with patient and doctor details.
select a.treatment_id,
	   a.diagnosis,
       a.treatment_notes,
       b.patient_id,
       concat(b.first_name,' ',b.last_name) as patient_name,
       c.doctor_id,
       concat(c.first_name, ' ', c.last_name) as doctor_name
from treatments a
join appointments d on a.appointment_id = d.appointment_id
join patients b on d.patient_id = b.patient_id
join doctors c on d.doctor_id = c.doctor_id
group by a.treatment_id
order by a.treatment_id
;

-- Count the total number of appointments for each doctor.
select a.doctor_id,
	   concat(a.first_name, ' ',a.last_name) as doctor_name,
       count(b.appointment_id) as total_appointments
from doctors a
join appointments b on a.doctor_id = b.doctor_id
group by a.doctor_id
order by total_appointments DESC
;

-- Find the average bill amount for all patients.
select a.patient_id,
	   concat(b.first_name,' ',b.last_name) as patient_name,
       avg(a.total_amount) as avg_amount
from bills a
join patients b on a.patient_id = b.patient_id
group by a.patient_id
order by avg_amount DESC
;

-- Retrieve the names of doctors who have more than 10 appointments.
select a.doctor_id,a.first_name,a.last_name, count(b.appointment_id) as total_appointments from doctors a
join appointments b on a.doctor_id = b.doctor_id
group by a.doctor_id
having count(b.appointment_id) > 10
;

-- Identify patients who have unpaid bills.
select a.patient_id, a.first_name, a.last_name from patients a
join bills b on a.patient_id = b.patient_id
where b.payment_status = 'Unpaid'
;

-- Create a view for all completed appointments with treatment details.
CREATE VIEW CompletedAppointmentsWithTreatment AS
SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    t.diagnosis,
    t.prescription,
    t.treatment_notes,
    a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
WHERE a.status = 'Completed'
;

-- Add an index on the last_name column in both Patients and Doctors tables.
CREATE INDEX last_name_patient ON patients(last_name);
CREATE INDEX last_name_doctor ON doctors(last_name);