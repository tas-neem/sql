CREATE OR REPLACE TRIGGER trg_check_transaction_amount
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF :NEW.amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Transaction amount must be positive.');
    END IF;
END;
/
