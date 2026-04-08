Description

The Digital Library Audit system manages book borrowing records and helps administrators monitor library usage.

It tracks which books students borrow and identifies overdue books and popular book categories.

Database Tables
Books

Stores information about books in the library.

Fields:

BookID
Title
Author
Category
CopiesAvailable
Students

Stores student details.

Fields:

StudentID
StudentName
Email
JoinDate
IssuedBooks

Tracks book borrowing information.

Fields:

IssueID
BookID
StudentID
IssueDate
ReturnDate
Features
Overdue Book Detection

Identifies books that have not been returned within 14 days.

Popularity Analysis

Counts how many times each book category has been borrowed using:

COUNT()
GROUP BY
Data Cleanup

Removes student records that have been inactive for more than 3 years.

Technologies Used
SQL
Relational database design
JOIN operations
Aggregate functions
Date functions