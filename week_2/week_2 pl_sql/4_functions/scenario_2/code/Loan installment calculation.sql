SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount   IN NUMBER,
    p_annual_rate   IN NUMBER,
    p_years         IN NUMBER
) RETURN NUMBER IS
    v_monthly_rate NUMBER;
    v_months       NUMBER;
    v_emi          NUMBER;
BEGIN
    -- Convert annual rate to monthly decimal rate
    v_monthly_rate := p_annual_rate / 12 / 100;
    v_months := p_years * 12;

    -- EMI Formula: [P * R * (1+R)^N] / [(1+R)^N - 1]
    v_emi := (p_loan_amount * v_monthly_rate * POWER(1 + v_monthly_rate, v_months)) /
             (POWER(1 + v_monthly_rate, v_months) - 1);

    RETURN ROUND(v_emi, 2);
END;
/

DECLARE
    v_result NUMBER;
BEGIN
    v_result := CalculateMonthlyInstallment(50000, 7.5, 5);
    DBMS_OUTPUT.PUT_LINE('Monthly EMI: ' || v_result);
END;
/

