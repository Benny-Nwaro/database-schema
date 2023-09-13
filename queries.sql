-- Populating tables

INSERT INTO employees
(full_name, job_role, employee_department, employment_type, date_employed, training_id, employee_leaves) 
VALUES
('Aroh Ebenezer', 'Software developer', 'IT','full-time', '05/22/2020', 12345, 8);



INSERT INTO departments
(employee_id, job_id, department_name, department_head, job_positions) 
VALUES
(12345, 6789, 'IT', 'Rubeth Joy', 'Team lead');



INSERT INTO leaves
( request_id, employee_id, dated_started, date_expected, leave_reason ) 
VALUES
(12345, 6789,'23 April, 2022', '22 october, 2023' 'education');




INSERT INTO training_sessions
(id, employee_id, present, absent_ , attendance_date) 
VALUES
(12345, 6789, 4, 8, '13/05/2021');



INSERT INTO attendance_records
(category_name, description) 
VALUES
('');



INSERT INTO payrolls
(category_name, description) 
VALUES
('');




