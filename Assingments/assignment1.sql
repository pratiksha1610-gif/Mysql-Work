/*
 Part A : 30 Real world Databases:-
----------------------------------------------------------------------------------------------

1. Hospital Management System
Patient (id, name, dob, gender, contact, address)
Doctor (id, name, specialization, contact, email)
Appointment (id, patient_id, doctor_id, date, time)
Billing (id, patient_id, amount, payment_method, date)
Medical_Record (id, patient_id, diagnosis, prescription, date)

2. Airline Reservation System
Flight (id, flight_no, origin, destination, departure_time)
Passenger (id, name, dob, passport_no, contact)
Booking (id, passenger_id, flight_id, seat_no, booking_date)
Ticket (id, booking_id, price, class, status)
Crew (id, name, role, contact, flight_id)

3. College/University Management
Student (id, name, dob, gender, email, phone)
Faculty (id, name, department, email, phone)
Course (id, name, credits, department, semester)
Enrollment (id, student_id, course_id, grade, year)
Department (id, name, head, building, contact)

4. Banking System
Customer (id, name, dob, contact, address)
Account (id, customer_id, type, balance, branch)
Transaction (id, account_id, amount, type, date)
Loan (id, customer_id, amount, interest_rate, status)
Branch (id, name, location, manager, contact)

5. Online Shopping Platform (E-Commerce)
Customer (id, name, email, phone, address)
Product (id, name, category, price, stock)
Order (id, customer_id, total_amount, status, date)
Order_Item (id, order_id, product_id, quantity, price)
Payment (id, order_id, method, status, date)

6. Library Management System
Book (id, title, author, genre, isbn)
Member (id, name, email, phone, address)
Loan (id, book_id, member_id, issue_date, return_date)
Staff (id, name, role, email, contact)
Fine (id, member_id, amount, reason, date)

7. Hotel Booking System
Hotel (id, name, location, rating, contact)
Room (id, hotel_id, type, price, status)
Guest (id, name, email, phone, address)
Booking (id, guest_id, room_id, check_in, check_out)
Payment (id, booking_id, amount, method, status)

8. Restaurant Management System
Menu_Item (id, name, category, price, availability)
Customer (id, name, phone, email, address)
Order (id, customer_id, total, status, date)
Order_Item (id, order_id, menu_item_id, quantity, price)
Staff (id, name, role, phone, shift)

9. Vehicle Rental Service
Vehicle (id, type, model, reg_no, status)
Customer (id, name, license_no, phone, address)
Rental (id, customer_id, vehicle_id, start_date, end_date)
Payment (id, rental_id, amount, method, status)
Maintenance (id, vehicle_id, type, cost, date)

10. Fitness & Gym Membership System
Member (id, name, email, phone, address)
Trainer (id, name, specialty, phone, email)
Membership (id, member_id, type, start_date, end_date)
Workout_Plan (id, member_id, trainer_id, schedule, goal)
Payment (id, membership_id, amount, method, date)

11. School Management System
Student (id, name, dob, gender, class)
Teacher (id, name, subject, phone, email)
Class (id, name, teacher_id, room, section)
Exam (id, class_id, subject, date, max_marks)
Result (id, student_id, exam_id, marks, grade)

12. Pharmacy Management System
Medicine (id, name, brand, price, stock)
Customer (id, name, phone, email, address)
Prescription (id, customer_id, doctor_name, date, details)
Sale (id, customer_id, medicine_id, quantity, total)
Supplier (id, name, contact, address, email)

13. Movie Ticket Booking System
Movie (id, title, genre, duration, rating)
Theatre (id, name, location, contact, capacity)
Show (id, movie_id, theatre_id, date, time)
Customer (id, name, phone, email, address)
Booking (id, customer_id, show_id, seat_no, status)

14. Courier & Logistics Management
Shipment (id, tracking_no, origin, destination, status)
Customer (id, name, phone, email, address)\
Staff (id, name, role, contact, branch)
Delivery (id, shipment_id, staff_id, date, status)
Payment (id, shipment_id, amount, method, date)

15. Event Management System
Event (id, name, date, location, organizer)
Attendee (id, name, email, phone, address)
Ticket (id, event_id, price, type, status)
Vendor (id, name, service, contact, email)
Staff (id, name, role, phone, shift)

16. Social Media Platform
User (id, username, email, password, join_date)
Post (id, user_id, content, date, likes)
Comment (id, post_id, user_id, content, date)
Friendship (id, user_id, friend_id, status, since)
Message (id, sender_id, receiver_id, content, date)

17. E-Learning Platform
User (id, name, email, password, role)
Course (id, title, description, price, instructor_id)
Lesson (id, course_id, title, content, duration)
Enrollment (id, user_id, course_id, date, status)
Quiz (id, course_id, title, total_marks, passing_marks)

18. Real Estate Management System
Property (id, type, location, price, status)
Owner (id, name, phone, email, address)
Agent (id, name, phone, email, license_no)
Transaction (id, property_id, buyer_id, price, date)
Buyer (id, name, phone, email, address)

19. Government Employee Records
Employee (id, name, department, designation, salary)
Department (id, name, head, location, budget)
Leave (id, employee_id, start_date, end_date, reason)
Transfer (id, employee_id, from_dept, to_dept, date)
Pension (id, employee_id, amount, start_date, status)

20. Inventory Management System
Product (id, name, category, stock, price)
Supplier (id, name, contact, address, email)
Purchase (id, product_id, supplier_id, quantity, date)
Sale (id, product_id, quantity, date, customer_id)
Customer (id, name, phone, email, address)

21. Water Supply Billing System
Customer (id, name, address, phone, email)
Meter (id, customer_id, meter_no, installation_date, status)
Reading (id, meter_id, date, units, amount)
Bill (id, customer_id, amount, due_date, status)
Payment (id, bill_id, amount, method, date)

22. Electricity Billing System
Customer (id, name, address, phone, email)
Meter (id, customer_id, meter_no, installation_date, status)
Reading (id, meter_id, date, units, amount)
Bill (id, customer_id, amount, due_date, status)
Payment (id, bill_id, amount, method, date)

23. Job Recruitment Portal
Employer (id, name, company, phone, email)
Job (id, employer_id, title, description, salary)
Applicant (id, name, phone, email, resume)
Application (id, applicant_id, job_id, date, status)
Interview (id, application_id, date, interviewer, result)

24. Insurance Management System
Customer (id, name, phone, email, address)
Policy (id, customer_id, type, premium, coverage)
Claim (id, policy_id, date, amount, status)
Agent (id, name, phone, email, branch)
Payment (id, policy_id, amount, method, date)

25. Public Transport Ticketing System
Route (id, origin, destination, distance, fare)
Bus (id, route_id, reg_no, capacity, status)
Passenger (id, name, phone, email, address)
Ticket (id, passenger_id, bus_id, date, seat_no)
Payment (id, ticket_id, amount, method, date)

26. Customer Relationship Management (CRM)
Customer (id, name, email, phone, address)
Interaction (id, customer_id, type, date, notes)
Lead (id, name, contact, source, status)
Opportunity (id, lead_id, value, stage, close_date)
Sales (id, customer_id, product, amount, date)

27. Food Delivery Platform
Restaurant (id, name, location, phone, email)
Menu_Item (id, restaurant_id, name, price, category)
Customer (id, name, phone, email, address)
Order (id, customer_id, restaurant_id, total, date)
Delivery (id, order_id, delivery_person, status, time)

28. Travel & Tour Package Booking
Package (id, name, destination, price, duration)
Customer (id, name, phone, email, address)
Booking (id, customer_id, package_id, date, status)
Payment (id, booking_id, amount, method, date)
Guide (id, name, phone, email, language)

29. Warehouse Management System
Warehouse (id, name, location, capacity, manager)
Product (id, name, category, stock, price)
Stock_Movement (id, product_id, warehouse_id, quantity, date)
Supplier (id, name, contact, address, email)
Order (id, supplier_id, product_id, quantity, date)

30. Sports Tournament Management
Tournament (id, name, start_date, end_date, location)
Team (id, name, coach, contact, city)
Player (id, name, team_id, position, age)
Match (id, tournament_id, team1_id, team2_id, date)
Score (id, match_id, team_id, points, result)

*/

