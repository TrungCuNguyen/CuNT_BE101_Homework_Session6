CREATE TABLE Customer
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Tạo bảng Orders
CREATE TABLE Orders
(
    id           SERIAL PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    total_amount NUMERIC(10, 2)
);

-- Thêm dữ liệu mẫu cho Customer
INSERT INTO Customer (name)
VALUES ('Nguyen Van A'),
       ('Tran Thi B'),
       ('Le Van C'),
       ('Pham Thi D'),
       ('Hoang Van E'),
       ('Do Thi F'),
       ('Vu Van I'),
       ('Bui Van G'),
       ('Vu Van I'),
       ('Dang Thi H'),
       ('Nguyen Thi J');

-- Thêm dữ liệu mẫu cho Orders
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2024-01-15', 2500000.00),
       (2, '2024-02-20', 3200000.00),
       (3, '2024-03-05', 2800000.00),
       (4, '2024-03-18', 3500000.00),
       (5, '2024-04-10', 4000000.00),
       (6, '2024-04-25', 2700000.00),
       (7, '2024-05-12', 3100000.00),
       (6, '2024-05-30', 2900000.00),
       (9, '2024-06-08', 3600000.00),
       (5, '2024-06-20', 4200000.00);


SELECT c.name "Tên khách hàng", SUM(o.total_amount) "Tổng tiền đã mua"
FROM Customer c
         JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY SUM(o.total_amount) DESC;


SELECT c.name "Tên khách hàng", SUM(o.total_amount) "Tổng tiền đã mua"
FROM Customer c
         JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING SUM(o.total_amount) = (SELECT MAX(s_total)
                              FROM (SELECT c.name nname, SUM(o.total_amount) s_total
                                    FROM Customer c
                                             JOIN Orders o ON c.id = o.customer_id
                                    GROUP BY c.id));

SELECT c.name
FROM Customer c
         LEFT JOIN Orders o ON c.id = o.customer_id
WHERE o.total_amount IS NULL;

SELECT c.name "Tên khách hàng", SUM(o.total_amount) "Tổng tiền đã mua"
FROM Customer c
         JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING SUM(o.total_amount) > (SELECT AVG(s_total)
                              FROM (SELECT c.name nname, SUM(o.total_amount) s_total
                                    FROM Customer c
                                             JOIN Orders o ON c.id = o.customer_id
                                    GROUP BY c.id));
