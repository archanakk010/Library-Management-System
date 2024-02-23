-- Module End Project
/*Topic : Library Management System
You are going to build a project based on Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books available in the library.
Create a database named library and following TABLES in the database:
1. Branch
2. Employee
3. Books
4. Customer
5. IssueStatus
5. ReturnStatus
Attributes for the tables:
1. Branch
Branch_no - Set as PRIMARY KEY 
Manager_Id 
Branch_address 
Contact_no
2. Employee 
Emp_Id – Set as PRIMARY KEY 
Emp_name 
Position 
Salary
Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
3. Books 
ISBN - Set as PRIMARY KEY 
Book_title 
Category 
Rental_Price 
Status [Give yes if book available and no if book not available] 
Author 
Publisher
4. Customer 
Customer_Id - Set as PRIMARY KEY 
Customer_name 
Customer_address 
Reg_date
5. IssueStatus 
Issue_Id - Set as PRIMARY KEY 
Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table  Issued_book_name
Issue_date
Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table
6. ReturnStatus 
Return_Id - Set as PRIMARY KEY 
Return_cust 
Return_book_name 
Return_date 
Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table*/

-- Database Creation 
create database library;

-- Use the created database
use library;


-- Create the Branch table
create table Branch (
    Branch_no int primary key,
    Manager_Id varchar(10),
    Branch_address varchar(100),
    Contact_no varchar(15)
);

-- Create the Employee table
create table Employee (
    Emp_Id int primary key,
    Emp_name varchar(20),
    Position varchar(20),
    Salary decimal(10, 2),
    Branch_no int,
    foreign key (Branch_no) references Branch(Branch_no)
);

-- Create the Books table
create table Books (
    ISBN varchar(20) primary key,
    Book_title varchar(250),
    Category varchar(150),
    Rental_Price decimal(10, 2),
    Status enum('yes', 'no'), 
    Author varchar(125),
    Publisher varchar(125)
);

-- Create the Customer table
create table Customer (
    Customer_Id int primary key,
    Customer_name varchar(25),
    Customer_address varchar(100),
    Reg_date date
);

