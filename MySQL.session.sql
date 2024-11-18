CREATE TABLE Product (
    P_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Description TEXT,
    INDEX (Name)
);
CREATE TABLE Customer (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE `Order` (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_Amount DECIMAL(10, 2) NOT NULL,
    Order_Date DATE NOT NULL,
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Customer(User_ID) ON DELETE SET NULL,
    INDEX (Order_Date)
);


CREATE TABLE Cart (
    Cart_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Customer(User_ID) ON DELETE CASCADE
);

CREATE TABLE Category (
    C_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Picture VARCHAR(255),
    Description TEXT,
    UNIQUE (Name)
);


CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Order_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID) ON DELETE SET NULL
);

INSERT INTO Product (Name, Price, Description) VALUES
('Laptop', 899.99, 'A high-performance laptop with 16GB RAM and 512GB SSD'),
('Smartphone', 499.99, 'Latest model with 128GB storage and 6GB RAM'),
('Tablet', 299.99, '10-inch screen with 64GB storage and 4GB RAM');

INSERT INTO Customer (Name, Email, Password) VALUES
('John Doe', 'john.doe@example.com', 'password123'),
('Jane Smith', 'jane.smith@example.com', 'securepass456'),
('Mark Johnson', 'mark.johnson@example.com', 'mypassword789');


INSERT INTO `Order` (Order_Amount, Order_Date, User_ID) VALUES
(899.99, '2024-11-09', 1), -- Order for John Doe
(499.99, '2024-11-10', 2), -- Order for Jane Smith
(299.99, '2024-11-11', 3); -- Order for Mark Johnson

INSERT INTO Payment (Type, Amount, Order_ID) VALUES
('Credit Card', 899.99, 1), -- Payment for John's order
('PayPal', 499.99, 2), -- Payment for Jane's order
('Debit Card', 299.99, 3); -- Payment for Mark's order

INSERT INTO Cart (User_ID) VALUES
(1), -- Cart for John Doe
(2), -- Cart for Jane Smith
(3); -- Cart for Mark Johnson

INSERT INTO Category (Name, Picture, Description) VALUES
('Electronics', 'electronics.jpg', 'All kinds of electronic devices'),
('Furniture', 'furniture.jpg', 'Home and office furniture'),
('Clothing', 'clothing.jpg', 'Apparel and accessories');

select * from `Order` 

/* Select Customers Who Have Spent More Than a Certain Amount */
SELECT C.Name
FROM Customer C
JOIN `Order` O ON C.User_ID = O.User_ID
GROUP BY C.Name
HAVING SUM(O.Order_Amount) > 100;

SELECT O.Order_ID, P.Amount
FROM `Order` O
JOIN Payment P ON O.Order_ID = P.Order_ID
WHERE P.Amount > 500;


SELECT * FROM Customer WHERE User_ID NOT IN (SELECTUSer_ID FROM `Order`);

CREATE TABLE employee (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(250) NOT NULL,
    Salary INT
);

INSERT INTO employee(Name,Salary) VALUES 
    ("SHanthi",50000),
    ("Suhan",100000),
    ("Samnit",75000),
    ("Ayush",10000),
    ("Akshay",30000)

select * from employee ORDER BY Salary DESC

select * 
from employee 
WHERE Salary = (
    SELECT max(Salary) 
    from employee WHERE Salary <  (SELECT max(Salary) 
    from employee )
)



CREATE TABLE Student (
    STUDENT_ID INT AUTO_INCREMENT PRIMARY KEY ,
    FIRST_NAME VARCHAR(250) NOT NULL,
    LAST_NAME VARCHAR(250) NOT NULL,
    GPA DECIMAL(4,2) NOT NULL,
    ENROLLMENT_DATE DATETIME NOT NULL,
    MAJOR VARCHAR(250) NOT NULL
);

CREATE TABLE Program (
    PROGRAM_NAME VARCHAR(250),
    PROGRAM_START_DATE DATETIME,
    STUDENT_REF_ID INT,
    FOREIGN KEY (STUDENT_REF_ID) REFERENCES Student(STUDENT_ID) 
);

CREATE TABLE Scholarship(
    STUDENT_REF_ID INT,
    SCHOLARSHIP_AMOUNT DECIMAL(10, 2),
    SCHOLARSHIP_DATE DATETIME,
    FOREIGN KEY (STUDENT_REF_ID) REFERENCES Student(STUDENT_ID)
)

INSERT INTO Student (STUDENT_ID, FIRST_NAME, LAST_NAME, GPA, ENROLLMENT_DATE, MAJOR) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.60, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');


INSERT INTO Program (STUDENT_REF_ID, PROGRAM_NAME, PROGRAM_START_DATE) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');


INSERT INTO Scholarship (STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(201, 4000, '2021-10-15 00:00:00');


select * from Student;

select * from Program;

select * from Scholarship;

SELECT UPPER(FIRST_NAME) as STUDENT_NAME FROM Student;

SELECT DISTINCT(MAJOR) FROM Student;

SELECT MAJOR FROM Student GROUP BY (MAJOR);

SELECT SUBSTRING(FIRST_NAME,1,3) FROM Student;

SELECT INSTR(FIRST_NAME, 'a') FROM Student WHERE FIRST_NAME = 'Shivansh'; 

SELECT MAJOR,LENGTH(MAJOR) FROM Student GROUP BY(MAJOR);

SELECT REPLACE(FIRST_NAME,'a','A') FROM Student;

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME FROM Student;

SELECT * FROM Student ORDER BY FIRST_NAME,MAJOR DESC;

SELECT * from Student WHERE FIRST_NAME IN ('Prem' , 'Shivansh');

SELECT * from Student WHERE FIRST_NAME NOT IN ('Prem' , 'Shivansh');

SELECT * FROM Student WHERE FIRST_NAME LIKE '%a';

SELECT * FROM Student WHERE FIRST_NAME LIKE '_____a';

SELECT * FROM Student WHERE GPA BETWEEN 9.00 AND 9.99;

SELECT MAJOR,COUNT(*) AS TOTAL_COUNT FROM Student WHERE MAJOR = 'Computer Science';

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS Full_Name FROM Student WHERE GPA BETWEEN 8.5 and 9.5;

SELECT MAJOR , COUNT(MAJOR) FROM Student GROUP BY MAJOR ORDER BY COUNT(MAJOR) DESC;

SELECT a.FIRST_NAME,a.LAST_NAME,b.SCHOLARSHIP_AMOUNT,b.SCHOLARSHIP_DATE
FROM Student a
INNER JOIN Scholarship b 
ON a.STUDENT_ID = b.STUDENT_REF_ID;

SELECT * FROM Student WHERE STUDENT_ID %2 != 0;

SELECT 
    Student.FIRST_NAME,
    Student.LAST_NAME,
    Scholarship.SCHOLARSHIP_AMOUNT,
    Scholarship.SCHOLARSHIP_DATE
FROM 
    Student
LEFT JOIN 
    Scholarship ON Student.STUDENT_ID = Scholarship.STUDENT_REF_ID;

SELECT * FROM Student ORDER BY GPA DESC LIMIT 5;



SELECT * FROM Student ORDER BY GPA DESC LIMIT 1,1

SELECT * FROM Student s1 
WHERE 4 = (
    SELECT COUNT(DISTINCT (s2.GPA)) 
    FROM Student s2
    WHERE s2.GPA >= s1.GPA
);


create VIEW shanthi AS SELECT * FROM Student;

CREATE PROCEDURE Shanthi()
BEGIN
    SELECT * FROM Student;
END;


CALL shanthi()

