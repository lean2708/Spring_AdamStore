-- Role
CREATE TABLE roles (
           id BIGSERIAL PRIMARY KEY,
           name VARCHAR(100) NOT NULL UNIQUE,
           description TEXT,

           created_at DATE,
           updated_at DATE
);


-- UserHasRole
CREATE TABLE user_has_role (
           user_id BIGINT NOT NULL,
           role_id BIGINT NOT NULL,
           state VARCHAR(20),

           PRIMARY KEY (user_id, role_id),

           CONSTRAINT fk_user_has_role_user FOREIGN KEY (user_id) REFERENCES users(id),
           CONSTRAINT fk_user_has_role_role FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Index
CREATE INDEX idx_user_has_role_user_id ON user_has_role(user_id);
CREATE INDEX idx_user_has_role_role_id ON user_has_role(role_id);
