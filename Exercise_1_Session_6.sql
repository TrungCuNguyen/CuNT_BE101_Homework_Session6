CREATE TABLE Product
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100),
    category VARCHAR(50),
    price    NUMERIC(10, 2),
    stock    INT
);

-- Thêm dữ liệu mẫu
INSERT INTO Product (name, category, price, stock)
VALUES ('Laptop Dell Inspiron', 'Electronics', 1500.00, 20),
       ('iPhone 14 Pro', 'Electronics', 1200.00, 15),
       ('Bàn gỗ tự nhiên', 'Furniture', 350.00, 10),
       ('Áo thun cotton', 'Clothing', 25.00, 50),
       ('Sách SQL cơ bản', 'Books', 18.50, 100);

SELECT name, category, price, stock
FROM Product;

SELECT name, price
FROM Product p
ORDER BY price DESC
LIMIT 3;

SELECT name, category, price
FROM Product p
WHERE category = 'Electronics'
  AND price < 10000000;

SELECT name, stock
FROM Product p
ORDER BY stock;