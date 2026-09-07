-- Permission
CREATE TABLE permissions (
            id BIGSERIAL PRIMARY KEY,
            name VARCHAR(255) NOT NULL UNIQUE,
            module VARCHAR(255),
            api_path VARCHAR(1024),
            method VARCHAR(20)
);
CREATE INDEX idx_permission_api_path ON permissions(api_path);
CREATE INDEX idx_permission_method ON permissions(method);


-- RoleHasPermission
CREATE TABLE role_has_permission (
             role_id BIGINT NOT NULL,
             permission_id BIGINT NOT NULL,

             PRIMARY KEY (role_id, permission_id),

             CONSTRAINT fk_role_has_permission_role FOREIGN KEY (role_id) REFERENCES roles(id),
             CONSTRAINT fk_role_has_permission_permission FOREIGN KEY (permission_id) REFERENCES permissions(id)
);

-- Index
CREATE INDEX idx_role_has_permission_role_id ON role_has_permission(role_id);
CREATE INDEX idx_role_has_permission_permission_id ON role_has_permission(permission_id);
