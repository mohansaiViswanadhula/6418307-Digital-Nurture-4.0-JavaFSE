SET SERVEROUTPUT ON;

DECLARE
    v_customer_id NUMBER := 99; -- customer ID that does not exist
    v_new_balance NUMBER := 20000;
BEGIN
    UPDATE Customers
    SET Balance = v_new_balance,
        LastModified = SYSDATE
    WHERE CustomerID = v_customer_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Customer ID ' || v_customer_id || ' not found.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Customer ID ' || v_customer_id || ' updated successfully.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
