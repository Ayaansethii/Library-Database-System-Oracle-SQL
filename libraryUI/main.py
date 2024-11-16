import oracledb

try:
    # Connection details
    username = "a24sethi"  # Replace with your actual username
    password = "03039118"  # Replace with your actual password
    host = "oracle12c.scs.ryerson.ca"
    port = 1521
    sid = "orcl12c"

    # Connection string (DSN)
    dsn = oracledb.makedsn(host, port, sid=sid)

    # Establishing the connection
    conn = oracledb.connect(user=username, password=password, dsn=dsn)
    print("Connection established:", conn.version)

    # Create a cursor to execute SQL queries
    cursor = conn.cursor()

    # Query the Administrators table
    cursor.execute("SELECT * FROM Administrators")

    # Fetch and display the rows
    print("Results from the 'Administrators' table:")
    for row in cursor:
        print(row)

except oracledb.DatabaseError as e:
    # Print database connection errors
    print("Database connection error:", e)
finally:
    # Close the cursor and connection
    if 'cursor' in locals() and cursor:
        cursor.close()
        print("Cursor closed.")
    if 'conn' in locals() and conn:
        conn.close()
        print("Connection closed.")
