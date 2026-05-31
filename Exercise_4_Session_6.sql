-- Tạo bảng OrderInfo
CREATE TABLE OrderInfo
(
    id          SERIAL PRIMARY KEY,
    customer_id INT,
    order_date  DATE,
    total       NUMERIC(10, 2),
    status      VARCHAR(20)
);

-- Thêm 5 đơn hàng mẫu với tổng tiền (total) khác nhau
INSERT INTO OrderInfo (customer_id, order_date, total, status)
VALUES (1, '2026-05-10', 150111.50, 'Completed'),
       (2, '2024-05-15', 2400000.00, 'Processing'),
       (1, '2024-10-20', 897.99, 'Completed'),
       (3, '2026-05-25', 1000450.00, 'Pending'),
       (6, '2026-05-29', 51250.75, 'Shipped');

SELECT id, customer_id, order_date, total, status
FROM OrderInfo
WHERE total > 500000;

SELECT id, customer_id, order_date, total, status
FROM OrderInfo
WHERE order_date BETWEEN '2024-10-1' AND '2024-10-31';

SELECT id, customer_id, order_date, total, status
FROM OrderInfo
WHERE status <> 'Completed';

SELECT id, customer_id, order_date, total, status
FROM OrderInfo
ORDER BY order_date DESC
LIMIT 2;