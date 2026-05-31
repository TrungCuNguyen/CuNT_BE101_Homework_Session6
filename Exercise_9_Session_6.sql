-- Tạo bảng Product
CREATE TABLE Product
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100),
    category VARCHAR(50),
    price    NUMERIC(10, 2)
);

-- Tạo bảng OrderDetail
CREATE TABLE OrderDetail
(
    id         SERIAL PRIMARY KEY,
    order_id   INT,
    product_id INT,
    quantity   INT
);

-- Thêm dữ liệu mẫu cho Product
INSERT INTO Product (name, category, price)
VALUES ('Laptop Dell XPS', 'Electronics', 32000000.00),
       ('iPhone 15 Pro', 'Electronics', 35000000.00),
       ('Samsung Galaxy S24', 'Electronics', 28000000.00),
       ('Sony WH-1000XM5', 'Audio', 9000000.00),
       ('MacBook Air M2', 'Electronics', 27000000.00),
       ('Nike Air Max', 'Fashion', 3500000.00),
       ('Adidas Ultraboost', 'Fashion', 4000000.00),
       ('Canon EOS R10', 'Camera', 22000000.00),
       ('Logitech MX Master 3S', 'Accessories', 2500000.00),
       ('Kindle Paperwhite', 'Books', 3500000.00);

-- Thêm dữ liệu mẫu cho OrderDetail
INSERT INTO OrderDetail (order_id, product_id, quantity)
VALUES (1, 1, 2),  -- 2 Laptop Dell XPS
       (1, 4, 1),  -- 1 Sony WH-1000XM5
       (2, 2, 1),  -- 1 iPhone 15 Pro
       (2, 6, 3),  -- 3 Nike Air Max
       (3, 3, 2),  -- 2 Samsung Galaxy S24
       (3, 7, 1),  -- 1 Adidas Ultraboost
       (4, 5, 1),  -- 1 MacBook Air M2
       (4, 9, 2),  -- 2 Logitech MX Master 3S
       (5, 8, 1),  -- 1 Canon EOS R10
       (5, 10, 4), -- 4 Kindle Paperwhite
       (6, 8, 1),  -- 1 Canon EOS R10
       (6, 10, 4);
-- 4 Kindle Paperwhite

-- Tính tổng doanh thu từng sản phẩm, hiển thị product_name, total_sales (SUM(price * quantity))
SELECT name product_name, SUM(p.price * o.quantity) total_sales
FROM Product p
         LEFT JOIN OrderDetail o ON p.id = o.product_id
GROUP BY p.id;

--Tính doanh thu trung bình theo từng loại sản phẩm (GROUP BY category)
SELECT p.category,
       AVG(p.price * od.quantity) avg_revenue
FROM Product p
         JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.category;

--Chỉ hiển thị các loại sản phẩm có doanh thu trung bình > 20 triệu (HAVING)
SELECT p.category,
       AVG(p.price * od.quantity) avg_revenue
FROM Product p
         JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.category
HAVING AVG(p.price * od.quantity) > 20000000;

-- Hiển thị tên sản phẩm có doanh thu cao hơn doanh thu trung bình toàn bộ sản phẩm (dùng Subquery)
SELECT p.name                     product_name,
       SUM(od.quantity * p.price) total_revenue
FROM Product p
         JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.id, p.name
HAVING SUM(od.quantity * p.price) > (
    -- Subquery: Tính doanh thu trung bình của toàn bộ các sản phẩm đã bán
    SELECT AVG(sub.product_revenue)
    FROM (SELECT SUM(od_sub.quantity * p_sub.price) product_revenue
          FROM Product p_sub
                   JOIN OrderDetail od_sub ON p_sub.id = od_sub.product_id
          GROUP BY p_sub.id) sub);
--Liệt kê toàn bộ sản phẩm và số lượng bán được (nếu có) – kể cả sản phẩm chưa có đơn hàng (LEFT JOIN)
SELECT p.name product_name, SUM(od.quantity)
FROM Product p
         LEFT JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.id;