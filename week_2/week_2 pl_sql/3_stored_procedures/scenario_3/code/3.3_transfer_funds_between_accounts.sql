SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_source_account   IN NUMBER,
    p_target_account   IN NUMBER,
    p_amount           IN NUMBER
) IS
    v_source_balance NUMBER;
BEGIN
    SELECT Balance INTO v_source_balance
    FROM Accounts
    WHERE AccountID = p_source_account;

    IF v_source_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds in source account.');
        RETURN;
    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_source_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_target_account;

    DBMS_OUTPUT.PUT_LINE('Transfer of $' || p_amount || ' completed successfully.');
END;
/

BEGIN
    TransferFunds(1, 2, 200);
END;
/
