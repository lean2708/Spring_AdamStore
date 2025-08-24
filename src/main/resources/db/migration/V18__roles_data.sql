--
-- Flyway Migration V18
-- Insert roles data
-- Generated for adam-store database
--

INSERT INTO public.roles (name, description) VALUES
('ADMIN', 'ROLE_ADMIN'),
('USER', 'ROLE_USER');

-- Total records inserted: 2