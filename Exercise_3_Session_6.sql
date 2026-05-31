-- Tạo bảng Customer
CREATE TABLE Customer
(
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(100),
    email  VARCHAR(100),
    phone  VARCHAR(20),
    points INT
);

-- Thêm 7 khách hàng dữ liệu mẫu (Khách hàng thứ 5 không có email - NULL)
INSERT INTO Customer (name, email, phone, points)
VALUES ('Nguyễn Văn A', 'vana@gmail.com', '0901234567', 120),
       ('Trần Thị B', 'thib@gmail.com', '0912345678', 85),
       ('Lê Hoàng C', 'hoangc@gmail.com', '0923456789', 200),
       ('Phạm Minh D', 'minhd@gmail.com', '0934567890', 50),
       ('Nguyễn Tuyết E', NULL, '0945678901', 10), -- Người không có email
       ('Vũ Văn F', 'vanf@gmail.com', '0956789012', 315),
       ('Đặng Thị G', 'thig@gmail.com', '0967890123', 150);

SELECT DISTINCT name
FROM Customer;

SELECT name
FROM Customer
WHERE email IS NULL;

SELECT name, points
FROM Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

SELECT id, name, email, phone, points
FROM Customer
ORDER BY name DESC;










