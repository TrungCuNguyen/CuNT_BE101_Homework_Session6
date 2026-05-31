-- Tạo bảng Course
CREATE TABLE Course
(
    id         SERIAL PRIMARY KEY,
    title      VARCHAR(100),
    instructor VARCHAR(50),
    price      NUMERIC(10, 2),
    duration   INT -- số giờ học
);

-- Thêm 10 hàng dữ liệu mẫu
INSERT INTO Course (title, instructor, price, duration)
VALUES ('Lập trình Python cơ bản', 'Nguyễn Văn A', 499000.00, 30),
       ('Chuyên gia Cơ sở dữ liệu PostgreSQL', 'Trần Thị B', 850000.50, 45),
       ('Phát triển Web với React và Node.js', 'Lê Hoàng C', 1200000.00, 60),
       ('Nhập môn Trí tuệ nhân tạo (AI)', 'Phạm Minh D', 1500000.00, 50),
       ('Thiết kế giao diện UI/UX căn bản', 'Nguyễn Tuyết E', 350000.00, 24),
       ('Cấu trúc dữ liệu và Giải thuật', 'Vũ Văn F', 600000.75, 40),
       ('Bảo mật thông tin và Hacking đạo đức', 'Đặng Thị G', 2100000.00, 80),
       ('Phân tích dữ liệu với Excel & Power BI', 'Bùi Minh H', 450.00, 35),
       ('Lập trình di động Flutter từ zero', 'Hoàng Văn I', 999000.99, 55),
       ('DevOps Engineeer thực chiến', 'Lý Thị K', 1850000.00, 70);

UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

DELETE
FROM Course
WHERE title LIKE '%Demo%';

SELECT id, title, instructor, price, duration
FROM Course
WHERE title ILIKE '%SQL%';

SELECT id, title, instructor, price, duration
FROM Course
WHERE price BETWEEN 500000 AND 2000000;

