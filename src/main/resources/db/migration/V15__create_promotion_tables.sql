-- Promotion
CREATE TABLE promotions (
           id BIGSERIAL PRIMARY KEY,

           code VARCHAR(255) NOT NULL,
           description TEXT,
           discount_percent INTEGER,

           start_date DATE NOT NULL,
           end_date DATE NOT NULL,

           status VARCHAR(50) NOT NULL,

           created_by VARCHAR(255),
           updated_by VARCHAR(255),
           created_at DATE,
           updated_at DATE
);


-- Promotion Usages
CREATE TABLE promotion_usages (
             id BIGSERIAL PRIMARY KEY,
             discount_amount DOUBLE PRECISION,
             used_at TIMESTAMP,

             user_id BIGINT NOT NULL,
             promotion_id BIGINT NOT NULL,
             order_id BIGINT NOT NULL,

             CONSTRAINT fk_promotion_usage_user FOREIGN KEY (user_id) REFERENCES users(id),
             CONSTRAINT fk_promotion_usage_promotion FOREIGN KEY (promotion_id) REFERENCES promotions(id),
             CONSTRAINT fk_promotion_usage_order FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Index
CREATE INDEX idx_promotion_usages_user_id ON promotion_usages(user_id);
CREATE INDEX idx_promotion_usages_promotion_id ON promotion_usages(promotion_id);
CREATE INDEX idx_promotion_usages_order_id ON promotion_usages(order_id);
