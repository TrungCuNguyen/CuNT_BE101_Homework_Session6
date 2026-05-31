-- Tạo bảng Orders
CREATE TABLE Orders
(
    id           SERIAL PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    total_amount NUMERIC(10, 2)
);

-- Thêm 10 hàng dữ liệu mẫu (Một số đơn có total_amount > 50000000)
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2026-01-10', 1500000.00),
       (2, '2025-01-15', 55000000.00), -- Trên 50 triệu
       (3, '2024-02-01', 35000.00),
       (1, '2026-02-12', 72300000.50), -- Trên 50 triệu
       (4, '2024-03-05', 12500000.00),
       (2, '2026-03-20', 4800000.00),
       (5, '2025-04-02', 95000000.00), -- Trên 50 triệu
       (3, '2026-04-15', 1850000.00),
       (6, '2025-05-01', 50500000.00), -- Trên 50 triệu
       (4, '2026-05-25', 990000.00);

SELECT SUM(total_amount) total_revenue, COUNT(id) total_orders, AVG(total_amount) average_order_value
FROM Orders;

SELECT EXTRACT(YEAR FROM order_date) AS year, SUM(total_amount)
FROM Orders
GROUP BY EXTRACT(YEAR FROM order_date);

SELECT EXTRACT(YEAR FROM order_date) AS year, SUM(total_amount)
FROM Orders
GROUP BY EXTRACT(YEAR FROM order_date)
HAVING SUM(total_amount) > 50000000;

SELECT id, customer_id, order_date, total_amount
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;








