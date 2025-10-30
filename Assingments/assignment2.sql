-- Title: Assignment-2: Implement Healthcare System Using Database from Scratch

/*
 Objective:

Develop a healthcare management database system from scratch,
applying all concepts learned in Database Management Systems (DBMS) so far. 
The goal is to gain hands-on experience in designing and implementing
a real-life database with meaningful analysis and operations.   
*/

-- Task Details:
-- 1. Create a Database:
-- Name your database Healthcare_System.

create database healthcare_system;

use healthcare_system;


-- Design 10 Tables with Attributes:
-- -----------------------------------------------Database analysis--------------------------------------------------------------
/*
t1 – departments(department_id, name, location, phone, established_year, capacity, floor, specialization, status, head_of_department)
t2 – patients(patient_id, first_name, last_name, age, gender, contact, address, blood_type, emergency_contact, registration_date)
t3 – medications(medication_id, name, type, price, description, manufacturer, stock_available, expiry_date, dosage_form, storage_condition)
t4 – doctors(doctor_id, first_name, last_name, specialty, department_id, phone, email, experience_years, qualification, status)
t5 – staff(staff_id, first_name, last_name, role, department_id, contact, email, shift, salary, joining_date)
t6 – facilities(facility_id, name, type, cost, availability_status, location, capacity, operating_hours, supervisor, last_maintenance)
t7 – medical_history(history_id, patient_id, diagnosis, treatment, notes, date_recorded, allergies, chronic_conditions, follow_up_required, last_updated)
t8 – appointments(appointment_id, patient_id, doctor_id, date, time, status, reason, booking_mode, created_on, updated_on)
t9 – prescriptions(prescription_id, patient_id, doctor_id, medication_id, date_provided, dosage, frequency, duration, notes, next_visit_date)
t10 – bills(bill_id, patient_id, total_amount, payment_status, date, payment_mode, discount, tax, due_date, remarks)
*/
 
-- Implement Database Operations:

/* A. Basic Commands:

Create: Create the database and all tables listed above.
Drop: Demonstrate dropping a table and the database (use screenshots for this).
Insert: Populate each table with 10 records.
Show: Display data from tables to confirm entries.
Truncate: Showcase the use of truncate on one table (after ensuring records are saved elsewhere).
*/


-- t1 – departments(department_id, name, location, phone, established_year, capacity, floor, specialization, status, head_of_department)

create table departments (
    department_id int primary key auto_increment,
    name varchar(100) not null,
    location varchar(100),
    phone varchar(15),
    established_year int,
    capacity int,
    floor int,
    specialization varchar(100),
    status varchar(20) check (status in ('active', 'inactive')),
    head_of_department int null
);


insert into departments (name, location, phone, established_year, capacity, floor, specialization, status, head_of_department) values
('cardiology', 'building a', '111-222-3333', 2005, 50, 1, 'heart', 'active', null),
('neurology', 'building b', '111-222-3334', 2008, 40, 2, 'brain', 'active', null),
('orthopedics', 'building c', '111-222-3335', 2010, 60, 1, 'bones', 'active', null),
('pediatrics', 'building d', '111-222-3336', 2012, 70, 3, 'children', 'active', null),
('dermatology', 'building e', '111-222-3337', 2015, 30, 2, 'skin', 'active', null),
('radiology', 'building f', '111-222-3338', 2007, 20, 1, 'imaging', 'active', null),
('gynecology', 'building g', '111-222-3339', 2006, 35, 2, 'women', 'active', null),
('urology', 'building h', '111-222-3340', 2009, 25, 3, 'urinary', 'active', null),
('oncology', 'building i', '111-222-3341', 2011, 40, 1, 'cancer', 'active', null),
('psychiatry', 'building j', '111-222-3342', 2013, 30, 2, 'mental health', 'active', null);


select * from departments;

truncate table departments;

drop table departments;

-- t2 – patients(patient_id, first_name, last_name, age, gender, contact, address, blood_type, emergency_contact, registration_date)

