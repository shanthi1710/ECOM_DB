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

