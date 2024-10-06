# Syntax 

### 1. **`SELECT`**
   - **Purpose:** The `SELECT` statement is used to retrieve data from the database. It specifies which columns of data should be returned in the query results.
   - **Example:** When you see `SELECT User_ID, First_Name`, it means the query will return data from the `User_ID` and `First_Name` columns.

### 2. **Column Aliases (`AS`)**
   - **Purpose:** The `AS` keyword is used to create an alias for a column or table. This alias can make the output more readable by giving meaningful names to columns in the result.
   - **Example:** In `SELECT B.Title AS Book_Title`, the column `Title` is renamed to `Book_Title` in the query output.

### 3. **`FROM`**
   - **Purpose:** The `FROM` clause specifies the table from which to retrieve the data.
   - **Example:** `FROM Users` means the data will be retrieved from the `Users` table.

### 4. **`JOIN`**
   - **Purpose:** A `JOIN` clause is used to combine rows from two or more tables based on a related column between them.
   - **Types:**
     - **`INNER JOIN` (Default)**: Retrieves rows that have matching values in both tables.
     - **Syntax:** `JOIN TableB ON TableA.Column = TableB.Column`
   - **Example:** `JOIN Users U ON B.User_ID = U.User_ID` joins the `Borrowers` table with the `Users` table, using the `User_ID` column to match rows between the two tables.

### 5. **`ORDER BY`**
   - **Purpose:** The `ORDER BY` clause is used to sort the result set based on one or more columns.
   - **Example:** `ORDER BY Last_Name, First_Name` will sort the results first by `Last_Name` and then by `First_Name` in ascending order (A-Z).

### 6. **`DESC`**
   - **Purpose:** When combined with `ORDER BY`, `DESC` sorts the result in **descending** order (highest to lowest or Z-A).
   - **Example:** `ORDER BY B.Borrowing_Limit DESC` will sort the results by borrowing limit, starting with the highest limit.

### 7. **`WHERE`**
   - **Purpose:** The `WHERE` clause filters the result set to include only rows that meet specified conditions.
   - **Example:** `WHERE Copies_Available > 0` filters the query results to only include books that have available copies.

### 8. **`ON`**
   - **Purpose:** The `ON` clause is used in a `JOIN` to define the condition that links the two tables.
   - **Example:** `ON B.User_ID = U.User_ID` specifies that the rows from the `Borrowers` table will be matched with the `Users` table based on the `User_ID` column.

### 9. **`DISTINCT`** (Not used in this code, but mentioned in your requirements)
   - **Purpose:** The `DISTINCT` keyword eliminates duplicate rows from the result set, returning only unique rows.
   - **Example:** If used as `SELECT DISTINCT Genre_Title`, it would return each genre title only once, even if it appears multiple times in the table.

### 10. **`GROUP BY`** (Not used in this code, but important)
   - **Purpose:** The `GROUP BY` clause groups rows that have the same values in specified columns into summary rows. It is often used with aggregate functions like `COUNT`, `SUM`, `AVG`, etc.
   - **Example:** If you were grouping books by genre, you might use `GROUP BY Genre_Title` to group all books by their genre.

### 11. **`CREATE VIEW`**
   - **Purpose:** The `CREATE VIEW` statement creates a virtual table (a view) based on a `SELECT` query. Views are saved queries that can be treated like tables but don’t actually store data.
   - **Example:** `CREATE VIEW ActiveLoans AS SELECT ...` creates a view called `ActiveLoans`, which represents the active loans based on the query specified.

### 12. **Concatenation (`||`)**
   - **Purpose:** The `||` operator concatenates two strings together.
   - **Example:** `U.First_Name || ' ' || U.Last_Name AS Borrower_Name` combines the first and last names with a space in between and renames it as `Borrower_Name`.

### 13. **Comments (`--`)**
   - **Purpose:** Comments are used to explain what a part of the code is doing. Anything following `--` on a line is ignored by the SQL engine.
   - **Example:** `-- This query gets all the information about users` is a comment explaining the purpose of the query.

### 14. **`VIEW`**
   - **Purpose:** A view is essentially a stored query that can be used like a table. It doesn’t store data itself but can be queried to produce the same result set as the original query.
   - **Example:** A view like `BorrowerDetails` can be queried as if it were a table, simplifying repeated access to the same joined data.

### 15. **`WHERE` Condition**
   - **Purpose:** The `WHERE` clause filters the query result to return only rows that satisfy a specific condition.
   - **Example:** `WHERE Return_Status = 'N'` ensures that only rows where the book has not been returned are included in the result.

### 16. **Aliases for Tables**
   - **Purpose:** Table aliases are used to shorten the name of a table within a query. This is especially useful when multiple tables are involved, or when referencing columns from the same table multiple times.
   - **Example:** `Borrowers B` uses `B` as a shorter alias for the `Borrowers` table, so instead of writing `Borrowers.User_ID`, you can write `B.User_ID`.

### 17. **Aggregate Functions** (Could be added in future queries)
   - These functions compute a single result from a set of input values, such as `COUNT()`, `SUM()`, `AVG()`, etc.  
   - Example: You could use `COUNT(Loan_Number)` to count the total number of active loans.

### 18. **Logical Operators (`AND`, `OR`, `NOT`)**
   - **Purpose:** These are used in `WHERE` clauses to combine conditions.
   - **Example:** You could combine conditions like `WHERE Copies_Available > 0 AND Genre_ID = 1`.

### **In Summary:**
- The `SELECT` statement retrieves data.
- `FROM` specifies the table.
- `JOIN` is used to combine tables.
- `WHERE` filters the results.
- `ORDER BY` sorts the results.
- Views (`CREATE VIEW`) are virtual tables.
- Aliases (`AS`) make columns and tables easier to reference.
- `DISTINCT` and `GROUP BY` are advanced techniques to avoid duplicates and group data.