create table patients (
    patient_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    age int check (age > 0),
    gender varchar(10) check (gender in ('male', 'female', 'other')),
    contact varchar(15) unique not null,
    address varchar(200),
    blood_type varchar(5) check (blood_type in ('a+', 'a-', 'b+', 'b-', 'ab+', 'ab-', 'o+', 'o-')),
    emergency_contact varchar(15),
    registration_date date default (current_date)
);


insert into patients (first_name, last_name, age, gender, contact, address, blood_type, emergency_contact, registration_date) values
('pratiksha', 'sonawane', 22, 'female', '9000000001', '123 main street, city', 'a+', '9000000010', '2025-10-01'),
('rahul', 'sharma', 35, 'male', '9000000002', '45 green avenue, city', 'b+', '9000000011', '2025-10-01'),
('neha', 'patil', 28, 'female', '9000000003', '78 blue lane, city', 'o+', '9000000012', '2025-10-01'),
('amit', 'kumar', 40, 'male', '9000000004', '32 red road, city', 'ab+', '9000000013', '2025-10-01'),
('sneha', 'rao', 30, 'female', '9000000005', '56 yellow street, city', 'a-', '9000000014', '2025-10-01'),
('manish', 'desai', 45, 'male', '9000000006', '23 orange avenue, city', 'b-', '9000000015', '2025-10-01'),
('priya', 'singh', 26, 'female', '9000000007', '89 purple lane, city', 'o-', '9000000016', '2025-10-01'),
('vikas', 'joshi', 38, 'male', '9000000008', '12 pink street, city', 'ab-', '9000000017', '2025-10-01'),
('riya', 'mehta', 24, 'female', '9000000009', '67 white avenue, city', 'a+', '9000000018', '2025-10-01'),
('sahil', 'patel', 33, 'male', '9000000010', '90 black road, city', 'b+', '9000000019', '2025-10-01');

select * from patients;

truncate table patients;

drop table patients;

-- t3 – medications(medication_id, name, type, price, description, manufacturer, stock_available, expiry_date, dosage_form, storage_condition)

create table medications (
    medication_id int primary key auto_increment,
    name varchar(100) not null,
    type varchar(50),
    price decimal(10,2) check (price >= 0),
    description varchar(255),
    manufacturer varchar(100),
    stock_available int check (stock_available >= 0),
    expiry_date date,
    dosage_form varchar(50),
    storage_condition varchar(100)
);

insert into medications (name, type, price, description, manufacturer, stock_available, expiry_date, dosage_form, storage_condition) values
('paracetamol', 'tablet', 10.00, 'pain reliever and fever reducer', 'abc pharma', 500, '2026-12-31', 'tablet', 'store in cool dry place'),
('amoxicillin', 'capsule', 25.00, 'antibiotic for bacterial infections', 'xyz pharma', 300, '2025-11-30', 'capsule', 'store below 25°C'),
('ibuprofen', 'tablet', 15.00, 'anti-inflammatory pain relief', 'medico labs', 400, '2026-05-31', 'tablet', 'store in cool dry place'),
('cetirizine', 'tablet', 12.00, 'allergy relief', 'allergy pharma', 250, '2025-10-31', 'tablet', 'keep away from sunlight'),
('metformin', 'tablet', 20.00, 'diabetes management', 'health corp', 350, '2026-03-31', 'tablet', 'store in room temperature'),
('atorvastatin', 'tablet', 30.00, 'cholesterol management', 'cardio labs', 200, '2026-07-31', 'tablet', 'store in cool dry place'),
('omeprazole', 'capsule', 18.00, 'acid reflux treatment', 'gastro pharma', 300, '2025-12-31', 'capsule', 'store below 25°C'),
('azithromycin', 'tablet', 28.00, 'antibiotic for infections', 'medico labs', 150, '2025-11-30', 'tablet', 'keep away from sunlight'),
('salbutamol', 'inhaler', 120.00, 'asthma relief', 'respira pharma', 100, '2026-08-31', 'inhaler', 'store at room temperature'),
('hydrochlorothiazide', 'tablet', 22.00, 'diuretic for hypertension', 'cardio labs', 180, '2026-06-30', 'tablet', 'store in cool dry place');


