\c postgres

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT pid FROM pg_stat_activity WHERE datname = 'git_bank' AND pid <> pg_backend_pid()) LOOP
        EXECUTE 'SELECT pg_terminate_backend(' || r.pid || ');';
    END LOOP;
END $$;

DROP DATABASE IF EXISTS git_bank;

CREATE DATABASE git_bank;

\c git_bank

BEGIN;

CREATE TABLE IF NOT EXISTS clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cards (
    card_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id) ON DELETE CASCADE,
    card_number VARCHAR(16) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS client_balance (
    card_id INT REFERENCES cards(card_id) ON DELETE CASCADE,
    balance DECIMAL(10, 2) DEFAULT 0.00 NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id SERIAL PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type VARCHAR(50) CHECK (transaction_type IN ('credit', 'debit')),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS card_transactions (
    card_id INT REFERENCES cards(card_id) ON DELETE CASCADE,
    transaction_id INT REFERENCES transactions(transaction_id) ON DELETE CASCADE,
    PRIMARY KEY (card_id, transaction_id)
);

ALTER TABLE cards ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES clients(client_id);
ALTER TABLE client_balance ADD CONSTRAINT fk_card_id FOREIGN KEY (card_id) REFERENCES cards(card_id);
ALTER TABLE card_transactions ADD CONSTRAINT fk_card_transaction_card FOREIGN KEY (card_id) REFERENCES cards(card_id);
ALTER TABLE card_transactions ADD CONSTRAINT fk_card_transaction_transaction FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id);

COMMIT;
