/* Assignment-3

•	Database Concepts

1.	What is a Database?
A database is an organized collection of data that can be easily accessed, managed, and updated.
It stores information in a structured format, often in tables, so that data can be retrieved efficiently.

•	Example:
A school database may store student records (name, roll number, marks, etc.) in a table.

________________________________________

2.	What is the Difference Between a Database and a DBMS?

Feature	Database	DBMS (Database Management System)
Definition	Collection of data	Software that manages and interacts with the database
Function	Stores data	Allows users to insert, update, delete, and query data
Example	A file containing student records	MySQL, Oracle, PostgreSQL, MS Access

•	In short:
Database = Data
DBMS = Tool to manage data

________________________________________

3.	What are the Different Types of Databases?

1.	Relational Database (RDBMS): Data stored in tables (rows and columns).
→ Example: MySQL, Oracle
2.	NoSQL Database: For unstructured or semi-structured data.
→ Example: MongoDB, Cassandra
3.	Hierarchical Database: Data stored in tree-like structure.
→ Example: IBM Information Management System (IMS)
4.	Network Database: Data represented as a network of records.
→ Example: Integrated Data Store (IDS)
5.	Object-Oriented Database: Stores objects used in programming.
→ Example: db4o

________________________________________

4.	What is a Relational Database?
A relational database stores data in the form of tables (relations) consisting of rows and columns.
Each row represents a record, and each column represents an attribute.
Tables are related to each other using keys (primary, foreign).

•	Example:
A Student table can be related to a Department table through a department_id (foreign key).

________________________________________

5.	What is Normalization? Explain its Types.

Normalization is the process of organizing data in a database to reduce redundancy (duplication) and improve data integrity.
Types of Normal Forms:
1.	1NF (First Normal Form):
o	Each cell contains a single value.
o	No repeating groups or arrays.
2.	2NF (Second Normal Form):
o	Must be in 1NF.
o	No partial dependency (every non-key attribute depends on the whole primary key).
3.	3NF (Third Normal Form):
o	Must be in 2NF.
o	No transitive dependency (non-key attribute should not depend on another non-key attribute).
4.	(Optional advanced) BCNF (Boyce-Codd Normal Form):
o	Stronger form of 3NF; each determinant must be a candidate key.
o	
________________________________________

6.	What is Denormalization?
Denormalization is the process of combining normalized tables into larger tables to improve query performance (reduce joins), even if it increases redundancy.
•	Example:
Combining Student and Department tables into one to fetch data faster.

________________________________________






7.	What is a Primary Key? How is it Different from a Unique Key?
Feature	Primary Key	Unique Key
Purpose	Uniquely identifies each record	Ensures uniqueness of a column
Null Values	Not allowed	One NULL allowed
Per Table	Only one primary key	Multiple unique keys possible
•	Example:
In a Student table,
•	student_id → Primary Key
•	email → Unique Key
________________________________________

8.	What is a Foreign Key?
A foreign key is a field in one table that refers to the primary key in another table.
It is used to maintain referential integrity between tables.

•	Example:
Student(student_id, name, dept_id)
Department(dept_id, dept_name)
Here, dept_id in Student is a foreign key referencing Department.

________________________________________

9.	What are Indexes? Why are They Used?
An index is a data structure that improves the speed of data retrieval from a database table.
It works like an index in a book — helping find information faster without scanning every row.

•	Example:
CREATE INDEX idx_student_name ON Student(name);
This speeds up queries searching by student name.

________________________________________

10.	What is a Composite Key?
A composite key is a combination of two or more columns used together to uniquely identify a record in a table.
• Example:
In a Course_Enrollment table:

________________________________________________________________________________________________________

•	 MySQL Commands

(11) What is the purpose of the CREATE command?
The CREATE command is used to create new database objects such as databases, tables, or indexes.
• Example:
CREATE DATABASE school;
CREATE TABLE students (id INT, name VARCHAR(50));
_________________________________________________________________________________________________________________

(12) How do you delete a database in MySQL?
The DROP DATABASE command is used to delete an existing database.
• Example:
DROP DATABASE school;
__________________________________________________________________________________________________________________

(13) What is the ALTER command used for?
The ALTER command is used to modify the structure of an existing table.
You can add, modify, or delete columns.
• Examples:
ALTER TABLE students ADD age INT;
ALTER TABLE students MODIFY name VARCHAR(100);
ALTER TABLE students DROP COLUMN age;
____________________________________________________________________________________________________________________

(14) How do you create a table in MySQL?
Use the CREATE TABLE command to create a new table.
• Syntax:
CREATE TABLE table_name (
  column1 datatype,
  column2 datatype,
  ...
);
• Example:
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  city VARCHAR(30)
);
____________________________________________________________________________________________________

(15) What is the DROP command?
The DROP command is used to permanently delete database objects such as tables or databases.
• Examples:
DROP TABLE students;
DROP DATABASE school;
_____________________________________________________________________________________________________

(16) How do you insert data into a table?
The INSERT INTO command is used to add new data to a table.
• Syntax:
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
• Example:
INSERT INTO students (id, name, age, city)
VALUES (1, 'Ravi', 20, 'Pune');
__________________________________________________________________________________________________________

(17) What is the syntax for updating records in a table?
The UPDATE command is used to modify existing records in a table.
• Syntax:
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
• Example:
UPDATE students
SET city = 'Mumbai'
WHERE id = 1;
____________________________________________________________________________________________________________

(18) How do you delete records from a table?
The DELETE command is used to remove records from a table.
• Syntax:
DELETE FROM table_name WHERE condition;
• Example:
DELETE FROM students WHERE id = 1;
If you want to remove all records but keep the table:
DELETE FROM students;
__________________________________________________________________________________________________________

(19) What is the SELECT statement used for?
The SELECT statement is used to retrieve data from one or more tables.
• Syntax:
SELECT column1, column2 FROM table_name;
• Examples:
SELECT name, city FROM students;
SELECT * FROM students;
_________________________________________________________________________________________________

(20) How do you retrieve unique records from a table?
The DISTINCT keyword is used with SELECT to get unique values without duplicates.
• Syntax:
SELECT DISTINCT column_name FROM table_name;
• Example:
SELECT DISTINCT city FROM students;
_______________________________________________________________________________________________________

• Clauses and Operators

(21) What is the purpose of the WHERE clause?
The WHERE clause is used to filter records based on a specific condition.
It helps to retrieve only the rows that meet the given criteria.
• Example:
SELECT * FROM students WHERE city = 'Pune';
_________________________________________________________________________________________________________

(22) Explain the ORDER BY clause.
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order.
• Syntax:
SELECT * FROM table_name ORDER BY column_name [ASC|DESC];
• Example:
SELECT * FROM students ORDER BY name ASC;
SELECT * FROM students ORDER BY age DESC;
________________________________________________________________________________________________________

(23) What is the GROUP BY clause used for?
The GROUP BY clause groups rows that have the same values in one or more columns.
It is often used with aggregate functions like COUNT(), SUM(), AVG(), MAX(), MIN().
• Example:
SELECT city, COUNT(*) 
FROM students 
GROUP BY city;
_______________________________________________________________________________________________________

(24) How do you use the HAVING clause?
The HAVING clause is used to filter the results of groups created by the GROUP BY clause.
It works like a WHERE clause but is used for grouped data.
• Example:
SELECT city, COUNT(*) 
FROM students 
GROUP BY city 
HAVING COUNT(*) > 5;
____________________________________________________________________________________________________

(25) What are the different comparison operators in MySQL?
Comparison operators are used to compare values in SQL statements.
Operator	Description	Example
=	Equal to	age = 20
!= or <>	Not equal to	age <> 18
>	Greater than	age > 18
<	Less than	age < 18
>=	Greater than or equal to	age >= 18
<=	Less than or equal to	age <= 18
• Example:
SELECT * FROM students WHERE age >= 18;
_______________________________________________________________________________________________

(26) What is the BETWEEN operator?
The BETWEEN operator is used to select values within a specific range.
The range includes both start and end values.
• Syntax:
SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;
• Example:
SELECT * FROM students WHERE age BETWEEN 18 AND 25;
_________________________________________________________________________________________

(27) Explain the LIKE operator.
The LIKE operator is used to search for a specified pattern in a column.
It is often used with wildcards:
% represents zero or more characters
_ represents a single character
• Examples:
SELECT * FROM students WHERE name LIKE 'A%';   -- names starting with A
SELECT * FROM students WHERE name LIKE '%a';   -- names ending with a
SELECT * FROM students WHERE name LIKE '_a%';  -- second letter is 'a'
__________________________________________________________________________________________________________

(28) What is the IN operator?
The IN operator is used to match a value against a list of possible values.
• Syntax:
SELECT * FROM table_name WHERE column_name IN (value1, value2, ...);
• Example:
SELECT * FROM students WHERE city IN ('Pune', 'Mumbai', 'Delhi');
_____________________________________________________________________________________________________

(29) How do you use the NULL operator?
The NULL operator is used to test whether a column has a NULL value.
• Examples:
SELECT * FROM students WHERE age IS NULL;
SELECT * FROM students WHERE age IS NOT NULL;
_____________________________________________________________________________________________________

(30) What is the difference between AND and OR operators?
Operator	Description	Example
AND	Returns records only if all conditions are true	WHERE city='Pune' AND age>18
OR	Returns records if any one condition is true	WHERE city='Pune' OR city='Mumbai'
• Example:
SELECT * FROM students WHERE city='Pune' AND age>18;
SELECT * FROM students WHERE city='Pune' OR city='Mumbai';
_____________________________________________________________________________________________________

•	Predefined Functions

(31) What are aggregate functions? Give examples.
Aggregate functions perform calculations on a set of values and return a single result.
They are often used with the GROUP BY clause.
Common aggregate functions:
COUNT() – Counts the number of rows
SUM() – Adds up all values
AVG() – Calculates the average
MAX() – Finds the highest value
MIN() – Finds the lowest value
• Example:
SELECT COUNT(*), AVG(age), MAX(age), MIN(age)
FROM students;
___________________________________________________________________________________________

(32) What is the COUNT() function?
The COUNT() function returns the number of rows that match a specified condition.
• Examples:
SELECT COUNT(*) FROM students;               -- total number of students
SELECT COUNT(city) FROM students;            -- counts non-null cities
SELECT COUNT(*) FROM students WHERE city='Pune';  -- counts students from Pune
_____________________________________________________________________________
(33) Explain the SUM() function.
The SUM() function adds up all numeric values in a column.
• Example:
SELECT SUM(marks) FROM students;             -- total marks of all students
SELECT SUM(salary) FROM employees WHERE dept='IT';
________________________________________________________________________________________________

(34) What is the AVG() function?
The AVG() function returns the average (mean) value of a numeric column.
• Example:
SELECT AVG(age) FROM students;
SELECT AVG(salary) FROM employees WHERE dept='HR';
________________________________________________________________________________________________

(35) How does the MAX() function work?
The MAX() function returns the highest value from a column.
• Example:
SELECT MAX(marks) FROM students;             -- highest marks
SELECT MAX(salary) FROM employees;           -- highest salary
______________________________________________________________________________________________
(36) What is the MIN() function?
The MIN() function returns the smallest value from a column.
• Example:
SELECT MIN(age) FROM students;               -- youngest student
SELECT MIN(salary) FROM employees;           -- lowest salary
_____________________________________________________________________________________________

(37) Explain string functions in MySQL.
String functions are used to manipulate text or character data in MySQL.
Common string functions:
LENGTH(str) – Returns the length of a string
UPPER(str) or UCASE(str) – Converts to uppercase
LOWER(str) or LCASE(str) – Converts to lowercase
CONCAT(str1, str2, …) – Joins two or more strings
SUBSTRING(str, start, length) – Extracts part of a string
TRIM(str) – Removes spaces from both ends
• Example:
SELECT UPPER(name), LENGTH(name) FROM students;
_____________________________________________________________________________________

(38) What is the CONCAT() function?
The CONCAT() function joins two or more strings into one.
• Syntax:
CONCAT(string1, string2, ...)
• Example:
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM students;
________________________________________________________________________________________

(39) How do you use the SUBSTRING() function?
The SUBSTRING() function extracts a part of a string starting from a given position.
• Syntax:
SUBSTRING(string, start, length)
• Examples:
SELECT SUBSTRING('Database', 1, 4);     -- Output: 'Data'
SELECT SUBSTRING(name, 2, 3) FROM students;
_________________________________________________________________________________________

(40) What is the NOW() function?
The NOW() function returns the current system date and time.
• Examples:
SELECT NOW();                           -- Shows current date and time
INSERT INTO log_table (entry_time) VALUES (NOW());
___________________________________________________________________________________________

(5) User-Defined Functions (UDF)
(41) What is a user-defined function (UDF) in MySQL?
A user-defined function (UDF) is a custom function created by the user to perform specific operations and return a value.
_______________________________________________________________________________________
(42) How do you create a UDF?
You can create a function using the CREATE FUNCTION statement.
• Example:
DELIMITER //
CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
BEGIN
  RETURN a + b;
END;
//
DELIMITER ;
_______________________________________________________________________________________
(43) What is the syntax for calling a UDF?
You can call a function inside a SQL query using SELECT.
• Example:
SELECT add_numbers(10, 20);
_______________________________________________________________________________________
(44) Can UDFs return multiple values?
No, a UDF can return only one single value at a time.
_______________________________________________________________________________________
(45) What are the advantages of using UDFs?
Reusability of logic
Easier maintenance
Increases readability of SQL code
Reduces repetition of complex calculations
_______________________________________________________________________________________
(6) Views
(46) What is a view in MySQL?
A view is a virtual table based on the result of a SQL query.
It does not store data physically but displays data from one or more tables.
_______________________________________________________________________________________
(47) How do you create a view?
• Syntax:
CREATE VIEW view_name AS
SELECT column1, column2 FROM table_name WHERE condition;
• Example:
CREATE VIEW student_view AS
SELECT name, city FROM students WHERE city='Pune';
_______________________________________________________________________________________
(48) What is the difference between a view and a table?
Feature	Table	View
Storage	Stores data physically	Does not store data
Creation	Created using CREATE TABLE	Created using CREATE VIEW
Updatable	Always	Sometimes (if simple)
_______________________________________________________________________________________
(49) Can you update a view? If yes, how?
Yes, you can update a view if it is based on a single table and doesn’t include GROUP BY or aggregate functions.
• Example:
UPDATE student_view SET city='Mumbai' WHERE name='Ravi';
_______________________________________________________________________________________
(50) How do you drop a view?
Use the DROP VIEW command.
• Example:
DROP VIEW student_view;
_______________________________________________________________________________________
(7) Common Table Expressions (CTE)
(51) What is a Common Table Expression (CTE)?
A CTE is a temporary result set that exists only within the execution of a single query.
_______________________________________________________________________________________
(52) How do you create a CTE?
• Syntax:
WITH cte_name AS (
  SELECT column1, column2 FROM table_name WHERE condition
)
SELECT * FROM cte_name;
_______________________________________________________________________________________
(53) What is the difference between a CTE and a subquery?
Feature	CTE	Subquery
Definition	Temporary named result	Query inside another query
Reusability	Can be reused	Not reusable
Readability	Easier	Harder
_______________________________________________________________________________________
(54) Can you use a CTE recursively?
Yes, MySQL supports recursive CTEs for hierarchical or tree-like data.
• Example:
WITH RECURSIVE numbers AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM numbers WHERE n < 5
)
SELECT * FROM numbers;
_______________________________________________________________________________________
(55) How do you reference a CTE in a query?
You can reference it just like a table in the query that follows.
• Example:
WITH student_cte AS (
  SELECT * FROM students WHERE age > 18
)
SELECT name FROM student_cte;
_______________________________________________________________________________________
(8) Joins

(56) What is a join in SQL?
A join is used to combine rows from two or more tables based on a related column between them.
_______________________________________________________________________________________
(57) Explain the different types of joins.
INNER JOIN – Returns matching rows from both tables
LEFT JOIN – Returns all rows from the left table and matching rows from the right
RIGHT JOIN – Returns all rows from the right table and matching from the left
FULL OUTER JOIN – Returns all rows from both tables (not supported directly in MySQL, use UNION)
CROSS JOIN – Returns the Cartesian product of both tables
SELF JOIN – A table joined with itself
_______________________________________________________________________________________
(58) What is an INNER JOIN?
Returns only rows that have matching values in both tables.
• Example:
SELECT s.name, d.dept_name
FROM students s
INNER JOIN department d
ON s.dept_id = d.dept_id;
_______________________________________________________________________________________
(59) What is a LEFT JOIN?
Returns all rows from the left table and matching rows from the right.
If no match, NULL is returned.
• Example:
SELECT s.name, d.dept_name
FROM students s
LEFT JOIN department d
ON s.dept_id = d.dept_id;
_______________________________________________________________________________________
(60) What is a RIGHT JOIN?
Returns all rows from the right table and matching rows from the left.
• Example:
SELECT s.name, d.dept_name
FROM students s
RIGHT JOIN department d
ON s.dept_id = d.dept_id;
_______________________________________________________________________________________
(61) What is a FULL OUTER JOIN?
Returns all records from both tables, matching where possible.
(MySQL doesn’t support it directly; use LEFT JOIN + UNION + RIGHT JOIN.)
_______________________________________________________________________________________
(62) How do you perform a CROSS JOIN?
A CROSS JOIN returns every combination of rows from both tables.
• Example:
SELECT * FROM students CROSS JOIN department;
_______________________________________________________________________________________
(63) What is a self-join?
A self-join joins a table to itself, useful for hierarchical data.
• Example:
SELECT a.name AS Employee, b.name AS Manager
FROM employees a
JOIN employees b
ON a.manager_id = b.emp_id;
_______________________________________________________________________________________
(64) How do you join multiple tables?
You can use multiple JOIN clauses in a single query.
• Example:
SELECT s.name, d.dept_name, c.course_name
FROM students s
JOIN department d ON s.dept_id = d.dept_id
JOIN courses c ON s.course_id = c.course_id;
_______________________________________________________________________________________
(65) What is the difference between a join and a subquery?
Feature	Join	Subquery
Combination	Combines data from multiple tables	Uses one query inside another
Performance	Usually faster	Sometimes slower
Usage	For combining data	For filtering or calculation
_______________________________________________________________________________________
(9.) Subqueries

66. What is a subquery?
A subquery is a query inside another query. It is used to get data that will be used by the main query.
_______________________________________________________________________________________
67. How do you write a subquery in the SELECT statement?
You can place it inside parentheses in the SELECT clause.
• Example:
SELECT (SELECT COUNT(*) FROM students) AS total_students;
_______________________________________________________________________________________
68. Can you use a subquery in the WHERE clause?
Yes, subqueries are often used in the WHERE clause to filter results.
• Example:
SELECT name FROM student WHERE marks > (SELECT AVG(marks) FROM student);
_______________________________________________________________________________________
69. What is a correlated subquery?
A correlated subquery depends on the outer query for its values and runs once for each row of the main query
_______________________________________________________________________________________
70. How do you handle subqueries that return multiple rows?
Use operators like IN, ANY, or ALL to handle multiple rows.
_______________________________________________________________________________________
(10.) Stored Procedures

71. What is a stored procedure?
A stored procedure is a set of SQL statements saved in the database and executed as a single unit.
_______________________________________________________________________________________
72. How do you create a stored procedure in MySQL?

DELIMITER //
CREATE PROCEDURE get_students()
BEGIN
  SELECT * FROM student;
END //
DELIMITER ;
_______________________________________________________________________________________
73. What is the syntax for calling a stored procedure?
CALL get_students();
_______________________________________________________________________________________
74. Can stored procedures accept parameters?
Yes, stored procedures can take input, output, or both types of parameters.
_______________________________________________________________________________________
75. What are the advantages of using stored procedures?
Reusability of code
Better performance
Improved security
Easier maintenance
_______________________________________________________________________________________
(11.) Triggers

76. What is a trigger in MySQL?
A trigger is a set of actions that automatically execute when a specific database event occurs.
_______________________________________________________________________________________
77. How do you create a trigger?

CREATE TRIGGER before_insert_student
BEFORE INSERT ON student
FOR EACH ROW
SET NEW.created_at = NOW();
______________________________________________________________________________________
78. What are the different types of triggers?
BEFORE triggers
AFTER triggers
_______________________________________________________________________________________
79. Can a trigger call a stored procedure?
Yes, a trigger can call a stored procedure.
_______________________________________________________________________________________
80. What is the difference between a trigger and a stored procedure?
A trigger runs automatically, while a stored procedure must be called manually.
_______________________________________________________________________________________
(12.) Data Control Language (DCL)

81. What is Data Control Language (DCL)?
DCL controls access to data in a database using permissions and privileges.
_______________________________________________________________________________________
82. What is the purpose of the GRANT command?
It gives users specific privileges to perform actions on the database.
• Example:
GRANT SELECT, INSERT ON dbname.* TO 'user'@'localhost';
______________________________________________________________________________________
83. How do you revoke privileges using the REVOKE command?
REVOKE SELECT, INSERT ON dbname.* FROM 'user'@'localhost';
____________________________________________________________________________________
84. What is the difference between a user and a role in MySQL?
A user is an individual account.
A role is a group of privileges that can be assigned to users.
_______________________________________________________________________________________
85. How do you create a new user in MySQL?
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
_______________________________________________________________________________________
(13.) Transaction Control Language (TCL)

86. What is Transaction Control Language (TCL)?
TCL manages transactions in a database to ensure data consistency.
_______________________________________________________________________________________
87. What is the purpose of the COMMIT command?
It saves all the changes made in the current transaction permanently.
_______________________________________________________________________________________
88. How do you use the ROLLBACK command?
It cancels the current transaction and restores the previous state.
_______________________________________________________________________________________
89. What is the SAVEPOINT command?
It sets a point within a transaction to which you can roll back later.
_______________________________________________________________________________________
90. How do you set the transaction isolation level?
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
_______________________________________________________________________________________
(14.) Types of Databases

91. What are the different types of databases?
Relational Databases
NoSQL Databases
Distributed Databases
Cloud Databases
Hierarchical Databases
_______________________________________________________________________________________
92. What is the difference between SQL and NoSQL databases?
SQL: Structured data, uses tables and relationships.
NoSQL: Unstructured or semi-structured data, flexible schema.
_______________________________________________________________________________________
93. What are some examples of NoSQL databases?
MongoDB, Cassandra, Redis, CouchDB.
_______________________________________________________________________________________
94. What is a distributed database?
A database that is stored across multiple physical locations but acts as one system.
_______________________________________________________________________________________
95. What is a cloud database?
A database hosted on cloud platforms like AWS, Google Cloud, or Azure.
_______________________________________________________________________________________
(15.) Database Management Systems (DBMS)

96. What is a Database Management System (DBMS)?
A DBMS is software used to store, manage, and organize data efficiently.
_______________________________________________________________________________________
97. What are the functions of a DBMS?
Data storage and retrieval
Security management
Backup and recovery
Data integrity
Concurrency control
_____________________________________________________________________________________
98. What is the difference between a DBMS and an RDBMS?
DBMS: Stores data as files; no relationships between tables.
RDBMS: Uses tables with relationships through keys.
______________________________________________________________________________________
99. What are some popular DBMS software?
MySQL, Oracle, PostgreSQL, SQL Server, MongoDB.
_____________________________________________________________________________________

100. What is data integrity, and how does a DBMS ensure it?
Data integrity means accuracy and consistency of data.
DBMS ensures it using constraints like primary key, foreign key, and unique constraints.
