SET SERVEROUTPUT ON;

DECLARE
    v_fee CONSTANT NUMBER := 100;

    CURSOR ApplyAnnualFee IS
        SELECT AccountID, Balance
        FROM Accounts;

    v_acc_id Accounts.AccountID%TYPE;
    v_balance Accounts.Balance%TYPE;
BEGIN
    OPEN ApplyAnnualFee;
    LOOP
        FETCH ApplyAnnualFee INTO v_acc_id, v_balance;
        EXIT WHEN ApplyAnnualFee%NOTFOUND;

        IF v_balance >= v_fee THEN
            UPDATE Accounts
            SET Balance = Balance - v_fee,
                LastModified = SYSDATE
            WHERE AccountID = v_acc_id;

            DBMS_OUTPUT.PUT_LINE('Annual fee of ' || v_fee ||  ' deducted from Account ID: ' || v_acc_id);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_acc_id || ' skipped due to insufficient balance.');
        END IF;
    END LOOP;
    CLOSE ApplyAnnualFee;
END;
/
