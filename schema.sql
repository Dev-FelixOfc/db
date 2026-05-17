CREATE TABLE IF NOT EXISTS chats (
    jid TEXT PRIMARY KEY,
    welcome BOOLEAN DEFAULT TRUE,
    antilink BOOLEAN DEFAULT TRUE,
    detect BOOLEAN DEFAULT TRUE,
    settings JSONB DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS users (
    jid TEXT PRIMARY KEY,
    wallet BIGINT DEFAULT 0,
    bank BIGINT DEFAULT 0,
    marry TEXT DEFAULT NULL,
    genre TEXT DEFAULT 'No definido',
    last_claim TIMESTAMP DEFAULT '1970-01-01 00:00:00',
    inventory JSONB DEFAULT '{}',
    birthday JSONB DEFAULT '{"date": "No definido", "age": "No definida"}',
    metadata JSONB DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS global_settings (
    id SERIAL PRIMARY KEY,
    maintance BOOLEAN DEFAULT FALSE,
    self_bot BOOLEAN DEFAULT FALSE,
    config JSONB DEFAULT '{}'
);