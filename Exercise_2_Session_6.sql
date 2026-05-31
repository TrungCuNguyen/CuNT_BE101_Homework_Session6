-- Tạo bảng lt2 - SS6
CREATE TABLE Employee
(
    id         SERIAL PRIMARY KEY,
    full_name  VARCHAR(100),
    department VARCHAR(50),
    salary     NUMERIC(10, 2),
    hire_date  DATE
);

-- Thêm dữ liệu mẫu (6 hàng)
INSERT INTO Employee (full_name, department, salary, hire_date)
VALUES ('Nguyen Van An', 'IT', 12000000.00, '2023-01-15'),
       ('Tran Thi B', 'HR', 8500000.00, '2022-08-10'),
       ('Le Van C', 'Finance', 15000000.00, '2021-05-20'),
       ('Pham Thi D', 'IT', 9800000.00, '2024-03-01'),
       ('Hoang Van E', 'Marketing', 11000000.00, '2020-11-12'),
       ('Do Thi F', 'IT', 13500000.00, '2023-07-25');


UPDATE Employee
SET salary = 1.1 * salary
WHERE department = 'IT';

DELETE
FROM Employee
WHERE salary < 6000000;

SELECT *
FROM Employee
WHERE full_name ILIKE '%An%';

SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';