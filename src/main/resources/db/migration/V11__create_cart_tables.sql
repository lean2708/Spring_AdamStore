-- Cart
CREATE TABLE carts (
          id BIGSERIAL PRIMARY KEY,
          created_at DATE,
          updated_at DATE,

          user_id BIGINT NOT NULL,
          CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES users(id)
);

-- cart_item
CREATE TABLE cart_items (
           id BIGSERIAL PRIMARY KEY,
           price DOUBLE PRECISION,
           quantity INT,
           created_at TIMESTAMP,

           cart_id BIGINT,
           product_variant_id BIGINT NOT NULL,
           CONSTRAINT fk_cart_item_product_variant FOREIGN KEY (product_variant_id) REFERENCES product_variants(id),
           CONSTRAINT fk_cart_item_cart FOREIGN KEY (cart_id) REFERENCES carts(id)
);

-- Index
CREATE INDEX idx_cart_item_cart_id ON cart_items (cart_id);
CREATE INDEX idx_cart_item_variant_id ON cart_items (product_variant_id);
CREATE INDEX idx_cart_item_created_at ON cart_items (created_at);
