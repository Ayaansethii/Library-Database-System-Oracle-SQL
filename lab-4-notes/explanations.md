# Breakdown of what each section of the SQL script does in simple terms

### 1. **Retrieve all users from the Users table**  
This query retrieves basic information about all users stored in the system, such as their first and last names, phone numbers, email addresses, and addresses. The results are ordered alphabetically by the user's last name, followed by their first name for easier sorting.

### 2. **List all borrowers with their borrowing limits**  
This query gets a list of borrowers, showing their first and last names, along with their borrowing limits and any outstanding fees or fines. It connects the borrower information from the `Borrowers` table to the `Users` table to get their names. The list is ordered by the number of books each borrower is allowed to borrow, starting with the highest limit.

### 3. **Display all administrators and their roles**  
This query shows information about administrators, including their roles, permissions (what actions they are allowed to perform), and the last time they logged into the system. It pulls administrator details from the `Administrators` table and joins it with the `Users` table to show the admin's name. The results are sorted by the role of each administrator.

### 4. **List all authors by nationality**  
This query retrieves a list of authors, showing their nationality and name. It allows you to see where each author is from and groups them by nationality for easier reference, with the results ordered first by nationality and then by the author's name.

### 5. **Retrieve all genres and their descriptions**  
This query fetches information about book genres, including their titles and brief descriptions of what each genre is about. The results are ordered alphabetically by genre title to make it easy to find specific genres.

### 6. **List all books with availability status**  
This query shows all books that are available for borrowing. It includes the title of each book and how many copies are currently available in the library. It only lists books that have copies available (i.e., more than 0), and the results are ordered by the book title.

### 7. **Display all active loans**  
This query retrieves information about loans that are currently active—meaning the books haven't been returned yet. It shows the borrower's ID, the ISBN of the borrowed book, the loan date, due date, and any fines for late returns. The loans are ordered by their due date, so you can quickly see which loans are coming due or are overdue.

### 8. **Show book-author relationships**  
This query lists books along with the authors who wrote them. It pulls information from both the `Books` and `Authors` tables and links them using the `BookAuthor` table (which connects books to their authors). The results are ordered by the book title and then by the author's name.

### 9. **Display book-genre associations**  
This query shows which genres are associated with each book. It links books and genres through the `BookGenre` table, then retrieves the title of each book and the genre it falls under. The results are ordered by book title, followed by genre title.

### 10. **Advanced join: List loans with borrower and book details**  
This query provides detailed information about loans that haven't been returned yet, showing the borrower's full name, the title of the book, and when the loan was made. It combines information from four tables (`Loans`, `Borrowers`, `Users`, and `Books`) to give a complete picture of the loan status. The results are ordered by the loan's due date.

### 11. **Create a view for active loans**  
This part creates a view called `ActiveLoans` that stores the results of the query for active loans (those not yet returned). A view is a saved query that can be accessed later without having to rewrite the query. This view includes the loan number, borrower's name, book title, loan date, due date, and any fines for overdue books.

### 12. **Create a view for borrower details**  
This part creates a view called `BorrowerDetails` that shows detailed information about borrowers. The view includes the borrower's ID, first and last names, email address, phone number, borrowing limit, and any fees or fines they owe. This view is useful for quickly retrieving borrower details without having to join the `Users` and `Borrowers` tables again.

### 13. **Create a view for book availability**  
This part creates a view called `BookAvailability` that lists all books with available copies. The view includes the book's title, the number of available copies, and the publisher's name. It only shows books that have copies available, and the results are ordered by book title.

### 14. **Query the ActiveLoans view**  
This query retrieves data from the `ActiveLoans` view, showing all active loans (not yet returned), including the borrower's name, book title, loan date, due date, and any fines for overdue books. The results are ordered by the loan's due date.

### 15. **Query the BorrowerDetails view**  
This query pulls information from the `BorrowerDetails` view, retrieving detailed data about borrowers such as their ID, name, email, phone number, borrowing limit, and any outstanding fines. The results are ordered by the borrower's last name and first name for easier sorting.

### 16. **Query the BookAvailability view**  
This query retrieves data from the `BookAvailability` view, showing all books with available copies, including the book's title, number of available copies, and the publisher's name. The results are ordered by the book title for easy navigation. 