-- Create the IssueStatus table
create table IssueStatus (
    Issue_Id int primary key,
    Issued_cust int,
    Issued_book_name varchar(100),
    Issue_date date,
    Isbn_book varchar(20),
    foreign key (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Books(ISBN)
);

-- Create the ReturnStatus table
create table ReturnStatus (
    Return_Id int primary key,
    Return_cust int,
    Return_book_name varchar(100),
    Return_date date,
    Isbn_book2 varchar(20),
    foreign key (Return_cust) references Customer(Customer_Id),
    foreign key (Isbn_book2) references Books(ISBN)
);

-- Insert values into Branch table
insert into Branch (Branch_no,Manager_Id,Branch_address,Contact_no) values
(001,'CS01','computer science 01 ground floor','123-456-7890'),
(101,'EC02','electronics & communication 101 first floor','987-654-3210'),
(201,'EE03','Electrical and electronic 201 second floor','555-555-5555'),
(301,'CV04','Civil 301 third floor','666-666-6666'),
(401,'ME05','Mechanical 401 fourth floor','777-777-7777'),
(501,'BCA06','BCA 501 fifth floor','888-888-8888'),
(601,'BBA07','BBA 601 sixth floor','999-999-9999'),
(701,'BHM08','BHM 701 seventh floor','111-111-1111'),
(801,'NS09','BSc Nursing 801 eighth floor','222-222-2222'),
(901,'FD10','Fashion Design 901 ninth floor','333-333-3333');

-- Insert values into Employee table 
insert into Employee (Emp_Id,Emp_name,Position,Salary,Branch_no) values
(011,'Amit','Library Manager',75000.00, 001),
(012,'Varun','Library Manager',72000.00, 501),
(013,'Riya','Senior Librarian',65000.00, 001),
(014,'Maya','Senior Librarian',63000.00, 401),
(015,'Kiran','Senior Librarian',62000.00, 701),
(016,'Siddharth','Senior Librarian',62000.00, 901),
(017,'Aarav','Librarian',56000.00,001),
(018,'Aryan','Librarian',56000.00,101),
(019,'Akshay','Librarian',55000.00,201),
(020,'Meera','Librarian',53000.00,301),
(021,'Diya','Librarian',53000.00, 401),
(022,'Arjun','Librarian',52000.00, 501),
(023,'Kavya','Librarian',52000.00, 601),
(024,'Suresh','Librarian',50000.00, 701),
(025,'Neha','Librarian',50000.00, 801),
(026,'Rahul','Librarian',50000.00, 901),
(027,'Priya','Library Clerk',48000.00,001),
(028,'Aditya','Library Clerk',48000.00,101),
(029,'Priya','Library Clerk',42000.00,201),
(030,'Aditya','Library Clerk',41000.00,801),
(031,'Rajesh','Library Assistant',39000.00,001),
(032,'Deepa','Library Assistant',37000.00, 301),
(033,'Suman','Library Assistant',37000.00,401),
(034,'Arya','Library Assistant',35000.00,801),
(035,'Anusha','Cashier',32000.00,001),
(036,'Vishal','Cashier',32000.00,201),
(037,'Shreya','Cashier',30000.00,701),
(038,'Devika','Library Technician',28000.00, 01);


-- Insert values into Books table
insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values

-- Computer Science
('9780262032933', 'Artificial Intelligence: A Modern Approach', 'Computer Science', 425.00,'Yes', 'Stuart Russell, Peter Norvig', 'Pearson'),
('9780262033848', 'Introduction to Algorithms', 'Computer Science', 320.00, 'Yes', 'Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein', 'The MIT Press'),

-- Electronics & Communication
('9780132543031', 'Communication Systems Engineering', 'Electronics and Communication', 522.00, 'Yes', 'John G. Proakis, Masoud Salehi', 'Pearson'),
('9789339221003', 'Electronic Communication Systems', 'Electronics and Communication', 318.00, 'Yes', 'George Kennedy, Bernard Davis', 'McGraw-Hill Education'),

-- Electrical and Electronic 
('9781119235382', 'Electric Circuits', 'Electrical and Electronic Engineering', 415.00, 'Yes', 'James W. Nilsson, Susan A. Riedel', 'Wiley'),
('9780133760033', 'Microelectronic Circuits', 'Electrical and Electronic Engineering', 318.00, 'Yes', 'Adel S. Sedra, Kenneth C. Smith', 'Oxford University Press'),
('9780415152913', 'A History of Engineering in Classical and Medieval Times', 'Electrical and Electronic Engineering', 420.00, 'Yes', 'Donald Hill', 'Routledge'),

-- Civil 
('9780136088394', 'Engineering Mechanics: Statics', 'Civil Engineering', 520.00, 'Yes', 'J.L. Meriam, L.G. Kraige', 'Pearson'),
('9780470917764', 'Principles of Geotechnical Engineering', 'Civil Engineering', 625.00, 'Yes', 'Braja M. Das, Khaled Sobhan', 'Cengage Learning'),
('9780784409880', 'A History of Civil Engineering', 'Civil Engineering', 422.00, 'Yes', 'Peter R. Smith', 'ASCE Press'),

-- Mechanical 
('9780132280821', 'Fundamentals of Thermodynamics', 'Mechanical Engineering', 822.00, 'Yes', 'Richard E. Sonntag, Claus Borgnakke, Gordon J. Van Wylen', 'Wiley'),
('9781118007398', 'Introduction to Fluid Mechanics', 'Mechanical Engineering', 523.00, 'No', 'William S. Janna', 'Wiley'),
('9780486255934', 'A History of Mechanical Inventions', 'Mechanical Engineering', 324.00, 'Yes', 'Abbott Payson Usher', 'Dover Publications'),

-- BCA
('9780132121360', 'Database System Concepts', 'BCA', 417.00, 'Yes', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', 'McGraw-Hill Education'),
('9780134670942', 'Computer Networking: A Top-Down Approach', 'BCA', 319.00, 'No', 'James F. Kurose, Keith W. Ross', 'Pearson'),

-- BBA
('9780470533024', 'Principles of Marketing', 'BBA', 616.00, 'No', 'Philip Kotler, Gary Armstrong', 'Pearson'),
('9781292095048', 'Operations Management', 'BBA', 718.00, 'Yes', 'Nigel Slack, Alistair Brandon-Jones, Robert Johnston', 'Pearson'),

-- BHM
('9788126519840', 'Hotel Management and Operations', 'BHM', 321.00, 'Yes', 'Denney G. Rutherford', 'Wiley'),
('9780470399163', 'Hospitality Management Accounting', 'BHM', 424.00, 'Yes', 'Martin G. Jagels', 'Wiley'),

-- Nursing
('9780323356224', 'Medical-Surgical Nursing: Assessment and Management of Clinical Problems', 'Nursing', 628.00, 'Yes', 'Sharon L. Lewis, Shannon Ruff Dirksen, Margaret M. Heitkemper, Linda Bucher', 'Mosby'),
('9780323390228', 'Pharmacology and the Nursing Process', 'Nursing', 530.00, 'Yes', 'Linda Lane Lilley, Shelly Rainforth Collins, Julie S. Snyder', 'Mosby'),

-- Fashion Design
('9781501315388', 'Fashion Sketchbook', 'Fashion Design', 325.00, 'Yes', 'Bina Abling', 'Fairchild Books'),
('9781501317979', 'Draping for Apparel Design', 'Fashion Design', 427.00, 'Yes', 'Helen Joseph-Armstrong', 'Fairchild Books');


-- Insert values into Customer table 
insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date) values

(301, 'Mohammed', 'Kochi 123', '2020-01-05'),
(302, 'Fatima', 'Trivandrum 456', '2020-04-10'),
(303, 'Ali', 'Kozhikode 789', '2020-05-15'),
(304, 'Surya', 'Kozhikode 321', '2020-08-20'),
(305, 'Lakshmi', 'Kottayam 789', '2020-10-25'),
(306, 'Ganesh', 'Alappuzha 456', '2020-12-30'),
(307, 'Anjali', 'Trissure 124 ', '2021-01-05'),
(308, 'Joseph', 'Palakkad 456', '2021-05-10'),
(309, 'Maria', 'Kollam 789', '2021-09-15'),
(310, 'George', 'Malappuram 324', '2021-10-20'),
(311, 'Ann', 'Idukki 789', '2021-12-26'),
(312, 'Mathew', 'Wayanad 459', '2021-12-30'),
(313, 'Teresa', 'Pathanamthitta 659','2022-01-05'),
(314, 'Antony', 'Idukki 987', '2022-02-10'),
(315, 'Rosy', 'Palakkad 234', '2022-03-15'),
(316, 'Parvati', 'Ernakulam 654', '2022-04-05'),
(317, 'Karthik', 'Kannur 987', '2022-08-10'),
(318, 'Radha', 'Kasargod 123', '2022-11-05'),
(319, 'Vishnu', 'Wayanad 456', '2023-01-10'),
(320, 'Saraswati', 'Kozhikode 789', '2023-03-15'),
(321, 'Shiva', 'Idukki 128', '2023-04-20'),
(322, 'Parvati', 'Kannur 789', '2023-06-25'),
(323, 'Ahmed', 'Wayanad 451', '2023-06-30'),
(324, 'Aisha', 'Kollam 654', '2023-07-05'),
(325, 'Yusuf', 'Alappuzha 987', '2023-08-10'),
(326, 'Mary', 'Trivandrum 299', '2023-09-15');

-- Insert values into IssueStatus table
insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) values
(401, 309, 'Communication Systems Engineering', '2023-01-10', '9780132543031'),
(402, 302, 'Electronic Communication Systems', '2023-02-05', '9789339221003'),
(403, 314, 'Electric Circuits', '2023-06-15', '9781119235382'),
(404, 316, 'Introduction to Algorithms', '2023-08-10', '9780262032933'),
(405, 305, 'Artificial Intelligence: A Modern Approach', '2023-09-15', '9780262033848'),
(406, 320, 'Engineering Mechanics: Statics', '2023-10-20', '9780136088394'),
(407, 326, 'Principles of Geotechnical Engineering', '2023-11-25', '9780470917764'),
(408, 311, 'Fundamentals of Thermodynamics', '2023-12-30', '9780132280821');
;


