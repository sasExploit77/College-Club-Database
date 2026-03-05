USE CollegeClubDB;

-- Inserting a new student into the Student table
-- (StudentID is 8 because 1-7 already exists)
INSERT INTO Student (StudentID, StudentName, Email) 
VALUES (8, 'Yogesh', 'yogesh@email.com');

-- Insert a new club into the Club table
INSERT INTO Club (ClubName, ClubRoom, ClubMentor) 
VALUES ('Film Club', 'R404', 'Mr. Nolan');

-- Display all students
SELECT * FROM Student;

-- Display all clubs
SELECT * FROM Club;
