
SET SERVEROUTPUT ON;

DECLARE
    CURSOR GenerateMonthlyStatements IS
        SELECT c.CustomerID, c.Name, t.TransactionID, t.Amount, t.TransactionType, t.TransactionDate
        FROM Customers c
        JOIN Accounts a ON c.CustomerID = a.CustomerID
        JOIN Transactions t ON a.AccountID = t.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE)
        ORDER BY c.CustomerID, t.TransactionDate;

    v_cust_id Customers.CustomerID%TYPE;
    v_name Customers.Name%TYPE;
    v_tid Transactions.TransactionID%TYPE;
    v_amt Transactions.Amount%TYPE;
    v_type Transactions.TransactionType%TYPE;
    v_date Transactions.TransactionDate%TYPE;
BEGIN
    OPEN GenerateMonthlyStatements;
    LOOP
        FETCH GenerateMonthlyStatements INTO v_cust_id, v_name, v_tid, v_amt, v_type, v_date;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_name ||  ' | Transaction ID: ' || v_tid || ' | Type: ' || v_type ||  ' | Amount: ' || v_amt || ' | Date: ' || TO_CHAR(v_date, 'DD-MON-YYYY'));
    END LOOP;
    CLOSE GenerateMonthlyStatements;
END;
/
