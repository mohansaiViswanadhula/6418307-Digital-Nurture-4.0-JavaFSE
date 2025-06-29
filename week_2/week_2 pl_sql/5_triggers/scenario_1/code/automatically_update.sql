CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

SET SERVEROUTPUT ON;

BEGIN
    UPDATE Customers
    SET Name = 'John D.'
    WHERE CustomerID = 1;

    DBMS_OUTPUT.PUT_LINE('Customer updated.');
END;
/

SELECT CustomerID, Name, LastModified
FROM Customers
WHERE CustomerID = 1;
