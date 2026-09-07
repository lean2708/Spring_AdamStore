-- Refresh Token
CREATE TABLE refresh_tokens (
           id BIGSERIAL PRIMARY KEY,
           token TEXT NOT NULL UNIQUE,
           expiry_date TIMESTAMP NOT NULL
);
