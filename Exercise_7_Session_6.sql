CREATE TABLE Department
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

-- Tạo bảng Employee
CREATE TABLE Employee
(
    id            SERIAL PRIMARY KEY,
    full_name     VARCHAR(100),
    department_id INT,
    salary        NUMERIC(10, 2)
);

-- Thêm dữ liệu mẫu cho Department
INSERT INTO Department (name)
VALUES ('HR'),
       ('Finance'),
       ('IT'),
       ('Security'),
       ('Marketing'),
       ('Sales');

-- Thêm 10 dữ liệu mẫu cho Employee với salary > 2,000,000
INSERT INTO Employee (full_name, department_id, salary)
VALUES ('Nguyen Van A', 1, 2500000.00),
       ('Tran Thi B', 2, 3200000.00),
       ('Le Van C', 3, 2800000.00),
       ('Pham Thi D', 4, 35000000.00),
       ('Hoang Van E', 5, 4000000.00),
       ('Do Thi F', 1, 2700000.00),
       ('Bui Van G', 2, 8100000.00),
       ('Dang Thi H', 3, 2900000.00),
       ('Vu Van I', 4, 13600000.00),
       ('Nguyen Thi J', 5, 4200000.00);

SELECT d.id, d.name
FROM Department d
         INNER JOIN Employee e ON d.id = e.department_id
GROUP BY d.id;

SELECT d.name department_name, AVG(e.salary) avg_salary
FROM Employee e
         JOIN Department d ON d.id = e.department_id
GROUP BY e.department_id, d.id;

SELECT d.name department_name, AVG(e.salary) avg_salary
FROM Employee e
         JOIN Department d ON d.id = e.department_id
GROUP BY e.department_id, d.id
HAVING AVG(e.salary) > 10000000;

SELECT d.name
FROM Department d
         LEFT JOIN Employee e ON d.id = e.department_id
WHERE e.department_id IS NULL


