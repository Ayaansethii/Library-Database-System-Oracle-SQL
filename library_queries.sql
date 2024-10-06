-- 1. Retrieve all users from the Users table
-- This query gets all the information about users, like their names, contact details, and addresses.
SELECT 
    User_ID,  -- Unique identifier for the user
    First_Name,  -- User's first name
    Last_Name,  -- User's last name
    Phone_Number,  -- User's phone number
    Email,  -- User's email address
    Username,  -- User's login name
    Street,  -- User's street address
    City,  -- User's city
    State,  -- User's state
    ZIP_Code  -- User's ZIP code
FROM 
    Users  -- From the Users table
ORDER BY 
    Last_Name, First_Name;  -- Order the results by last name, then first name

-- 2. List all borrowers with their borrowing limits
-- This query gets details about borrowers and shows how many books they can borrow.
SELECT 
    B.Borrower_ID,  -- Unique identifier for the borrower
    U.First_Name,  -- Borrower's first name
    U.Last_Name,  -- Borrower's last name
    B.Borrowing_Limit,  -- Maximum number of books the borrower can have
    B.Amount_Payable  -- Amount of fees or fines the borrower owes
FROM 
    Borrowers B  -- From the Borrowers table
JOIN 
    Users U ON B.User_ID = U.User_ID  -- Join with Users to get borrower names
ORDER BY 
    B.Borrowing_Limit DESC;  -- Order by borrowing limit from highest to lowest

-- 3. Display all administrators and their roles
-- This query shows details about administrators, including their roles and permissions.
SELECT 
    A.Admin_ID,  -- Unique identifier for the administrator
    U.First_Name,  -- Administrator's first name
    U.Last_Name,  -- Administrator's last name
    A.Role,  -- The role or job title of the administrator
    A.Permissions,  -- Access rights for the administrator
    A.Last_Login  -- Date the administrator last logged in
FROM 
    Administrators A  -- From the Administrators table
JOIN 
    Users U ON A.User_ID = U.User_ID  -- Join with Users to get admin names
ORDER BY 
    A.Role;  -- Order results by the role of the administrators

-- 4. List all authors by nationality
-- This query retrieves a list of authors and shows their nationalities.
SELECT 
    Nationality,  -- Nationality of the author
    Name  -- Name of the author
FROM 
    Authors  -- From the Authors table
ORDER BY 
    Nationality, Name;  -- Order results by nationality, then name

-- 5. Retrieve all genres and their descriptions
-- This query fetches all book genres and gives a brief description of each.
SELECT 
    Genre_ID,  -- Unique identifier for the genre
    Title,  -- Title of the genre
    Description  -- Description of what the genre is about
FROM 
    Genres  -- From the Genres table
ORDER BY 
    Title;  -- Order results by genre title

-- 6. List all books with availability status
-- This query lists all books that have copies available for borrowing.
SELECT 
    ISBN,  -- Unique identifier for each book
    Title,  -- Title of the book
    Copies_Available  -- Number of copies available for borrowing
FROM 
    Books  -- From the Books table
WHERE 
    Copies_Available > 0  -- Only show books with available copies
ORDER BY 
    Title;  -- Order results by book title

-- 7. Display all active loans
-- This query retrieves loans that are currently active (not returned).
SELECT 
    Loan_Number,  -- Unique identifier for the loan
    Borrower_ID,  -- ID of the borrower who took the loan
    ISBN,  -- ISBN of the book loaned
    Loan_Date,  -- Date when the loan was made
    Due_Date,  -- Date when the loan is due
    Fine_Amount  -- Fine amount for overdue books
FROM 
    Loans  -- From the Loans table
WHERE 
    Return_Status = 'N'  -- Only show loans that have not been returned
ORDER BY 
    Due_Date;  -- Order results by due date

-- 8. Show book-author relationships
-- This query lists books along with their associated authors.
SELECT 
    BA.ISBN,  -- ISBN of the book
    B.Title AS Book_Title,  -- Title of the book
    BA.Author_ID,  -- ID of the author
    A.Name AS Author_Name  -- Name of the author
FROM 
    BookAuthor BA  -- From the BookAuthor table (links books and authors)
JOIN 
    Books B ON BA.ISBN = B.ISBN  -- Join with Books to get book titles
JOIN 
    Authors A ON BA.Author_ID = A.Author_ID  -- Join with Authors to get author names
ORDER BY 
    B.Title, A.Name;  -- Order results by book title, then author name

-- 9. Display book-genre associations
-- This query shows which genres are associated with each book.
SELECT 
    BG.ISBN,  -- ISBN of the book
    B.Title AS Book_Title,  -- Title of the book
    BG.Genre_ID,  -- ID of the genre
    G.Title AS Genre_Title  -- Title of the genre
FROM 
    BookGenre BG  -- From the BookGenre table (links books and genres)
JOIN 
    Books B ON BG.ISBN = B.ISBN  -- Join with Books to get book titles
JOIN 
    Genres G ON BG.Genre_ID = G.Genre_ID  -- Join with Genres to get genre titles
