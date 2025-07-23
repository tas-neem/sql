CREATE OR REPLACE PROCEDURE sp_transfer_money(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN
    SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from_account FOR UPDATE;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds.');
    END IF;

    UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from_account;
    UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to_account;

    INSERT INTO transactions (transaction_id, account_id, amount, transaction_type)
    VALUES (transactions_seq.NEXTVAL, p_from_account, p_amount, 'DEBIT');

    INSERT INTO transactions (transaction_id, account_id, amount, transaction_type)
    VALUES (transactions_seq.NEXTVAL, p_to_account, p_amount, 'CREDIT');
END;
/