-- Part B : In-Depth Focus Task:-

create database sport_turnament;

use sport_turnament;



-- 1) Tournaments
CREATE TABLE tournaments (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  location VARCHAR(50) NOT NULL,
  CHECK (end_date >= start_date)
);


INSERT INTO tournaments VALUES
(1, 'Summer Cup', '2025-06-01', '2025-06-15', 'Delhi'),
(2, 'Winter League', '2025-12-01', '2025-12-10', 'Mumbai'),
(3, 'Champions Trophy', '2025-03-05', '2025-03-20', 'Bangalore'),
(4, 'State Cup', '2025-07-10', '2025-07-25', 'Chennai'),
(5, 'National Games', '2025-09-01', '2025-09-20', 'Kolkata'),
(6, 'Friendly Series', '2025-04-01', '2025-04-05', 'Pune'),
(7, 'Monsoon Cup', '2025-08-15', '2025-08-30', 'Goa'),
(8, 'Legends Trophy', '2025-11-01', '2025-11-15', 'Hyderabad'),
(9, 'City League', '2025-05-01', '2025-05-10', 'Ahmedabad'),
(10,'Youth Championship', '2025-10-01', '2025-10-12', 'Jaipur'),
(11, ' monsoon cup', '2025-12-12','2025-11-23','udaypur');

