-- User
CREATE TABLE users (
        id BIGSERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        avatar_url VARCHAR(512),
        dob DATE,
        gender VARCHAR(20),
        status VARCHAR(20),

        created_by VARCHAR(255),
        updated_by VARCHAR(255),
        created_at DATE,
        updated_at DATE
);


-- Index
CREATE INDEX idx_user_name ON users(name);
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_password ON users(password);
CREATE INDEX idx_user_avatar_url ON users(avatar_url);