-- Part 3: Creating Simple Queries

-- 1. List All Books with Their Authors and Genres
SELECT 
    b.ISBN,
    b.Title,
    a.Name AS Author,
    g.Title AS Genre
FROM 
    Books b
JOIN 
    BookAuthor ba ON b.ISBN = ba.ISBN
JOIN 
    Authors a ON ba.Author_ID = a.Author_ID
JOIN 
    BookGenre bg ON b.ISBN = bg.ISBN
JOIN 
    Genres g ON bg.Genre_ID = g.Genre_ID;

-- 2. Find All Loans for a Specific Borrower (e.g., Borrower_ID = 1)
SELECT 
    l.Loan_Number,
    l.ISBN,
    b.Title,
    l.Loan_Date,
    l.Due_Date,
    l.Return_Date,
    l.Fine_Amount,
    l.Return_Status
FROM 
    Loans l
JOIN 
    Books b ON l.ISBN = b.ISBN
WHERE 
    l.Borrower_ID = 1;

-- 3. List All Administrators and the Books They Manage
SELECT 
    a.Admin_ID,
    u.First_Name || ' ' || u.Last_Name AS Admin_Name,
    b.ISBN,
    b.Title
FROM 
    Administrators a
JOIN 
    Users u ON a.User_ID = u.User_ID
JOIN 
    Books b ON a.Admin_ID = b.Admin_ID;

-- 4. Retrieve Overdue Loans
SELECT 
    l.Loan_Number,
    u.First_Name || ' ' || u.Last_Name AS Borrower_Name,
    b.Title,
    l.Due_Date,
    l.Return_Status
FROM 
    Loans l
JOIN 
    Borrowers br ON l.Borrower_ID = br.Borrower_ID
JOIN 
    Users u ON br.User_ID = u.User_ID
JOIN 
    Books b ON l.ISBN = b.ISBN
WHERE 
    l.Due_Date < SYSDATE AND l.Return_Status = 'N';

-- 5. Calculate Total Fines for Each Borrower
SELECT 
    br.Borrower_ID,
    u.First_Name || ' ' || u.Last_Name AS Borrower_Name,
    SUM(l.Fine_Amount) AS Total_Fines
FROM 
    Loans l
JOIN 
    Borrowers br ON l.Borrower_ID = br.Borrower_ID
JOIN 
    Users u ON br.User_ID = u.User_ID
GROUP BY 
    br.Borrower_ID, u.First_Name, u.Last_Name;
