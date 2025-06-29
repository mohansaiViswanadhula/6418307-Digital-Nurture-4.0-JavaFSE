SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    -- Rule 1: Deposit must be positive
    IF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Deposit amount must be positive.');
    END IF;

    -- Rule 2: Withdrawal must not exceed balance
    IF :NEW.TransactionType = 'Withdrawal' THEN
        SELECT Balance INTO v_balance
        FROM Accounts
        WHERE AccountID = :NEW.AccountID;

        IF :NEW.Amount > v_balance THEN
            RAISE_APPLICATION_ERROR(-20002, 'Withdrawal exceeds account balance.');
        END IF;
    END IF;
END;
/

BEGIN
    INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (4, 1, SYSDATE, 300, 'Deposit');

    DBMS_OUTPUT.PUT_LINE('Valid deposit inserted.');
END;
/

SELECT * FROM Transactions WHERE TransactionID = 4;
