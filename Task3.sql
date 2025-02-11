Create DataBase School;
use School;

Create Table Students (
	ID int Primary Key Identity(1,1),
	Name varchar(50) Not Null,
	DateOfBirth date,
	Address varchar(50),
	Email varchar(50) unique
);


-- Create the Family_Info table with the StudentID column and the foreign key constraint
CREATE TABLE Family_Info (
    ID int PRIMARY KEY IDENTITY(1,1),
    Name varchar(50) NOT NULL,
    PhoneNumber int,
    Email varchar(50) UNIQUE,
    StudentID int,  -- Add the StudentID column
    FOREIGN KEY (StudentID) REFERENCES Students(ID)  -- Foreign key constraint
);


Create Table Courses  (
	ID int Primary Key Identity(1,1),
	Name varchar(50) Not Null,
	Description Varchar(50),
	Resource varchar(50) 
);


create Table Enrollments 
(
	StudentID int,
	CourseID int,

	FOREIGN Key (StudentID) REFERENCES Students(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses(ID)
);


Create Table Classes (
	ID int Primary Key Identity(1,1),
	classCode int Not Null unique,
	RoomNumber int Not Null,
	schedule varchar(50) 
);


Create Table Assignments  (
	ID int Primary Key Identity(1,1),
	Name varchar(50) Not Null,
	Description Varchar(50),
	DueDate date,
	States bit
);


CREATE TABLE StudentsAssignments (
    SubmissionID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,  -- Foreign key referencing Students
    AssignmentID INT,  -- Foreign key referencing Assignments
    Passed BIT,  -- Whether the student passed the assignment (1 for passed, 0 for failed)
    FOREIGN KEY (StudentID) REFERENCES Students(ID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(ID)
);



Create Table Attendance   (
	ID int Primary Key Identity(1,1),
	Date date,
	Type Varchar(50),
	StudentID INT,  -- Foreign Key from Students table
	FOREIGN KEY (StudentID) REFERENCES Students(ID)

);


-- Insert data into Students table
INSERT INTO Students (Name, DateOfBirth, Address, Email) 
VALUES 
('Ali Ahmad', '2005-04-15', '123 Main St', 'ali.ahmad123@example.com'),
('Sara Khalid', '2006-08-22', '456 Elm St', 'sara.khalid@example.com'),
('Omar Hassan', '2004-12-10', '789 Oak St', 'omar.hassan@example.com');

-- Insert sample family members
INSERT INTO Family_Info (Name, PhoneNumber, Email, StudentID)
VALUES 
('Jane Doe', 12345, 'jane.doe@example.com', 1),  -- Family of John Doe
('Tom Smith', 23456, 'tom.smith@example.com', 2),  -- Family of Alice Smith
('Sarah Johnson', 34562, 'sarah.johnson@example.com', 3);  -- Family of Bob Johnson




-- Insert data into Courses table
INSERT INTO Courses (Name, Description, Resource) 
VALUES 
('Mathematics', 'Basic Algebra and Geometry', 'math_resources.pdf'),
('Science', 'Physics and Chemistry Basics', 'science_notes.pdf'),
('English', 'Grammar and Composition', 'english_book.pdf');

-- Insert data into Classes table
INSERT INTO Classes (classCode, RoomNumber, schedule) 
VALUES 
(101, 12, 'Monday & Wednesday 10:00 AM'),
(102, 15, 'Tuesday & Thursday 11:30 AM'),
(103, 20, 'Friday 9:00 AM');

-- Insert data into Assignments table
INSERT INTO Assignments (Name, Description, DueDate, States) 
VALUES 
('Algebra Homework', 'Solve 10 equations', '2025-03-10', 1),
('Science Report', 'Write about chemical reactions', '2025-03-15', 0),
('English Essay', '500-word essay on literature', '2025-03-20', 1);


-- Sample Attendance data for a student
INSERT INTO Attendance (StudentID, Date, Type)
VALUES 
(1, '2025-02-08', 'Absent'), -- Sunday
(1, '2025-02-09', 'Absent'), -- Monday
(1, '2025-02-10', 'Absent'), -- Tuesday
(1, '2025-02-11', 'Present'), -- Wednesday
(1, '2025-02-12', 'Late'); -- Thursday







-- for Student and course 
INSERT INTO Enrollments (StudentID, CourseID)
VALUES 
(1, 1),  
(2, 1),  
(3, 2);


INSERT INTO StudentsAssignments (StudentID, AssignmentID, Passed)
VALUES 
(1, 1, 1),  -- John Doe submitted and passed SQL Assignment
(2, 1, 0),  -- Alice Smith submitted but failed SQL Assignment
(3, 1, 1);  -- Bob Johnson submitted and passed SQL Assignment






-- Q1
Select *from Students where DateOfBirth = '2006-08-22';

-- Q2
Select *from Courses where Name = 'Mathematics';

-- Q3
ALTER TABLE Students ADD LastName VARCHAR(50);

-- Q4 
Insert into Students VALUES ('Ayman', '1996-04-15', '444 Main St', 'Ayman.ahmad123@example.com', 'Ahmad');

Select *from Students



-- Q5 

SELECT Students.ID, Students.Name, Students.Email, Family_Info.Name AS FamilyName, Family_Info.PhoneNumber, Family_Info.Email AS FamilyEmail
FROM Students
JOIN Family_Info ON Students.ID = Family_Info.StudentID;

Select *from Students
Select *from Family_Info


-- Q6

SELECT Students.ID, Students.Name, Students.Email
FROM Students
JOIN Enrollments ON Students.ID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.ID
WHERE Courses.Name = 'Mathematics';



-- Q7

SELECT Students.ID, Students.Name, Students.Email
From Students
Inner JOIN StudentsAssignments ON Students.ID = StudentsAssignments.StudentID
Inner JOIN Assignments ON Assignments.ID = StudentsAssignments.AssignmentID
where Assignments.Name = 'Algebra Homework'   
AND StudentsAssignments.Passed = 1;



-- Q8 

SELECT Students.Name, Attendance.Date, Attendance.Type
FROM Students
JOIN Attendance ON Students.ID = Attendance.StudentID
WHERE Attendance.Date BETWEEN '2025-02-10' AND '2025-02-12';


Drop DataBase School;


SELECT * FROM Family_Info WHERE StudentID IS NULL;