select * from medications;

truncate table medications;

drop table medications;

-- t4 – doctors(doctor_id, first_name, last_name, specialty, department_id, phone, email, experience_years, qualification, status)

create table doctors (
    doctor_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    specialty varchar(100) not null,
    department_id int,
    phone varchar(15) unique not null,
    email varchar(100) unique not null,
    experience_years int check (experience_years >= 0),
    qualification varchar(100),
    status varchar(20) check (status in ('active', 'inactive', 'on_leave')),
    foreign key (department_id) references departments(department_id)
);


insert into doctors (first_name, last_name, specialty, department_id, phone, email, experience_years, qualification, status) values
('anita', 'rao', 'cardiologist', 1, '9100000001', 'anita.rao@hospital.com', 12, 'md', 'active'),
('vikram', 'singh', 'neurologist', 2, '9100000002', 'vikram.singh@hospital.com', 15, 'md', 'active'),
('meera', 'patel', 'orthopedic', 3, '9100000003', 'meera.patel@hospital.com', 10, 'ms', 'active'),
('rahul', 'kumar', 'pediatrician', 4, '9100000004', 'rahul.kumar@hospital.com', 8, 'md', 'active'),
('sneha', 'desai', 'dermatologist', 5, '9100000005', 'sneha.desai@hospital.com', 9, 'md', 'active'),
('amit', 'sharma', 'radiologist', 6, '9100000006', 'amit.sharma@hospital.com', 14, 'md', 'active'),
('priya', 'joshi', 'gynecologist', 7, '9100000007', 'priya.joshi@hospital.com', 11, 'md', 'active'),
('vikas', 'mehta', 'urologist', 8, '9100000008', 'vikas.mehta@hospital.com', 13, 'ms', 'active'),
('riya', 'patel', 'oncologist', 9, '9100000009', 'riya.patel@hospital.com', 16, 'md', 'active'),
('sahil', 'gupta', 'psychiatrist', 10, '9100000010', 'sahil.gupta@hospital.com', 12, 'md', 'active');


select * from doctors;

truncate table doctors;

drop table doctors;




-- t5 – staff(staff_id, first_name, last_name, role, department_id, contact, email, shift, salary, joining_date)

create table staff (
    staff_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    role varchar(50) not null,
    department_id int,
    contact varchar(15),
    email varchar(100) unique,
    shift varchar(50),
    salary decimal(10,2) check (salary >= 0),
    joining_date date,
    foreign key (department_id) references departments(department_id)
);


insert into staff (first_name, last_name, role, department_id, contact, email, shift, salary, joining_date) values
('rahul', 'verma', 'nurse', 1, '9200000001', 'rahul.verma@hospital.com', 'morning', 25000, '2023-01-15'),
('neha', 'sharma', 'lab technician', 2, '9200000002', 'neha.sharma@hospital.com', 'evening', 22000, '2022-05-20'),
('amit', 'rao', 'receptionist', 3, '9200000003', 'amit.rao@hospital.com', 'morning', 20000, '2021-11-10'),
('sneha', 'desai', 'pharmacist', 5, '9200000004', 'sneha.desai@hospital.com', 'day', 28000, '2022-08-05'),
('vikas', 'kumar', 'nurse', 4, '9200000005', 'vikas.kumar@hospital.com', 'night', 25000, '2023-03-12'),
('priya', 'patel', 'technician', 6, '9200000006', 'priya.patel@hospital.com', 'day', 23000, '2022-09-18'),
('sahil', 'mehta', 'accountant', 7, '9200000007', 'sahil.mehta@hospital.com', 'morning', 27000, '2021-07-22'),
('riya', 'gupta', 'cleaning staff', 8, '9200000008', 'riya.gupta@hospital.com', 'night', 18000, '2023-02-14'),
('manish', 'joshi', 'nurse', 9, '9200000009', 'manish.joshi@hospital.com', 'evening', 25000, '2022-12-01'),
('neelam', 'singh', 'technician', 10, '9200000010', 'neelam.singh@hospital.com', 'day', 23000, '2023-04-10');

