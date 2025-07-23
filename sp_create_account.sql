CREATE OR REPLACE PROCEDURE sp_create_account(
    p_customer_id IN NUMBER,
    p_account_type IN VARCHAR2,
    p_initial_deposit IN NUMBER
)
IS
BEGIN
    IF p_initial_deposit < 100 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Minimum deposit of 100 required.');
    END IF;

    INSERT INTO accounts (account_id, customer_id, balance, account_type)
    VALUES (accounts_seq.NEXTVAL, p_customer_id, p_initial_deposit, p_account_type);
END;
/
