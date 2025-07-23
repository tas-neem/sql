CREATE OR REPLACE PACKAGE BODY pkg_customer_validation IS
    FUNCTION is_valid_email(p_email IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        RETURN fn_validate_email(p_email);
    END;

    PROCEDURE validate_new_customer(p_name IN VARCHAR2, p_email IN VARCHAR2) IS
    BEGIN
        IF LENGTH(p_name) < 3 THEN
            RAISE_APPLICATION_ERROR(-20004, 'Customer name too short.');
        END IF;

        IF NOT is_valid_email(p_email) THEN
            RAISE_APPLICATION_ERROR(-20005, 'Invalid email address.');
        END IF;
    END;
END pkg_customer_validation;
/