-- Insert values into ReturnStatus table
insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) values
(501, 309, 'Communication Systems Engineering', '2023-02-20', '9780132543031'),
(502, 302, 'Electronic Communication Systems', '2023-03-10', '9789339221003'),
(503, 314, 'Electric Circuits', '2023-07-01', '9781119235382'),
(504, 316, 'Introduction to Algorithms', '2023-09-05', '9780262032933'),
(505, 305, 'Artificial Intelligence: A Modern Approach', '2023-10-10', '9780262033848'),
(506, 320, 'Engineering Mechanics: Statics', '2023-11-15', '9780136088394'),
(507, 326, 'Principles of Geotechnical Engineering', '2023-12-20', '9780470917764'),
(508, 311, 'Fundamentals of Thermodynamics', '2024-01-25', '9780132280821');


-- Display all the tables and Write the queries for the following :

#To show Books table

select * from Branch;

#To show Employee table

select * from Employee;

#To show Books table

select * from Books;

#To show IssueStatus table

select * from IssueStatus;

#To show ReturnStatus table

select * from ReturnStatus;



-- 1. Retrieve the book title, category, and rental price of all available books.

select Book_title,Category,Rental_price
from Books
where status='Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

select Emp_name,Salary 
from Employee
order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

select Book_title,Customer_name
from IssueStatus i 
join Books b 
on i.Isbn_book=b.ISBN
join Customer c
on i.Issued_cust=c.Customer_Id;

-- 4. Display the total count of books in each category.

select Category,count(*) as Total_Book
from Books
group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select Emp_name,Position,Salary
from Employee
where Salary>50000.00;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

select  Customer_name,Reg_date
from Customer 
where Reg_date<'2022-01-01'
and Customer_Id not in(select Issued_cust from IssueStatus);
 
-- 7. Display the branch numbers and the total count of employees in each branch.

select Branch_no,count(*) as Total_Employee
from Employee 
group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

select Customer_Id,Customer_name,Issue_date
from Customer c join IssueStatus i
on c.Customer_Id=i.Issued_cust
where Issue_date between '2023-06-01' and '2023-06-30';

-- 9. Retrieve book_title from book table containing history.

select Book_title,Category
from Books
where Book_title like'%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select Branch_no,count(*) as Total_Emloyee
from Employee
group by Branch_no
having count(*)>5;








