-- Province
CREATE TABLE provinces (
          id INT PRIMARY KEY,
          name VARCHAR(255) NOT NULL
);

-- District
CREATE TABLE districts (
          id INT PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          province_id INT NOT NULL,
          CONSTRAINT fk_district_province FOREIGN KEY (province_id) REFERENCES provinces(id)
);
CREATE INDEX idx_province_id ON districts(province_id);

-- Ward
CREATE TABLE wards (
          code VARCHAR(20) PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          district_id INT NOT NULL,
          CONSTRAINT fk_ward_district FOREIGN KEY (district_id) REFERENCES districts(id)
);
CREATE INDEX idx_district_id ON wards(district_id);

-- Address
CREATE TABLE addresses (
         id BIGSERIAL PRIMARY KEY,
         is_default BOOLEAN,
         is_visible BOOLEAN,
         status VARCHAR(50),
         phone VARCHAR(50),
         street_detail VARCHAR(255),
         ward_code VARCHAR(20),
         district_id INT,
         province_id INT,
         user_id BIGINT,
         created_by VARCHAR(255),
         updated_by VARCHAR(255),
         created_at DATE,
         updated_at DATE,
         CONSTRAINT fk_address_ward FOREIGN KEY (ward_code) REFERENCES wards(code),
         CONSTRAINT fk_address_district FOREIGN KEY (district_id) REFERENCES districts(id),
         CONSTRAINT fk_address_province FOREIGN KEY (province_id) REFERENCES provinces(id)
);

CREATE INDEX idx_address_ward_code ON addresses(ward_code);
CREATE INDEX idx_address_district_id ON addresses(district_id);
CREATE INDEX idx_address_province_id ON addresses(province_id);
CREATE INDEX idx_address_user_id ON addresses(user_id);