select * from tournaments;


truncate table tournaments;

drop table tournaments;

-- 2) Teams
CREATE TABLE teams (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  coach VARCHAR(50),
  contact VARCHAR(15),
  city VARCHAR(50)
);

INSERT INTO teams VALUES
(1, 'Delhi Dragons', 'Ravi Kumar', '9876543210', 'Delhi'),
(2, 'Mumbai Warriors', 'Amit Sharma', '9876000001', 'Mumbai'),
(3, 'Bangalore Bulls', 'Rakesh Rao', '9876000002', 'Bangalore'),
(4, 'Chennai Challengers', 'Suresh Iyer', '9876000003', 'Chennai'),
(5, 'Kolkata Kings', 'Rahul Sen', '9876000004', 'Kolkata'),
(6, 'Pune Panthers', 'Vikas Joshi', '9876000005', 'Pune'),
(7, 'Goa Gladiators', 'Manoj Patil', '9876000006', 'Goa'),
(8, 'Hyderabad Hawks', 'Naveen Reddy', '9876000007', 'Hyderabad'),
(9, 'Ahmedabad Aces', 'Kunal Shah', '9876000008', 'Ahmedabad'),
(10,'Jaipur Jaguars', 'Prakash Singh', '9876000009', 'Jaipur');

select * from teams;

truncate table teams;

drop table teams;

-- 3) Players
CREATE TABLE players (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  team_id INT,
  position VARCHAR(30),
  age INT CHECK (age > 0),
  FOREIGN KEY (team_id) REFERENCES teams(id)
);

INSERT INTO players VALUES
(1, 'Arjun Mehta', 1, 'Forward', 24),
(2, 'Rohit Kumar', 1, 'Defender', 26),
(3, 'Sameer Khan', 2, 'Forward', 23),
(4, 'Vivek Sharma', 2, 'Midfielder', 25),
(5, 'Ajay Rao', 3, 'Forward', 27),
(6, 'Rohan Patil', 3, 'Goalkeeper', 28),
(7, 'Sahil Gupta', 4, 'Defender', 22),
(8, 'Amit Desai', 4, 'Forward', 24),
(9, 'Karan Verma', 5, 'Midfielder', 25),
(10,'Neeraj Joshi', 5, 'Forward', 26);

select * from players;

truncate table players;

drop table players;

-- 4) Matches  
CREATE TABLE matches (
  id INT PRIMARY KEY,
  tournament_id INT NOT NULL,
  team1_id INT NOT NULL,
  team2_id INT NOT NULL,
  match_date DATE NOT NULL,
  FOREIGN KEY (tournament_id) REFERENCES tournaments(id),
  FOREIGN KEY (team1_id) REFERENCES teams(id),
  FOREIGN KEY (team2_id) REFERENCES teams(id),
  CHECK (team1_id <> team2_id)
);

create table cars(
	id int primary key,
    tournament_id int not null,
    team1_id int not null,
	team2_id int not null,
    match_date date not null,
    foreign key (tournament_id) references tournament(id),
    foreign key (team1_id) references tournament(id)
    );
    
INSERT INTO matches VALUES
(1, 1, 1, 2, '2025-06-02'),
(2, 1, 3, 4, '2025-06-03'),
(3, 2, 5, 6, '2025-12-02'),
(4, 2, 7, 8, '2025-12-03'),
(5, 3, 9,10, '2025-03-06'),
(6, 3, 1, 3, '2025-03-07'),
(7, 4, 2, 4, '2025-07-11'),
(8, 4, 5, 7, '2025-07-12'),
(9, 5, 6, 8, '2025-09-02'),
(10,5, 9,10, '2025-09-03');

select * from matches;

truncate table matches;

drop table matches;

-- 5) Scores 

CREATE TABLE scores (
  id INT PRIMARY KEY,
  match_id INT NOT NULL,
  team_id INT NOT NULL,
  points INT NOT NULL,
  result ENUM('Win','Loss','Draw') NOT NULL,
  FOREIGN KEY (match_id) REFERENCES matches(id),
  FOREIGN KEY (team_id) REFERENCES teams(id),
  UNIQUE KEY uniq_match_team (match_id, team_id),
  CHECK (points >= 0)
);

INSERT INTO scores VALUES
(1,  1, 1, 3, 'Win'),
(2,  1, 2, 1, 'Loss'),
(3,  2, 3, 2, 'Win'),
(4,  2, 4, 0, 'Loss'),
(5,  3, 5, 1, 'Draw'),
(6,  3, 6, 1, 'Draw'),
(7,  4, 7, 4, 'Win'),
(8,  4, 8, 2, 'Loss'),
(9,  5, 9, 0, 'Loss'),
(10, 5,10, 3, 'Win');

select * from scores;

truncate table scores;

drop table scores;


