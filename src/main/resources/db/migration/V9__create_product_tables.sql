-- Product
CREATE TABLE products (
         id BIGSERIAL PRIMARY KEY,

         name VARCHAR(255) NOT NULL UNIQUE,
         description TEXT,
         is_available BOOLEAN,
         sold_quantity INTEGER,
         average_rating DOUBLE PRECISION,
         total_reviews INTEGER,

         min_price DOUBLE PRECISION,
         max_price DOUBLE PRECISION,

         status VARCHAR(50) NOT NULL,

         created_by VARCHAR(255),
         updated_by VARCHAR(255),
         created_at DATE,
         updated_at DATE,

         category_id BIGINT NOT NULL,
         CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Index
CREATE INDEX idx_product_category_id ON products (category_id);
CREATE INDEX idx_product_name ON products (name);
CREATE INDEX idx_product_min_price ON products (min_price);


-- Product Variant
CREATE TABLE product_variants (
         id BIGSERIAL PRIMARY KEY,
         is_available BOOLEAN,
         price DOUBLE PRECISION,
         quantity INTEGER,

         status VARCHAR(50) NOT NULL,

         product_id BIGINT,
         color_id BIGINT,
         size_id BIGINT,

         CONSTRAINT fk_product_variant_product FOREIGN KEY (product_id) REFERENCES products(id),
         CONSTRAINT fk_product_variant_color FOREIGN KEY (color_id) REFERENCES colors(id),
         CONSTRAINT fk_product_variant_size FOREIGN KEY (size_id) REFERENCES sizes(id)
);

-- Index
CREATE INDEX idx_variant_product_id ON product_variants (product_id);
CREATE INDEX idx_variant_color_id ON product_variants (color_id);
CREATE INDEX idx_variant_size_id ON product_variants (size_id);