select * from staff;

truncate table staff;

drop table staff;


-- t6 – facilities(facility_id, name, type, cost, availability_status, location, capacity, operating_hours, supervisor, last_maintenance)

create table facilities (
    facility_id int primary key auto_increment,
    name varchar(100) not null,
    type varchar(50),
    cost decimal(10,2) check (cost >= 0),
    availability_status varchar(20) check (availability_status in ('available', 'unavailable')),
    location varchar(100),
    capacity int check (capacity >= 0),
    operating_hours varchar(50),
    supervisor int,
    last_maintenance date,
    foreign key (supervisor) references staff(staff_id)
);


insert into facilities (name, type, cost, availability_status, location, capacity, operating_hours, supervisor, last_maintenance) values
('icu', 'critical care', 500000, 'available', 'building a', 10, '24/7', 1, '2025-09-01'),
('operation theatre 1', 'surgery', 300000, 'available', 'building b', 5, '08:00-20:00', 2, '2025-08-15'),
('radiology lab', 'imaging', 200000, 'available', 'building f', 8, '09:00-18:00', 6, '2025-07-20'),
('pharmacy', 'medicine', 100000, 'available', 'building e', 20, '09:00-21:00', 4, '2025-08-10'),
('laboratory', 'testing', 150000, 'available', 'building c', 15, '08:00-20:00', 2, '2025-09-05'),
('mri scan', 'imaging', 250000, 'unavailable', 'building f', 2, '09:00-18:00', 6, '2025-09-12'),
('x-ray room', 'imaging', 120000, 'available', 'building f', 4, '08:00-18:00', 6, '2025-08-25'),
('waiting area', 'general', 50000, 'available', 'building d', 30, '24/7', 3, '2025-09-01'),
('ambulance', 'transport', 200000, 'available', 'building a', 1, '24/7', 5, '2025-09-10'),
('blood bank', 'storage', 180000, 'available', 'building e', 10, '09:00-18:00', 4, '2025-08-30');

select * from facilities;

truncate table facilities;

drop table facilities;

-- t7 – medical_history(history_id, patient_id, diagnosis, treatment, notes, date_recorded, allergies, chronic_conditions, follow_up_required, last_updated)

create table medical_history (
    history_id int primary key auto_increment,
    patient_id int not null,
    diagnosis varchar(255) not null,
    treatment varchar(255),
    notes varchar(500),
    date_recorded date default (current_date),
    allergies varchar(255),
    chronic_conditions varchar(255),
    follow_up_required varchar(10) check (follow_up_required in ('yes', 'no')),
    last_updated date,
    foreign key (patient_id) references patients(patient_id)
);


insert into medical_history (patient_id, diagnosis, treatment, notes, date_recorded, allergies, chronic_conditions, follow_up_required, last_updated) values
(1, 'fever', 'paracetamol 500mg', 'mild fever for 2 days', '2025-09-20', 'none', 'none', 'no', '2025-09-21'),
(2, 'diabetes', 'metformin 500mg', 'type 2 diabetes management', '2025-08-15', 'none', 'diabetes', 'yes', '2025-09-01'),
(3, 'asthma', 'salbutamol inhaler', 'occasional asthma attacks', '2025-07-10', 'pollen', 'asthma', 'yes', '2025-09-05'),
(4, 'hypertension', 'hydrochlorothiazide 25mg', 'high blood pressure control', '2025-06-12', 'none', 'hypertension', 'yes', '2025-08-20'),
(5, 'allergy', 'cetirizine 10mg', 'seasonal allergies', '2025-05-18', 'dust', 'none', 'no', '2025-06-01'),
(6, 'fracture', 'plaster cast', 'broken arm injury', '2025-04-22', 'none', 'none', 'yes', '2025-05-15'),
(7, 'skin rash', 'topical ointment', 'eczema treatment', '2025-03-30', 'latex', 'eczema', 'yes', '2025-04-10'),
(8, 'migraine', 'ibuprofen 400mg', 'chronic migraine', '2025-02-14', 'none', 'migraine', 'yes', '2025-03-01'),
(9, 'cholesterol', 'atorvastatin 10mg', 'high cholesterol', '2025-01-20', 'none', 'hyperlipidemia', 'yes', '2025-02-10'),
(10, 'urinary infection', 'amoxicillin 500mg', 'bladder infection treatment', '2024-12-05', 'none', 'none', 'no', '2024-12-20');


