--
-- Flyway Migration V22
-- Insert data for table: users
-- Generated from adam_store_data.sql
-- Database: adam-store_2025-08-19_162511
--

INSERT INTO public.users (id, name, email, password, avatar_url, dob, gender, status, created_by, updated_by, created_at, updated_at)
VALUES
    (1, 'Admin', 'admin@gmail.com', '$2a$10$eNOwf23dENieI.yWexC9muaXYLDLkjxJmnZuYxRswatnu53VD5Og2', 'https://yourdomain.com/default-avatar.png', '2025-08-01', 'MALE', 'ACTIVE', NULL, NULL, '2025-08-01', '2025-08-01'),
    (7, 'Thành Mạnh', 'thanhmanh123@gmail.com', '$2a$10$21wRLphT4Vigg5rsBV3SU.2bW5JgMa/nrVZT9MOJ64OT4RN7CN3DG', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754203092/adam-store/images/n9hdk5zrw5j76uhiun0o.webp', NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'thanhmanh123@gmail.com', '2025-08-03', '2025-08-03'),
    (8, 'Trung Min', 'trungmin123@gmail.com', '$2a$10$XwLpGuioEqWcayNhjtzAY.Z62JqeSPB3xfLPFssEG9NMnjWdBA0Ja', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754203492/adam-store/images/kbn4ic54ggiuy60j2jjd.jpg', NULL, NULL, 'ACTIVE', 'thanhmanh123@gmail.com', 'trungmin123@gmail.com', '2025-08-03', '2025-08-03'),
    (2, 'Lê Văn An', 'lean270804@gmail.com', '$2a$10$eY8zsAJJveKhqnoyWdmSxOC5OUg1VFqEP9pLk4MGVr60QN07Wmkwe', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754203977/adam-store/images/av8h24zgdgib8orkxgsk.jpg', NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'lean270804@gmail.com', '2025-08-01', '2025-08-03'),
    (4, 'Nguyễn Thùy Dung', 'thuydung210305@gmail.com', '$2a$10$sTyTJq77/jC7UYAp3IDlZOc75xRSgVrZziyjsQ8/vzVFELBLcpzFu', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754204232/adam-store/images/lfsakp7qbslujs6qszbt.jpg', NULL, NULL, 'ACTIVE', 'lean270804@gmail.com', 'thuydung210305@gmail.com', '2025-08-01', '2025-08-03'),
    (5, 'Thùy Dung', 'thuydung2103@gmail.com', '$2a$10$a60khj99OfJnA7p9Ip9KieCGCnWBN6YW1DobqxoTYGOD70tV1YYcK', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754204289/adam-store/images/ix9slnnr3zjteg2a6db4.jpg', NULL, NULL, 'ACTIVE', 'lean270804@gmail.com', 'thuydung2103@gmail.com', '2025-08-01', '2025-08-03'),
    (6, 'Lê Đình Phùng', 'dinhphung123@gmail.com', '$2a$10$HvhKr83adOy8q1l8cFOHLe/yZkIfvKtCOKWgQK0O0iD4EOD/4d1LK', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754204335/adam-store/images/foehtj5kap7wa3vvq9mf.jpg', NULL, NULL, 'ACTIVE', 'thuydung2103@gmail.com', 'dinhphung123@gmail.com', '2025-08-01', '2025-08-03'),
    (9, 'Đình Văn', 'van123@gmail.com', '$2a$10$gOQuPxwqjUqP9hh60iVpLOApnrHHbQHZGriuN8NgW/hJN3LFPSIt2', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754204442/adam-store/images/blxskxqejqciaqcprgxn.jpg', NULL, NULL, 'ACTIVE', 'dinhphung123@gmail.com', 'van123@gmail.com', '2025-08-03', '2025-08-03'),
    (3, 'Mai Minh Tú', 'maiminhtu130803@gmail.com', '$2a$10$UevFeye5rmxrHhdCL9fQ3us1U7KhNgVMeufj.7amTXG83URO45.fG', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754294894/adam-store/images/glsoav6mdh662arvlkgr.webp', NULL, NULL, 'ACTIVE', 'lean270804@gmail.com', 'maiminhtu130803@gmail.com', '2025-08-01', '2025-08-04'),
    (10, 'Thị Mai', 'mai123@gmail.com', '$2a$10$F7kSIqfAAbvXajDqHm2BXOgGVm0dEf.sPQy5pXky1hvkkXsSg/PQS', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643232/adam-store/images/ax13v0ooslvvb28to6ys.jpg', NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'mai123@gmail.com', '2025-08-08', '2025-08-08'),
    (11, 'Tiến Mạnh', 'manh123@gmail.com', '$2a$10$G2eyoY1qfUCtMgaabKb5wO0asWmd3R/HQ69E9MNznCzWSZWOeUaLG', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643704/adam-store/images/k7yzyf6zhh3qgebbkeaw.jpg', NULL, NULL, 'ACTIVE', 'mai123@gmail.com', 'manh123@gmail.com', '2025-08-08', '2025-08-08'),
    (12, 'Duy Tiến', 'tien123@gmail.com', '$2a$10$3BhfV9AqDZgjKuOsagH7Ce8zBmBokrWuXcJHmmsyAl5T6jeu9qYPO', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754753036/adam-store/images/hsxqub3gmvnhoovxilg3.jpg', NULL, NULL, 'ACTIVE', 'manh123@gmail.com', 'tien123@gmail.com', '2025-08-09', '2025-08-09'),
    (13, 'Điêu Hiếu', 'hieu123@gmail.com', '$2a$10$HbXPDjq0HE3j1fTI/MF8PeUto0iDdEUxZjWSETcvcUbQ6PVqZZ4eq', 'http://res.cloudinary.com/dz5wejuuf/image/upload/v1754753410/adam-store/images/mpbhmj0cfalthl9multy.jpg', NULL, NULL, 'ACTIVE', 'tien123@gmail.com', 'hieu123@gmail.com', '2025-08-09', '2025-08-09'),
    (14, 'Giáp Kim', 'kimgiap123@gmail.com', '$2a$10$EsZ/47URypqh2vTOWWTIGOcOx65hW8v4gGseiAwpIOlnvd3L7vK1e', NULL, NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-14', '2025-08-14'),
    (15, 'Nguyên Minh', 'minh123@gmail.com', '$2a$10$fIMilNVKYfu62OESe8y3t.02uKOqZMuDCIMHfc/IYDZholxgHwiki', NULL, NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-14', '2025-08-14'),
    (16, 'Ngọc Duy', 'duy123@gmail.com', '$2a$10$wdCpBokII48tW2OIBBElAen4R0b9UvLV97g3/mEuUB9wkmWsmfSvi', NULL, NULL, NULL, 'ACTIVE', 'admin@gmail.com', 'admin@gmail.com', '2025-08-14', '2025-08-14'),
    (17, 'Tuấn Nguyễn', 'tuan123@gmail.com', '$2a$10$..mzW/G71A.s0WAr5xrfXeZxZqgCzjMmfO7lIIxHh08psnu/7h882', NULL, NULL, NULL, 'ACTIVE', 'lean270804@gmail.com', 'lean270804@gmail.com', '2025-08-19', '2025-08-19');

-- Total records inserted: 17
