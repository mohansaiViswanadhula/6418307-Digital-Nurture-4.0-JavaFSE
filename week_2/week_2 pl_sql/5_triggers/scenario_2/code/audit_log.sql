SET SERVEROUTPUT ON;

CREATE TABLE AuditLog (
    LogID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    AccountID NUMBER,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    TransactionDate DATE,
    LoggedAt DATE DEFAULT SYSDATE
);

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (AccountID, Amount, TransactionType, TransactionDate)
    VALUES (:NEW.AccountID, :NEW.Amount, :NEW.TransactionType, :NEW.TransactionDate);
END;
/

BEGIN
    INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (3, 1, SYSDATE, 750, 'Deposit');

    DBMS_OUTPUT.PUT_LINE('Transaction inserted. Audit triggered.');
END;
/

SELECT * FROM AuditLog;