select * from medical_history;

truncate table medical_history;

drop table medical_history;

-- t8 – appointments(appointment_id, patient_id, doctor_id, date, time, status, reason, booking_mode, created_on, updated_on)

create table appointments (
    appointment_id int primary key auto_increment,
    patient_id int not null,
    doctor_id int not null,
    date date not null,
    time time not null,
    status varchar(20) check (status in ('scheduled', 'completed', 'cancelled')),
    reason varchar(255),
    booking_mode varchar(20) check (booking_mode in ('online', 'offline')),
    created_on timestamp default current_timestamp,
    updated_on timestamp default current_timestamp on update current_timestamp,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);


insert into appointments (patient_id, doctor_id, date, time, status, reason, booking_mode, created_on, updated_on) values
(1, 1, '2025-10-05', '10:00:00', 'scheduled', 'fever checkup', 'online', '2025-10-01 09:00:00', '2025-10-01 09:00:00'),
(2, 2, '2025-10-06', '11:00:00', 'scheduled', 'diabetes follow-up', 'offline', '2025-10-01 10:00:00', '2025-10-01 10:00:00'),
(3, 3, '2025-10-07', '12:00:00', 'scheduled', 'asthma consultation', 'online', '2025-10-01 11:00:00', '2025-10-01 11:00:00'),
(4, 4, '2025-10-08', '09:30:00', 'scheduled', 'blood pressure check', 'offline', '2025-10-01 12:00:00', '2025-10-01 12:00:00'),
(5, 5, '2025-10-09', '14:00:00', 'scheduled', 'allergy consultation', 'online', '2025-10-01 13:00:00', '2025-10-01 13:00:00'),
(6, 6, '2025-10-10', '15:00:00', 'scheduled', 'fracture follow-up', 'offline', '2025-10-01 14:00:00', '2025-10-01 14:00:00'),
(7, 7, '2025-10-11', '10:30:00', 'scheduled', 'skin rash consultation', 'online', '2025-10-01 15:00:00', '2025-10-01 15:00:00'),
(8, 8, '2025-10-12', '11:30:00', 'scheduled', 'migraine check', 'offline', '2025-10-01 16:00:00', '2025-10-01 16:00:00'),
(9, 9, '2025-10-13', '13:00:00', 'scheduled', 'cholesterol follow-up', 'online', '2025-10-01 17:00:00', '2025-10-01 17:00:00'),
(10, 10, '2025-10-14', '14:30:00', 'scheduled', 'urinary infection treatment', 'offline', '2025-10-01 18:00:00', '2025-10-01 18:00:00');

select * from appointments;

truncate table appointments;

drop table appointments;

-- t9 – prescriptions(prescription_id, patient_id, doctor_id, medication_id, date_provided, dosage, frequency, duration, notes, next_visit_date)

create table prescriptions (
    prescription_id int primary key auto_increment,
    patient_id int not null,
    doctor_id int not null,
    medication_id int not null,
    date_provided date default (current_date),
    dosage varchar(50),
    frequency varchar(50),
    duration varchar(50),
    notes varchar(255),
    next_visit_date date,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id),
    foreign key (medication_id) references medications(medication_id)
);


