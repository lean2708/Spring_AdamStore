--
-- Flyway Migration V25
-- Insert data for table: branches
-- Generated from adam_store_data.sql
-- Database: adam-store_2025-08-19_162511
--

INSERT INTO public.branches (id, name, location, phone, status, created_by, updated_by, created_at, updated_at)
VALUES
    (1, 'Chi nhánh 1', '159 Đường Hoàng Hoa Thám, Quận Ba Đình, Hà Nội', '0933123123', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (2, 'Chi nhánh 2', '25 Nguyễn Văn Cừ, Quận Long Biên, Hà Nội', '0912345678', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01'),
    (3, 'Chi nhánh 3', '72 Lê Văn Sỹ, Quận Phú Nhuận, TP. Hồ Chí Minh', '0987654321', 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-01', '2025-08-01');

-- Total records inserted: 3
