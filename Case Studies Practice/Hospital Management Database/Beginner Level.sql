USE Hospital_DB;

select * from appointments;
select * from bills;
select * from doctors;
select * from patients;
select * from treatments;

-- List all doctors and their specializations.
select concat(first_name, ' ', last_name) as doctor_name,
	   specialization
from doctors;

-- Retrieve all patients born after the year 2000.
select concat(first_name, ' ',last_name) as patient_name,
	   year(dob) as year
from patients
where year(dob) > 2000
;

-- Show all appointments scheduled for a specific date.
select * from appointments
where status = "Scheduled"
;