insert into prescriptions (patient_id, doctor_id, medication_id, date_provided, dosage, frequency, duration, notes, next_visit_date) values
(1, 1, 1, '2025-10-05', '500mg', '3 times a day', '5 days', 'take after food', '2025-10-12'),
(2, 2, 5, '2025-10-06', '500mg', '2 times a day', '30 days', 'monitor blood sugar', '2025-11-06'),
(3, 3, 9, '2025-10-07', '2 puffs', 'as needed', '10 days', 'use inhaler during attack', '2025-10-17'),
(4, 4, 10, '2025-10-08', '25mg', 'once daily', '30 days', 'take in morning', '2025-11-07'),
(5, 5, 4, '2025-10-09', '10mg', 'once daily', '7 days', 'take before sleep', '2025-10-16'),
(6, 6, 6, '2025-10-10', '10mg', 'once daily', '14 days', 'apply ointment twice daily', '2025-10-24'),
(7, 7, 4, '2025-10-11', '10mg', 'once daily', '10 days', 'avoid sunlight', '2025-10-21'),
(8, 8, 3, '2025-10-12', '400mg', '2 times a day', '5 days', 'take with water', '2025-10-17'),
(9, 9, 6, '2025-10-13', '10mg', 'once daily', '30 days', 'monitor cholesterol', '2025-11-12'),
(10, 10, 2, '2025-10-14', '500mg', '3 times a day', '7 days', 'complete full course', '2025-10-21');

select * from prescriptions;

truncate table prescriptions;

drop table prescriptions;
-- t10 – bills(bill_id, patient_id, total_amount, payment_status, date, payment_mode, discount, tax, due_date, remarks)
  
create table bills (
    bill_id int primary key auto_increment,
    patient_id int not null,
    total_amount decimal(10,2) check (total_amount >= 0),
    payment_status varchar(20) check (payment_status in ('paid', 'pending', 'partial')),
    date date default (current_date),
    payment_mode varchar(20) check (payment_mode in ('cash', 'card', 'online')),
    discount decimal(10,2) default 0 check (discount >= 0),
    tax decimal(10,2) default 0 check (tax >= 0),
    due_date date,
    remarks varchar(255),
    foreign key (patient_id) references patients(patient_id)
);


insert into bills (patient_id, total_amount, payment_status, date, payment_mode, discount, tax, due_date, remarks) values
(1, 500.00, 'paid', '2025-10-05', 'cash', 0, 50.00, '2025-10-12', 'regular checkup'),
(2, 1200.00, 'pending', '2025-10-06', 'online', 100.00, 120.00, '2025-11-06', 'diabetes treatment'),
(3, 800.00, 'paid', '2025-10-07', 'card', 0, 80.00, '2025-10-17', 'asthma consultation'),
(4, 600.00, 'partial', '2025-10-08', 'cash', 50.00, 60.00, '2025-11-07', 'blood pressure check'),
(5, 450.00, 'paid', '2025-10-09', 'online', 0, 45.00, '2025-10-16', 'allergy consultation'),
(6, 700.00, 'pending', '2025-10-10', 'card', 0, 70.00, '2025-10-24', 'fracture follow-up'),
(7, 500.00, 'paid', '2025-10-11', 'cash', 0, 50.00, '2025-10-21', 'skin rash treatment'),
(8, 650.00, 'partial', '2025-10-12', 'online', 0, 65.00, '2025-10-17', 'migraine check'),
(9, 900.00, 'paid', '2025-10-13', 'card', 50.00, 90.00, '2025-11-12', 'cholesterol management'),
(10, 550.00, 'pending', '2025-10-14', 'cash', 0, 55.00, '2025-10-21', 'urinary infection treatment');

select * from bills;

truncate table bills;

drop table bills;



-- B. Queries:

-- Select: Perform select queries to retrieve specific records.


-- Retrieve all patients above 30 years old:
select * from patients
where age > 30;

-- List all doctors in the cardiology department:
select first_name, last_name, specialty
from doctors
where department_id = 1;

-- Show all appointments scheduled for a specific date:
select a.appointment_id, p.first_name, p.last_name, d.first_name as doctor_first, d.last_name as doctor_last, a.date, a.time
from appointments a
join patients p on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id
where a.date = '2025-10-05';

-- List all bills that are pending payment:
select bill_id, patient_id, total_amount, payment_status, due_date
from bills
where payment_status = 'pending';

-- Rename: Rename one table and an attribute within a table.

-- Rename table staff to hospital_staff:
rename table staff to hospital_staff;

--  Rename column contact in patients table to phone:
alter table patients
change column contact phone varchar(15);


