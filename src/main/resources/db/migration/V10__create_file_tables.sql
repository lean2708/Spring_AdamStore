-- File
CREATE TABLE files (
         id BIGSERIAL PRIMARY KEY,
         public_id VARCHAR(255),
         file_name VARCHAR(255),
         image_url VARCHAR(1000),

         created_by VARCHAR(255),
         created_at DATE,

         product_id BIGINT,
         CONSTRAINT fk_file_product FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Index
CREATE INDEX idx_file_product_id ON files (product_id);
CREATE INDEX idx_file_image_url ON files (image_url);