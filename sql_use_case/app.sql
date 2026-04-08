
CREATE DATABASE library_db;
USE library_db;
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Category VARCHAR(50),
    CopiesAvailable INT
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100),
    Email VARCHAR(120),
    JoinDate DATE
);
CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    StudentID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Books (Title, Author, Category, CopiesAvailable)
VALUES
('Database Systems', 'Korth', 'Technology', 5),
('History of India', 'Bipan Chandra', 'History', 3),
('Physics Basics', 'Halliday', 'Science', 4);

INSERT INTO Students (StudentName, Email, JoinDate)
VALUES
('Rahul Kumar', 'rahul@email.com', '2022-06-10'),
('Sneha Sharma', 'sneha@email.com', '2021-04-12'),
('Arjun Patel', 'arjun@email.com', '2020-01-15');

INSERT INTO IssuedBooks (BookID, StudentID, IssueDate, ReturnDate)
VALUES
(1, 1, '2026-03-01', NULL),
(2, 2, '2026-03-20', '2026-03-28'),
(3, 3, '2026-03-05', NULL);


SELECT 
    s.StudentName,
    b.Title,
    i.IssueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND DATEDIFF(CURDATE(), i.IssueDate) > 14;


SELECT 
    b.Category,
    COUNT(*) AS BorrowCount
FROM IssuedBooks i
JOIN Books b ON i.BookID = b.BookID
GROUP BY b.Category
ORDER BY BorrowCount DESC;

DELETE FROM Students
WHERE StudentID NOT IN (
    SELECT DISTINCT StudentID
    FROM IssuedBooks
    WHERE IssueDate >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
);