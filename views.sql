CREATE VIEW employee_details AS
  SELECT employees.id AS id,
    employees.full_name AS name,
    departments.job_positions AS job_role,
    employees.employee_leaves AS leaves,
    attendance_records.absent_ AS absents,
    
    
        CASE
            WHEN employees.activebool THEN 'active'
            ELSE ''
        END AS notes,
    employees.id AS sid
   FROM employees 
     INNER JOIN leaves a USING (employee_id)
     INNER JOIN attendance_records USING (employee_id)
    

-- Pull data 
SELECT
	*
FROM
	employee_details;



-- function to show_employee_payroll
create function show_employee_payroll(employee_id int, period_start int, period_end int)
returns int
language plpgsql
as
$$
declare
   salary_earned integer;
   monthly_salary integer;
   number_of_workdays integer;



begin

   
   return salary_earned = (period_end - period_start)*(monthly_salary/30);
end;
$$;