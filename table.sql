CREATE TABLE "employees" (
  "id" integer PRIMARY KEY,
  "full_name" varchar,
  "job_role" varchar,
  "job_id" integer PRIMARY KEY,
  "department_id" integer
  "employee_department" varchar,
  "employment_type" varchar,
  "date_employed" timestamp,
  "training_id" integer,
  "employee_leaves" integer
);


CREATE TABLE departments (
  "employee_id" integer,
  "job_id" integer PRIMARY KEY,
  "department_name" varchar,
  "department_head" varchar,
  "job_positions" varchar
);

CREATE TABLE "leaves" (
  "request_id" integer PRIMARY KEY,
  "employee_id" integer,
  "dated_started" integer,
  "date_expected" timestamp,
  "leave_reason" varchar
);

CREATE TABLE "training_sessions" (
  "employee_id" integer,
  "id" integer PRIMARY KEY,
  "title" varchar,
  "Start_time" timestamp,
  "end_time" timestamp,
  "attendance" integer,
  "training_status" varchar
);

CREATE TABLE "attendance_records" (
  "id" integer PRIMARY KEY,
  "employee_id" integer,
  "present" integer,
  "absent_" integer, 
  "attendance_date" timestamp
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

ALTER TABLE "employees" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("job_id");

ALTER TABLE "leaves" ADD FOREIGN KEY ("request_id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("job_id") REFERENCES "leaves" ("request_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("job_id") REFERENCES "departments" ("job_id");

ALTER TABLE "payrolls" ADD FOREIGN KEY ("payroll_id") REFERENCES "employees" ("id");

ALTER TABLE "payrolls" ADD FOREIGN KEY ("payroll_id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "departments" ("job_positions");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "leaves" ("employee_id");

ALTER TABLE "training_sessions" ADD FOREIGN KEY ("id") REFERENCES "employees" ("training_id");

ALTER TABLE "attendance_records" ADD FOREIGN KEY ("id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("id") REFERENCES "attendance_records" ("id");