ORDER BY 
    B.Title, G.Title;  -- Order results by book title, then genre title

-- 10. Advanced join: List loans with borrower and book details
-- This query retrieves detailed information about loans that are not returned.
SELECT 
    L.Loan_Number,  -- Unique identifier for the loan
    U.First_Name || ' ' || U.Last_Name AS Borrower_Name,  -- Full name of the borrower
    B.Title AS Book_Title,  -- Title of the book loaned
    L.Loan_Date,  -- Date when the loan was made
    L.Due_Date,  -- Date when the loan is due
    L.Return_Status  -- Status of the return (returned or not)
FROM 
    Loans L  -- From the Loans table
JOIN 
    Borrowers BR ON L.Borrower_ID = BR.Borrower_ID  -- Join with Borrowers to link loans to borrowers
JOIN 
    Users U ON BR.User_ID = U.User_ID  -- Join with Users to get borrower names
JOIN 
    Books B ON L.ISBN = B.ISBN  -- Join with Books to get book details
WHERE 
    L.Return_Status = 'N'  -- Only include loans that are still active
ORDER BY 
    L.Due_Date;  -- Order results by due date

-- 11. Create a view for active loans
-- This creates a view to easily access details about all active loans.
CREATE OR REPLACE VIEW ActiveLoans AS
SELECT 
    L.Loan_Number,  -- Unique identifier for the loan
    U.First_Name || ' ' || U.Last_Name AS Borrower_Name,  -- Full name of the borrower
    B.Title AS Book_Title,  -- Title of the book loaned
    L.Loan_Date,  -- Date when the loan was made
    L.Due_Date,  -- Date when the loan is due
    L.Fine_Amount  -- Fine amount for overdue loans
FROM 
    Loans L  -- From the Loans table
JOIN 
    Borrowers BR ON L.Borrower_ID = BR.Borrower_ID  -- Join with Borrowers to link loans to borrowers
JOIN 
    Users U ON BR.User_ID = U.User_ID  -- Join with Users to get borrower names
JOIN 
    Books B ON L.ISBN = B.ISBN  -- Join with Books to get book details
WHERE 
    L.Return_Status = 'N';  -- Only include loans that have not been returned

-- 12. Create a view for borrower details
-- This creates a view to easily access detailed information about borrowers.
CREATE OR REPLACE VIEW BorrowerDetails AS
SELECT 
    B.Borrower_ID,  -- Unique identifier for the borrower
    U.First_Name,  -- Borrower's first name
    U.Last_Name,  -- Borrower's last name
    U.Email,  -- Borrower's email address
    U.Phone_Number,  -- Borrower's phone number
    B.Borrowing_Limit,  -- Maximum number of books the borrower can borrow
    B.Amount_Payable  -- Amount of fees or fines the borrower owes
FROM 
    Borrowers B  -- From the Borrowers table
JOIN 
    Users U ON B.User_ID = U.User_ID;  -- Join with Users to get borrower names

-- 13. Create a view for book availability
-- This creates a view to easily access information about books that have available copies.
CREATE OR REPLACE VIEW BookAvailability AS
SELECT 
    ISBN,  -- Unique identifier for the book
    Title,  -- Title of the book
    Copies_Available,  -- Number of copies available for borrowing
    Publisher  -- Publisher of the book
FROM 
    Books  -- From the Books table
WHERE 
    Copies_Available > 0  -- Only include books with available copies
ORDER BY 
	Title;

-- 14. Query the ActiveLoans view
-- This retrieves all active loans from the ActiveLoans view and orders them by due date.
SELECT 
    Loan_Number,  -- Unique identifier for the loan
    Borrower_Name,  -- Full name of the borrower
    Book_Title,  -- Title of the book loaned
    Loan_Date,  -- Date when the loan was made
    Due_Date,  -- Date when the loan is due
    Fine_Amount  -- Fine amount for overdue loans
FROM 
    ActiveLoans  -- From the ActiveLoans view
ORDER BY 
    Due_Date;  -- Order results by due date

-- 15. Query the BorrowerDetails view
-- This retrieves detailed information about borrowers from the BorrowerDetails view.
SELECT 
    Borrower_ID,  -- Unique identifier for the borrower
    First_Name,  -- Borrower's first name
    Last_Name,  -- Borrower's last name
    Email,  -- Borrower's email address
    Phone_Number,  -- Borrower's phone number
    Borrowing_Limit,  -- Maximum number of books the borrower can borrow
    Amount_Payable  -- Amount of fees or fines the borrower owes
FROM 
    BorrowerDetails  -- From the BorrowerDetails view
ORDER BY 
    Last_Name, First_Name;  -- Order results by last name, then first name

-- 16. Query the BookAvailability view
-- This retrieves all available books from the BookAvailability view.
SELECT 
    ISBN,  -- Unique identifier for the book
    Title,  -- Title of the book
    Copies_Available,  -- Number of copies available for borrowing
    Publisher  -- Publisher of the book
FROM 
    BookAvailability  -- From the BookAvailability view
ORDER BY 
    Title;  -- Order results by book title

