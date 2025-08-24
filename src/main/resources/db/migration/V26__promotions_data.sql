--
-- Flyway Migration V26
-- Insert data for table: promotions
-- Generated from adam_store_data.sql
-- Database: adam-store_2025-08-19_162511
--

INSERT INTO public.promotions (id, code, description, discount_percent, start_date, end_date, status, created_by, updated_by, created_at, updated_at)
VALUES
    (1, 'WELCOME10', 'Giảm 10% cho khách hàng mới', 10, '2025-01-01', '2025-12-31', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (2, 'SALE15', 'Giảm 15% toàn bộ đơn hàng', 15, '2025-06-01', '2025-08-31', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (3, 'SUMMER25', 'Ưu đãi mùa hè: Giảm 25%', 25, '2025-06-01', '2025-09-30', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (4, 'FLASH10', 'Flash Sale - Giảm 10% trong thời gian ngắn', 10, '2025-08-01', '2025-08-07', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (5, 'HOTDEAL10', 'Giảm 10% cho tất cả đơn hàng trong mùa hè', 10, '2025-07-01', '2025-08-31', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (6, 'JULY15', 'Ưu đãi tháng 7 - Giảm 15%', 15, '2025-07-15', '2025-08-15', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (7, 'SHOPNOW20', 'Mua ngay giảm 20% toàn đơn', 20, '2025-07-25', '2025-08-05', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01');

-- Total records inserted: 7
