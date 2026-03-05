USE CollegeClubDB;

DROP TABLE IF EXISTS Membership;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS Student;

-- 1. Student Table (Remains identical to 2NF as it already satisfies 3NF)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- 2. Club Table (Introducing Surrogate Key 'ClubID')
CREATE TABLE Club (
    ClubID INT AUTO_INCREMENT PRIMARY KEY,
    ClubName VARCHAR(100) UNIQUE NOT NULL,
    ClubRoom VARCHAR(20) NOT NULL,
    ClubMentor VARCHAR(100) NOT NULL
);

-- 3. Membership Table (Using foreign keys StudentID and ClubID)
CREATE TABLE Membership (
    StudentID INT NOT NULL,
    ClubID INT NOT NULL,
    JoinDate DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID) ON DELETE CASCADE
);

-- Populating the Normalized 3NF Tables
INSERT INTO Student (StudentID, StudentName, Email) VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

INSERT INTO Club (ClubName, ClubRoom, ClubMentor) VALUES
('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- Populating Membership using Subqueries to automatically fetch the correct ClubID
INSERT INTO Membership (StudentID, ClubID, JoinDate) VALUES
(1, (SELECT ClubID FROM Club WHERE ClubName = 'Music Club'), '2024-01-10'),
(2, (SELECT ClubID FROM Club WHERE ClubName = 'Sports Club'), '2024-01-12'),
(1, (SELECT ClubID FROM Club WHERE ClubName = 'Sports Club'), '2024-01-15'),
(3, (SELECT ClubID FROM Club WHERE ClubName = 'Music Club'), '2024-01-20'),
(4, (SELECT ClubID FROM Club WHERE ClubName = 'Drama Club'), '2024-01-18'),
(5, (SELECT ClubID FROM Club WHERE ClubName = 'Music Club'), '2024-01-22'),
(2, (SELECT ClubID FROM Club WHERE ClubName = 'Drama Club'), '2024-01-25'),
(6, (SELECT ClubID FROM Club WHERE ClubName = 'Sports Club'), '2024-01-27'),
(3, (SELECT ClubID FROM Club WHERE ClubName = 'Coding Club'), '2024-01-28'),
(7, (SELECT ClubID FROM Club WHERE ClubName = 'Coding Club'), '2024-01-30');
