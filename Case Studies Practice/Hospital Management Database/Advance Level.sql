USE Hospital_DB;

select * from appointments;
select * from bills;
select * from doctors;
select * from patients;
select * from treatments;

-- Generate a monthly report showing the total revenue from medical bills and the number of appointments handled per doctor.
SELECT 
    DATE_FORMAT(b.bill_date, '%Y-%m') AS month,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(b.total_amount) AS total_revenue
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id
JOIN bills b ON t.treatment_id = b.treatment_id
GROUP BY DATE_FORMAT(b.bill_date, '%Y-%m'), doctor_name
ORDER BY month, doctor_name;

-- Write a query to list patients who have had more than 5 appointments in the last 6 months.
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    COUNT(a.appointment_id) AS total_appointments
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY p.patient_id, patient_name
HAVING COUNT(a.appointment_id) > 5
ORDER BY total_appointments DESC
;
