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

CREATE TABLE IF NOT EXISTS gacha_ownership (
    id SERIAL PRIMARY KEY,
    group_jid TEXT NOT NULL,
    user_jid TEXT NOT NULL,
    character_id TEXT NOT NULL,
    status TEXT DEFAULT 'domado',
    acquired_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(group_jid, character_id)
);

CREATE TABLE IF NOT EXISTS gacha_shop (
    id SERIAL PRIMARY KEY,
    group_jid TEXT NOT NULL,
    seller_jid TEXT NOT NULL,
    character_id TEXT NOT NULL,
    character_name TEXT NOT NULL,
    sale_price BIGINT NOT NULL,
    listed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(group_jid, character_id)
);

CREATE INDEX IF NOT EXISTS idx_gacha_owner ON gacha_ownership(group_jid, user_jid);
CREATE INDEX IF NOT EXISTS idx_gacha_shop_group ON gacha_shop(group_jid);