-- 3. Rename column 'total_amount' in bills to 'amount'
alter table bills
change column total_amount amount decimal(10,2);

-- 4. Rename table 'medical_history' to 'patient_medical_history'
rename table medical_history to patient_medical_history;

-- 5. Rename column 'date' in appointments to 'appointment_date'
alter table appointments
change column date appointment_date date;


-- Update: Update specific records in at least two tables.

-- 1. Update patient’s contact information
update patients
set phone = '9876543210', address = '456 new colony, city'
where patient_id = 3;

-- 2. Update doctor status to 'on_leave'
update doctors
set status = 'on_leave'
where doctor_id = 5;

-- 3. Update bill status to 'paid' after payment
update bills
set payment_status = 'paid'
where bill_id = 2;

-- 4. Update facility availability
update facilities
set availability_status = 'unavailable'
where facility_id = 6;

-- 5. Update staff shift timing
update hospital_staff
set shift = 'night'
where staff_id = 4;


-- Alter: Add, modify, or drop a column in any table.

-- 1. Add new column 'emergency_email' to patients table
alter table patients
add column emergency_email varchar(100);

-- 2. Add column 'rating' to doctors table
alter table doctors
add column rating decimal(3,2) default 0.0;

-- 3. Modify column 'salary' datatype in hospital_staff
alter table hospital_staff
modify column salary decimal(10,2);

-- 4. Drop column 'discount' from bills table
alter table bills
drop column discount;

-- 5. Add new column 'room_number' to appointments table
alter table appointments
add column room_number varchar(10);


-- Delete: Demonstrate the deletion of specific records.

-- 1. Delete a specific patient record
delete from patients
where patient_id = 10;

-- 2. Delete all cancelled appointments
delete from appointments
where status = 'cancelled';

-- 3. Delete bills that are fully paid
delete from bills
where payment_status = 'paid';

-- 4. Delete facility records marked as unavailable
delete from facilities
where availability_status = 'unavailable';

-- 5. Delete medical history entries older than one year
delete from medical_history
where date_recorded < '2024-01-01';

/*
C. Constraints & Clauses:

Apply constraints like Primary Key, Foreign Key, NOT NULL, UNIQUE, CHECK, DEFAULT.
Use clauses like WHERE, GROUP BY, HAVING, ORDER BY, LIMIT to extract meaningful insights.

*/

-- constraints:

-- (a) primary key
create table patients (
    patient_id int primary key,
    name varchar(50),
    age int,
    gender varchar(10),
    phone varchar(15)
);

