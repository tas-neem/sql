CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100),
    email VARCHAR2(100) UNIQUE,
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    balance NUMBER(15,2) DEFAULT 0 CHECK (balance >= 0),
    account_type VARCHAR2(20) CHECK (account_type IN ('SAVINGS', 'CURRENT'))
);

CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER REFERENCES accounts(account_id),
    amount NUMBER(15,2),
    transaction_type VARCHAR2(10) CHECK (transaction_type IN ('DEBIT', 'CREDIT')),
    transaction_date DATE DEFAULT SYSDATE
);
