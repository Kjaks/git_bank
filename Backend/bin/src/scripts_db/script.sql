DO $$
BEGIN
	DROP DATABASE IF EXISTS git_bank;

	CREATE DATABASE git_bank;

    CREATE TABLE IF NOT EXISTS users (
        user_id SERIAL PRIMARY KEY,
        username VARCHAR(100) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS cards (
        card_id SERIAL PRIMARY KEY,
        user_id INT REFERENCES users(user_id),
        card_number VARCHAR(16) UNIQUE NOT NULL
    );

    CREATE TABLE IF NOT EXISTS user_balance (
        card_id INT NOT NULL,
        balance DECIMAL(10, 2) DEFAULT 0.00 NOT NULL,
        last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_card_id FOREIGN KEY (card_id) REFERENCES cards(card_id)
    );

    CREATE TABLE IF NOT EXISTS transactions (
        transaction_id SERIAL PRIMARY KEY,
        amount DECIMAL(10, 2) NOT NULL,
        transaction_type VARCHAR(50) CHECK (transaction_type IN ('credit', 'debit')),
        transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS card_transactions (
        card_id INT REFERENCES cards(card_id),
        transaction_id INT REFERENCES transactions(transaction_id),
        PRIMARY KEY (card_id, transaction_id)
    );
END $$;