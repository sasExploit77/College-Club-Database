USE CollegeClubDB;

-- Student Table
CREATE TABLE Student_2NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Club Table
CREATE TABLE Club_2NF (
    ClubName VARCHAR(100) PRIMARY KEY,
    ClubRoom VARCHAR(20) NOT NULL,
    ClubMentor VARCHAR(100) NOT NULL
);

-- Membership Table
CREATE TABLE Membership_2NF (
    StudentID INT NOT NULL,
    ClubName VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL,
    PRIMARY KEY (StudentID, ClubName),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID),
    FOREIGN KEY (ClubName) REFERENCES Club_2NF(ClubName)
);

-- Data Migration
INSERT INTO Student_2NF (StudentID, StudentName, Email)
SELECT DISTINCT StudentID, StudentName, Email FROM StudentClub_1NF;
INSERT INTO Club_2NF (ClubName, ClubRoom, ClubMentor)
SELECT DISTINCT ClubName, ClubRoom, ClubMentor FROM StudentClub_1NF;
INSERT INTO Membership_2NF (StudentID, ClubName, JoinDate)
SELECT StudentID, ClubName, JoinDate FROM StudentClub_1NF;
