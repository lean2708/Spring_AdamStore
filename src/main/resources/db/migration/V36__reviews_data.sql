--
-- Flyway Migration V36
-- Insert data for table: reviews
-- Generated from adam_store_data.sql
-- Database: adam-store_2025-08-19_162511
--

INSERT INTO public.reviews (id, rating, comment, image_urls, created_at, updated_at, user_id, product_id, order_item_id)
VALUES
    (5, 3.5, 'Sản phẩm ổn trong tầm giá, giao hơi chậm một chút.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328761/adam-store/images/r3qaeazpl1qcjqmurqga.webp"]', '2025-08-04', '2025-08-04', 2, 3, 25),
    (2, 3.9, 'Sản phẩm như mô tả, tuy nhiên chất vải chưa thực sự ưng ý.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754294228/adam-store/images/average1.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754294229/adam-store/images/average2.webp"]', '2025-08-04', '2025-08-04', 2, 6, 2),
    (22, 4, 'Sản phẩm giống mô tả, chất lượng ổn định với mức giá này.', '[]', '2025-08-04', '2025-08-04', 8, 7, 18),
    (24, 2.5, 'Hàng khác ảnh quảng cáo, form hơi lỏng, đường may chưa đẹp.', '[]', '2025-08-04', '2025-08-04', 9, 6, 20),
    (1, 4.7, 'Sản phẩm rất tốt, giao hàng nhanh!', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328648/adam-store/images/zr4saxryyvom26sur28c.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328650/adam-store/images/vi0tnkyupjrzqmabjbph.webp"]', '2025-08-04', '2025-08-04', 2, 1, 1),
    (3, 4.5, 'Sản phẩm vượt mong đợi, đóng gói cẩn thận và chất lượng tuyệt vời!', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328652/adam-store/images/md0vv0m5xmeyhsbpeltr.webp"]', '2025-08-04', '2025-08-04', 2, 7, 3),
    (4, 3.7, 'Chất lượng sản phẩm rất tốt, đúng như mô tả. Sẽ ủng hộ lần sau!', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328760/adam-store/images/uctjo7f5x9v8jrqfp27p.webp"]', '2025-08-04', '2025-08-04', 2, 7, 22),
    (6, 2.8, 'Sản phẩm không giống mô tả, cần cải thiện khâu kiểm tra hàng.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328762/adam-store/images/wzgb2uw2wsiqbpvfga32.webp"]', '2025-08-04', '2025-08-04', 3, 1, 4),
    (7, 2.9, 'Giao sai màu, chất lượng chưa như mong đợi.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328763/adam-store/images/sqesoue5gah9e4qpu2tv.webp"]', '2025-08-04', '2025-08-04', 3, 6, 5),
    (8, 3.5, 'Tạm ổn, cần cải thiện chất lượng đóng gói.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328762/adam-store/images/wzgb2uw2wsiqbpvfga32.webp"]', '2025-08-04', '2025-08-04', 3, 12, 26),
    (9, 4.7, 'Hàng giống mô tả, giá hợp lý, chất lượng ổn.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328878/adam-store/images/xveqso2nutmpd0nh1fxm.webp"]', '2025-08-04', '2025-08-04', 3, 3, 27),
    (10, 1, 'Rất thất vọng, hàng bị lỗi, không giống mô tả.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328879/adam-store/images/hevkggrfawsqdqowrvci.webp"]', '2025-08-04', '2025-08-04', 5, 1, 6),
    (11, 4, 'Mọi thứ đều ổn, chỉ tiếc là giao hơi chậm một chút.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328880/adam-store/images/fyd3f2utfj0mbbdxk9dw.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328882/adam-store/images/wqslb8yi3v3u2ihcuzne.webp"]', '2025-08-04', '2025-08-04', 5, 1, 6),
    (12, 3.1, 'Chất lượng trung bình, không quá nổi bật.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328880/adam-store/images/fyd3f2utfj0mbbdxk9dw.webp"]', '2025-08-04', '2025-08-04', 6, 1, 8),
    (13, 4.2, 'Hàng đúng mô tả, phù hợp với nhu cầu của mình.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328966/adam-store/images/akimbri2xreetvqnqlnb.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328967/adam-store/images/ajb2fnplrg3wewzvibn7.webp"]', '2025-08-04', '2025-08-04', 6, 10, 11),
    (14, 2.5, 'Chưa đúng kỳ vọng, vải hơi mỏng và màu không giống ảnh.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328967/adam-store/images/ajb2fnplrg3wewzvibn7.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328969/adam-store/images/uzhfq5kdiam1lhwy6h9o.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754328969/adam-store/images/uzhfq5kdiam1lhwy6h9o.webp"]', '2025-08-04', '2025-08-04', 6, 4, 10),
    (15, 4.9, 'Không có gì để chê, sản phẩm quá tuyệt vời từ chất lượng đến thiết kế.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329044/adam-store/images/hglbgbmjc6xzfnakkfbg.webp"]', '2025-08-04', '2025-08-04', 7, 1, 12),
    (16, 4.3, 'Nhân viên hỗ trợ nhiệt tình, giao hàng đúng hẹn. Sẽ tiếp tục ủng hộ.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329045/adam-store/images/artuqvltwysslawlnun2.webp"]', '2025-08-04', '2025-08-04', 7, 2, 24),
    (17, 4.3, 'Nhân viên hỗ trợ nhiệt tình, giao hàng đúng hẹn. Sẽ tiếp tục ủng hộ.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329047/adam-store/images/oc8utol0qasqdguotzgi.webp"]', '2025-08-04', '2025-08-04', 7, 6, 13),
    (18, 3.8, 'Đóng gói chắc chắn, nhưng màu sản phẩm thực tế hơi khác ảnh một chút.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329048/adam-store/images/o4jxpnhjtykcxocvlnp5.webp"]', '2025-08-04', '2025-08-04', 8, 1, 14),
    (19, 2.1, 'Chất lượng vải không tốt như quảng cáo, form không chuẩn.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329113/adam-store/images/qeodzffelk9o9zsz6qtf.webp"]', '2025-08-04', '2025-08-04', 8, 3, 15),
    (20, 4.9, 'Mặc lên cực kỳ đẹp, size chuẩn, giá hợp lý. Mình rất hài lòng.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329114/adam-store/images/qowxumdv9nr8k3czdimw.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329116/adam-store/images/dqjl9lwsdrsm9uhsnrmd.webp"]', '2025-08-04', '2025-08-04', 8, 2, 16),
    (21, 4.7, 'Tôi đã mua nhiều lần và lần nào cũng hài lòng tuyệt đối!', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329118/adam-store/images/r30aolfbrkuzmzisblcm.webp"]', '2025-08-04', '2025-08-04', 8, 4, 17),
    (23, 3.5, 'Giao hàng trễ 1 ngày, nhưng sản phẩm thì không có vấn đề gì.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329184/adam-store/images/kl1t6grojxe02nof3ls5.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329185/adam-store/images/gchiljgl6lazehg506wd.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754329187/adam-store/images/lprdae4bfdyclfxi1urv.webp"]', '2025-08-04', '2025-08-04', 9, 1, 19),
    (25, 3.5, 'Vải ổn, mặc lên vừa nhưng đóng gói chưa kỹ.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643353/adam-store/images/jhofxt8jbrucujkiweci.webp", "http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643354/adam-store/images/tjzwjvqhfwmzz3akn54v.webp"]', '2025-08-08', '2025-08-08', 10, 1, 49),
    (26, 4.2, 'Mặc vừa vặn, màu đẹp, giao hàng nhanh.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643357/adam-store/images/fm7yrrh8samlwi6x92j1.webp"]', '2025-08-08', '2025-08-08', 10, 7, 50),
    (27, 4.5, 'Mặc thoải mái, chất vải mịn, màu chuẩn.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643845/adam-store/images/zpcsf3dj1lzgsaxiynfr.webp"]', '2025-08-08', '2025-08-08', 11, 25, 51),
    (28, 2, 'Chất vải không như mong đợi, giao hàng chậm.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754643843/adam-store/images/qrrt9e0tklxlzwcvuhko.webp"]', '2025-08-08', '2025-08-08', 11, 1, 52),
    (29, 3.5, 'Hàng khác ảnh quảng cáo, form hơi lỏng, đường may chưa đẹp.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751507/adam-store/images/uwwlkoxayxnuy3teqxfe.jpg"]', '2025-08-09', '2025-08-09', 11, 14, 57),
    (30, 3.9, 'Hàng khác ảnh quảng cáo, form hơi lỏng, đường may chưa đẹp.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751507/adam-store/images/uwwlkoxayxnuy3teqxfe.jpg"]', '2025-08-09', '2025-08-09', 12, 31, 59),
    (31, 4.5, 'Chất lượng vượt mong đợi, đường may tỉ mỉ, form chuẩn như hình. Đóng gói cẩn thận.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751509/adam-store/images/rjjcw9woepctdmmvnm0c.jpg"]', '2025-08-09', '2025-08-09', 12, 14, 61),
    (32, 3.5, 'Vải hơi mỏng so với mong đợi, nhưng màu sắc khá đẹp.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751506/adam-store/images/ganptitjyu7rrxngcidn.jpg"]', '2025-08-09', '2025-08-09', 12, 8, 62),
    (33, 4.8, 'Hàng đẹp, chất vải mịn, mặc rất thoải mái. Sẽ ủng hộ lần sau.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751504/adam-store/images/cggqkr8zuvbwar0hrnyj.jpg"]', '2025-08-09', '2025-08-09', 13, 1, 65),
    (34, 2.5, 'Đường may ẩu, giao hàng chậm hơn dự kiến.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1754751506/adam-store/images/ganptitjyu7rrxngcidn.jpg"]', '2025-08-09', '2025-08-09', 13, 25, 66),
    (35, 3.5, 'Hàng khác ảnh quảng cáo, form hơi lỏng, đường may chưa đẹp.', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1755104516/adam-store/images/ogg522q7ewihm6qt5fyf.jpg"]', '2025-08-14', '2025-08-14', 16, 39, 89),
    (36, 2.5, 'Hàng quá xấu', '["http://res.cloudinary.com/dz5wejuuf/image/upload/v1755104516/adam-store/images/ogg522q7ewihm6qt5fyf.jpg"]', '2025-08-14', '2025-08-14', 14, 32, 97);

-- Total records inserted: 36
