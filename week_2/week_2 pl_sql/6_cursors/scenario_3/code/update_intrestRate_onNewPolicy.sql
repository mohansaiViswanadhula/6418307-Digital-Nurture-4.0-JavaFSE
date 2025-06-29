SET SERVEROUTPUT ON;

DECLARE
    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID, LoanAmount, InterestRate
        FROM Loans;

    v_loan_id Loans.LoanID%TYPE;
    v_amount Loans.LoanAmount%TYPE;
    v_rate Loans.InterestRate%TYPE;

    v_increment NUMBER;
BEGIN
    OPEN UpdateLoanInterestRates;
    LOOP
        FETCH UpdateLoanInterestRates INTO v_loan_id, v_amount, v_rate;
        EXIT WHEN UpdateLoanInterestRates%NOTFOUND;


        IF v_amount >= 10000 THEN
            v_increment := 0.5;
        ELSE
            v_increment := 0.25;
        END IF;

        UPDATE Loans
        SET InterestRate = InterestRate + v_increment
        WHERE LoanID = v_loan_id;

        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan_id ||  ' | Old Rate: ' || v_rate ||  ' | Increment: ' || v_increment ||  ' | New Rate: ' || (v_rate + v_increment));
    END LOOP;
    CLOSE UpdateLoanInterestRates;
END;
/
