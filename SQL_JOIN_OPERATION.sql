SELECT 
    s.StudentName AS 'Student Name',
    c.ClubName     AS 'Club Name',
    m.JoinDate     AS 'Join Date'
FROM Membership m
JOIN Student s   ON m.StudentID = s.StudentID
JOIN Club c      ON m.ClubID    = c.ClubID
ORDER BY s.StudentName, m.JoinDate;
