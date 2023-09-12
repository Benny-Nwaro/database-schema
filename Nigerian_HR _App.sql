CREATE TABLE "employees" (
  "id" integer PRIMARY KEY,
  "full_name" varchar,
  "job_role" varchar,
  "employee_department" varchar,
  "employment_type" varchar,
  "date_employed" datetime,
  "training_id" varchar,
  "employee_leaves" integer
);

CREATE TABLE "departments" (
  "employee_id" integer,
  "department_name" varchar,
  "department_head" varchar,
  "job_positions" varchar
);

CREATE TABLE "leaves" (
  "request_id" integer PRIMARY KEY,
  "employee_id" integer,
  "dated_started" integer,
  "date_expected" timestamp,
  "leave_reason" body
);

CREATE TABLE "training_sessions" (
  "employee_id" integer,
  "id" varchar PRIMARY KEY,
  "title" varchar,
  "Start_time" timestamp,
  "end_time" timestamp,
  "attendance" integer,
  "training_status" varchar
);

CREATE TABLE "attendance_records" (
  "id" integer PRIMARY KEY,
  "employee_id" integer,
  "present" integer AUTO_INCREMENT,
  "absent" integer AUTO_INCREMENT,
  "date" timestamp
);

CREATE TABLE "payrolls" (
  "payroll_id" integer PRIMARY KEY,
  "employee_id" integer,
  "employee_name" varchar,
  "hourly_rate" integer,
  "monthly_salary" integer,
  "created_at" timestamp
);

ALTER TABLE "payrolls" ADD FOREIGN KEY ("payroll_id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "departments" ("employee_id");

ALTER TABLE "leaves" ADD FOREIGN KEY ("request_id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("full_name") REFERENCES "leaves" ("request_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("job_role") REFERENCES "departments" ("job_positions");

ALTER TABLE "payrolls" ADD FOREIGN KEY ("monthly_salary") REFERENCES "employees" ("employment_type");

ALTER TABLE "payrolls" ADD FOREIGN KEY ("hourly_rate") REFERENCES "employees" ("employment_type");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "departments" ("job_positions");

ALTER TABLE "employees" ADD FOREIGN KEY ("employee_leaves") REFERENCES "leaves" ("employee_id");

CREATE TABLE "employees_training_sessions" (
  "employees_training_id" varchar,
  "training_sessions_id" varchar,
  PRIMARY KEY ("employees_training_id", "training_sessions_id")
);

ALTER TABLE "employees_training_sessions" ADD FOREIGN KEY ("employees_training_id") REFERENCES "employees" ("training_id");

ALTER TABLE "employees_training_sessions" ADD FOREIGN KEY ("training_sessions_id") REFERENCES "training_sessions" ("id");


ALTER TABLE "attendance_records" ADD FOREIGN KEY ("date") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "attendance_records" ("employee_id");



CREATE VIEW [employee details] AS
SELECT full_name, job_role, employee_leaves
FROM employees
WHERE full_name = 'Aroh';


SELECT * FROM [employee details];