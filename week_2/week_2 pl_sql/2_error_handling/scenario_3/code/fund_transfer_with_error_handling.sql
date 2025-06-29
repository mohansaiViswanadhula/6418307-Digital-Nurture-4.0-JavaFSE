-- Assignment: Transfer funds between customers with error handling

SET SERVEROUTPUT ON;

DECLARE
    v_sender_id   NUMBER := 1;
    v_receiver_id NUMBER := 2;
    v_amount      NUMBER := 3000;
    v_sender_balance NUMBER;
BEGIN
    -- Check sender balance
    SELECT Balance INTO v_sender_balance
    FROM Customers
    WHERE CustomerID = v_sender_id;

    IF v_sender_balance < v_amount THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance for transfer.');
    END IF;

    -- Deduct from sender
    UPDATE Customers
    SET Balance = Balance - v_amount,
        LastModified = SYSDATE
    WHERE CustomerID = v_sender_id;

    -- Add to receiver
    UPDATE Customers
    SET Balance = Balance + v_amount,
        LastModified = SYSDATE
    WHERE CustomerID = v_receiver_id;

    DBMS_OUTPUT.PUT_LINE('Transferred ' || v_amount || ' from Customer ' || v_sender_id || ' to Customer ' || v_receiver_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: One of the customer IDs does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
