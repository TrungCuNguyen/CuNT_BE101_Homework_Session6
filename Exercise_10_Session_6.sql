-- 1. Tạo bảng OldCustomers
CREATE TABLE OldCustomers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- 2. Tạo bảng NewCustomers
CREATE TABLE NewCustomers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- --- THÊM DỮ LIỆU MẪU (TỔNG CỘNG 10 HÀNG) ---

-- Thêm 5 hàng vào bảng OldCustomers
INSERT INTO OldCustomers (name, city)
VALUES ('Nguyễn Văn A', 'Hà Nội'),
       ('Trần Thị B', 'Đà Nẵng'),
       ('Lê Hoàng C', 'Hồ Chí Minh'),
       ('Phạm Minh D', 'Hải Phòng'),
       ('Vũ Thị E', 'Cần Thơ'),
       ('Đỗ Anh L', 'Quảng Ninh'),
       ('Ngô Quốc M', 'Vũng Tàu'),
       ('Trịnh Thu N', 'Hà Nội'),
       ('Dương Công O', 'Đà Nẵng'),
       ('Lâm Hoài P', 'Bình Dương');

-- Thêm 5 hàng vào bảng NewCustomers
INSERT INTO NewCustomers (name, city)
VALUES ('Nguyễn Tiến F', 'Hà Nội'),
       ('Đặng Mỹ G', 'Nha Trang'),
       ('Bùi Hoàng H', 'Hồ Chí Minh'),
       ('Hoàng Văn I', 'Huế'),
       ('Đỗ Anh L', 'Quảng Ninh'),
       ('Phan Thanh Q', 'Hồ Chí Minh'),
       ('Ngô Quốc M', 'Vũng Tàu'),
       ('Hà Kim S', 'Cần Thơ'),
       ('Đoàn Minh T', 'Hà Nội'),
       ('Tô Vĩnh U', 'Đồng Nai');

SELECT name, city
FROM OldCustomers
UNION
SELECT name, city
FROM NewCustomers;

SELECT name, city
FROM OldCustomers
INTERSECT
SELECT name, city
FROM NewCustomers;

SELECT sub.city, COUNT(city) count_of_city
FROM (SELECT name, city
      FROM OldCustomers
      UNION
      SELECT name, city
      FROM NewCustomers) AS sub
GROUP BY city;

SELECT sub.city, COUNT(city) count_of_city -- Tìm TP match với số lượng max
FROM (SELECT name, city
      FROM OldCustomers
      UNION
      SELECT name, city
      FROM NewCustomers) AS sub
GROUP BY city
HAVING COUNT(city) = (SELECT MAX(sub_max.count_of_city) -- Tìm TP có nhiều KH nhất
                      FROM (SELECT COUNT(city) count_of_city
                            FROM (SELECT name, city
                                  FROM OldCustomers
                                  UNION
                                  SELECT name, city
                                  FROM NewCustomers) AS sub
                            GROUP BY city) AS sub_max)

