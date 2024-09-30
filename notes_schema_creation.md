These are the break down each unique syntax and explain its function in simple terms for the schema_creation.sql file.

### 1. **`NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY`**
   - **What it does:** This creates a column (`User_ID`, `Borrower_ID`, etc.) that auto-generates a unique numeric value for each new row inserted into the table. It's used to automatically assign a unique ID to each record (this is helpful for identifying specific rows in the table). 
   - **`PRIMARY KEY`**: Ensures that this column is unique and cannot be `NULL`. This guarantees that each entry has a unique identifier.
   - **Example:** When a new user is added to the `Users` table, `User_ID` is automatically generated and incremented.

### 2. **`VARCHAR2(size)`**
   - **What it does:** Defines a string or text field. The number in parentheses (e.g., `VARCHAR2(50)`) indicates the maximum number of characters that can be stored in that field.
   - **Example:** `First_Name VARCHAR2(50)` means the first name can be up to 50 characters long.

### 3. **`NOT NULL`**
   - **What it does:** Specifies that the column cannot contain `NULL` values. This means that every record must provide a value for this field.
   - **Example:** `First_Name VARCHAR2(50) NOT NULL` means every user must have a first name.

### 4. **`UNIQUE`**
   - **What it does:** Ensures that all values in this column are unique, meaning no two rows can have the same value for this column.
   - **Example:** `Email VARCHAR2(100) UNIQUE` means no two users can have the same email address.

### 5. **`FOREIGN KEY` and `REFERENCES`**
   - **What it does:** This defines a relationship between two tables. The `FOREIGN KEY` indicates that the values in this column must match values in another table's `PRIMARY KEY` (or unique key).
   - **`REFERENCES`:** Specifies which table and column the foreign key is linked to.
   - **Example:** `FOREIGN KEY (User_ID) REFERENCES Users(User_ID)` in the `Borrowers` table ensures that each borrower is also a user. The `User_ID` in the `Borrowers` table must match an existing `User_ID` in the `Users` table.

### 6. **`CHECK`**
   - **What it does:** Adds a condition to a column to ensure that only certain values are allowed.
   - **Example:** `CHECK (Borrowing_Limit > 0)` in the `Borrowers` table ensures that the `Borrowing_Limit` must always be greater than zero.

### 7. **`DEFAULT`**
   - **What it does:** Sets a default value for a column if no value is provided when a new record is inserted.
   - **Example:** `Borrowing_Limit NUMBER DEFAULT 5` sets the default value for the `Borrowing_Limit` to 5 if not provided during insertion.

### 8. **`CLOB`**
   - **What it does:** Stands for "Character Large Object." It stores large amounts of text (much larger than `VARCHAR2`). It’s typically used for long text like biographies, descriptions, or documentation.
   - **Example:** `Biography CLOB` in the `Authors` table allows for storing large text entries about the author's background.

### 9. **`DATE`**
   - **What it does:** Defines a column that stores date values. 
   - **Example:** `Publication_Date DATE` in the `Books` table stores the publication date of the book.

### 10. **`CHAR(1)`**
   - **What it does:** Defines a fixed-length character string of size 1, meaning it can only hold a single character.
   - **Example:** `Return_Status CHAR(1) CHECK (Return_Status IN ('Y', 'N'))` allows only the values 'Y' (Yes) or 'N' (No) for this column, indicating whether a book has been returned.

### 11. **`COMPOSITE PRIMARY KEY`**
   - **What it does:** Combines two or more columns to form a single primary key, ensuring that the combination of these values is unique.
   - **Example:** `PRIMARY KEY (ISBN, Author_ID)` in the `BookAuthor` table ensures that the combination of a specific book (`ISBN`) and author (`Author_ID`) is unique, which is useful in many-to-many relationships.

### 12. **`SYSDATE`**
   - **What it does:** Inserts the current system date (the date when the record is inserted) as the default value for a `DATE` column.
   - **Example:** `Loan_Date DATE DEFAULT SYSDATE` automatically sets the loan date to the current date when a loan record is created.

### Relationships Defined in the Schema
- **Foreign Keys**: These relationships help enforce referential integrity, ensuring that data between tables is consistent. For example:
  - A borrower (`Borrower_ID`) must be linked to a valid user (`User_ID`) from the `Users` table.
  - A book loan (`ISBN`) must reference a valid book in the `Books` table.
  - The `Admin_ID` in `Loans` ensures that each loan is overseen by an administrator from the `Administrators` table.

