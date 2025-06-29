SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN NUMBER,
    p_amount     IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = p_account_id;

    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account not found.');
        RETURN FALSE;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := HasSufficientBalance(1, 500);

    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Sufficient');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient');
    END IF;
END;
/
