CREATE OR REPLACE PACKAGE pkg_customer_validation IS
    FUNCTION is_valid_email(p_email IN VARCHAR2) RETURN BOOLEAN;
    PROCEDURE validate_new_customer(p_name IN VARCHAR2, p_email IN VARCHAR2);
END pkg_customer_validation;
/