-- (b) foreign key
create table appointments (
    appointment_id int primary key,
    patient_id int,
    doctor_id int,
    date date,
    time time,
    status varchar(20),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- (c) not null
create table doctors (
    doctor_id int primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    specialty varchar(50) not null
);

-- (d) unique
create table staff (
    staff_id int primary key,
    name varchar(50),
    email varchar(100) unique,
    phone varchar(15) unique
);

-- (e) check
create table bills (
    bill_id int primary key,
    total_amount decimal(10,2) check (total_amount > 0),
    payment_status varchar(20)
);

-- (f) default
create table facilities (
    facility_id int primary key,
    name varchar(50),
    type varchar(50),
    cost decimal(10,2),
    availability_status varchar(20) default 'available'
);

-- clauses:

-- (a) where clause
select * from patients
where age < 25;

-- (b) group by clause
select doctor_id, count(*) as total_appointments
from appointments
group by doctor_id;

-- (c) having clause
select doctor_id, count(*) as total_appointments
from appointments
group by doctor_id
having count(*) > 5;

-- (d) order by clause
select first_name as name, age
from patients
order by age desc;


select * from patients;


-- (e) limit clause
select * from bills
order by total_amount desc
limit 3;


-- D. SQL_SAFE_UPDATES:

-- Implement and demonstrate the use of SQL_SAFE_UPDATES to prevent accidental record deletions or modifications.

-- enable safe updates mode
set sql_safe_updates = 1;

-- now, try updating without a where clause (this will throw an error)
update patients
set age = 40;


-- perform safe update with a where clause
update patients
set age = 40
where patient_id = 2;



-- try deleting without where clause (this will throw an error)
delete from patients;


-- delete safely using a where condition
delete from patients
where patient_id = 10;


-- if you really need to disable safe updates temporarily
set sql_safe_updates = 0;

-- now you can perform unrestricted updates or deletions (use with caution)
update doctors
set status = 'retired';


-- finally, re-enable safe updates for safety
set sql_safe_updates = 1;

-- part e & f: built-in functions, real-life queries, operators, alias concepts

-- 1. built-in functions examples

-- string functions
select upper(first_name) as uppercase_name from patients;

select concat(first_name, ' ', last_name) as full_name from doctors;

select length(last_name) as name_length from patients;

select substring(address, 1, 15) as short_address from patients;

select replace(gender, 'male', 'm') as short_gender from patients;

-- numeric functions
select round(total_amount, 0) as rounded_amount from bills;

select ceil(cost) as rounded_up_cost from facilities;

select floor(price) as rounded_down_price from medications;

select abs(total_amount - 5000) as amount_difference from bills;

select mod(total_amount, 2) as even_odd_amount from bills;

-- date and time functions
select now() as current_datetime;

select curdate() as today_date;

select datediff(curdate(), date) as days_since_bill from bills;

select date_add(appointment_date, interval 7 day) as next_followup_date from appointments;

select year(appointment_date) as appointment_year from appointments;

-- aggregate functions
select count(*) as total_patients from patients;

select avg(age) as average_age from patients;

select sum(total_amount) as total_revenue from bills;

select min(total_amount) as lowest_bill from bills;

select max(total_amount) as highest_bill from bills;

-- 2. real-life practical queries

-- scheduling a patient's next appointment
insert into appointments (patient_id, doctor_id, appointment_date, time, status)
values (3, 2, date_add(curdate(), interval 7 day), '10:30:00', 'scheduled');

-- retrieving a patient’s medical history
select p.first_name, m.diagnosis, m.treatment, m.notes
from patients p
join patient_medical_history m on p.patient_id = m.patient_id
where p.patient_id = 3;

-- listing all doctors in a specific department
select d.doctor_id, d.first_name, d.last_name, dep.name as department_name
from doctors d
join departments dep on d.department_id = dep.department_id
where dep.name = 'cardiology';

-- generating a billing report for a patient
select b.bill_id, p.first_name, b.total_amount, b.payment_status, b.date, b.tax
from bills b
join patients p on b.patient_id = p.patient_id
where p.patient_id = 2;

-- calculating average bill amount by payment status
select payment_status, avg(total_amount) as avg_bill
from bills
group by payment_status;

-- 3. operators and alias concepts

-- arithmetic operators
select total_amount + tax as total_with_tax from bills;

select cost * 2 as double_cost from facilities;

select total_amount / 2 as half_amount from bills;

select total_amount % 2 as remainder_check from bills;

-- comparison operators
select * from patients where age > 40;

select * from bills where total_amount >= 5000;

select * from doctors where specialty = 'cardiology';

select * from facilities where cost <> 0;

select * from patients where gender != 'female';

-- logical operators
select * from patients where age > 25 and gender = 'female';

select * from doctors where specialty = 'orthopedic' or status = 'active';

select * from bills where not payment_status = 'paid';

select * from patients where age between 20 and 50;

select * from medications where type in ('tablet', 'capsule');

-- alias examples
select name as patient_name, age as years from patients;

select concat(first_name, ' ', last_name) as doctor_name from doctors;

select total_amount as bill_total, payment_status as status from bills;

select d.name as dept_name, f.name as facility_name from departments d join facilities f;

select p.first_name as patient, a.appointment_date as date from patients p join appointments a;

-- 4. using functions in combination

select p.first_name, count(a.appointment_id) as total_visits, avg(b.total_amount) as avg_bill
from patients p
join appointments a on p.patient_id = a.patient_id
join bills b on p.patient_id = b.patient_id
group by p.first_name
having avg(b.total_amount) > 1000
order by total_visits desc
limit 5;

