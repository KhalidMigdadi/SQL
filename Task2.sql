CREATE DATABASE Ayman;

-- Create Teachers Table
CREATE TABLE Teachers (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    Email VARCHAR(50) UNIQUE NOT NULL
);

-- Create TeacherDetails Table (1:1 Relationship)
CREATE TABLE TeacherDetails (
    TeacherID INT PRIMARY KEY,
    Address VARCHAR(100),
    Nationality VARCHAR(50),
    DateOfBirth DATE,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) 
);

-- Create Courses Table (Each Course is Assigned to One Teacher)
CREATE TABLE Courses1 (
    ID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    CourseCode VARCHAR(50) UNIQUE NOT NULL,
    Description VARCHAR(255),
    CreditHours INT,
    TeacherID INT NOT NULL,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) 
);

-- Create Students Table
CREATE TABLE Students1 (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    PhoneNumber VARCHAR(15) -- Changed from INT to VARCHAR
);

-- Create StudentCourse Table (Many-to-Many Relationship)
CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    --PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students1(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses1(ID) 
);



-- Insert Data into Teachers
INSERT INTO Teachers (ID, FirstName, LastName, Salary, Email) VALUES
(1, 'John', 'Doe', 5000, 'johndoe@example.com'),
(2, 'Alice', 'Smith', 5500, 'alicesmith@example.com'),
(3, 'Robert', 'Brown', 6000, 'robertbrown@example.com'),
(4, 'Emma', 'Wilson', 5200, 'emmawilson@example.com'),
(5, 'David', 'Johnson', 5300, 'davidjohnson@example.com');

-- Insert Data into TeacherDetails
INSERT INTO TeacherDetails (TeacherID, Address, Nationality, DateOfBirth) VALUES
(1, '123 Main St', 'USA', '1980-05-15'),
(2, '456 Elm St', 'UK', '1975-08-22'),
(3, '789 Oak St', 'Canada', '1982-03-10'),
(4, '101 Maple St', 'Australia', '1990-11-30'),
(5, '202 Pine St', 'Germany', '1988-07-18');

-- Insert Data into Courses
INSERT INTO Courses1 (ID, CourseName, CourseCode, Description, CreditHours, TeacherID) VALUES
(101, 'Mathematics', 'MATH101', 'Basic Mathematics Course', 3, 1),
(102, 'Physics', 'PHY102', 'Introduction to Physics', 4, 2),
(103, 'Chemistry', 'CHEM103', 'Organic Chemistry Basics', 3, 3),
(104, 'English', 'ENG104', 'Advanced English Literature', 3, 4),
(105, 'Computer Science', 'CS105', 'Introduction to Programming', 4, 5);

-- Insert Data into Students
INSERT INTO Students1 (ID, FirstName, LastName, Email, PhoneNumber) VALUES
(1, 'Sophia', 'Miller', 'sophiamiller@example.com', '+1234567890'),
(2, 'Liam', 'Davis', 'liamdavis@example.com', '+9876543210'),
(3, 'Isabella', 'Wilson', 'isabellawilson@example.com', '+1122334455'),
(4, 'Mason', 'Taylor', 'masontaylor@example.com', '+2233445566'),
(5, 'Olivia', 'Anderson', 'oliviaanderson@example.com', '+3344556677');

-- Insert Data into StudentCourse (Many-to-Many Relationship)
INSERT INTO StudentCourse (StudentID, CourseID) VALUES
(1, 101),
(1, 103), 
(2, 102),
(3, 101),
(4, 105);


select * from StudentCourse;
select * from Students1;
select * from Courses1;
select * from TeacherDetails;
select * from Teachers;