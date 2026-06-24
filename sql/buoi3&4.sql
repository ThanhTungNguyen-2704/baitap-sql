--Bài 1
-- Tạo bảng
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name   VARCHAR(50),
    city        VARCHAR(30)
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_date  DATE,
    amount      INT  -- đơn vị: nghìn đồng
);

-- Insert dữ liệu
INSERT INTO customers VALUES
(1, 'Nguyễn Văn An',   'Hà Nội'),
(2, 'Trần Thị Bình',   'TP.HCM'),
(3, 'Lê Minh Châu',    'Đà Nẵng'),
(4, 'Phạm Thị Dung',   'Hà Nội'),
(5, 'Hoàng Văn Em',    'Cần Thơ');

INSERT INTO orders VALUES
(101, 1, '2026-01-05', 200),
(102, 1, '2026-02-10', 350),
(103, 1, '2026-03-15', 180),
(104, 2, '2026-01-20', 500),
(105, 2, '2026-02-28', 120),
(106, 3, '2026-03-01', 90),
(107, 4, '2026-01-11', 410),
(108, 4, '2026-02-14', 300),
(109, 4, '2026-03-20', 250),
(110, 5, '2026-02-05', 60);

--Số đơn hàng và tổng tiền
SELECT customer_id , COUNT(order_id) AS số_đơn , SUM(amount) AS tổng_tiền
FROM orders
GROUP BY customer_id 
ORDER BY SUM(amount) DESC ;

--giữ lại những khách hàng có tổng chi tiêu > 500
SELECT customer_id , COUNT(order_id) AS số_đơn , SUM(amount) AS tổng_tiền,AVG(amount) AS trung_bình
FROM orders
GROUP BY customer_id  
HAVING SUM(amount) > 500 
ORDER BY SUM(amount) DESC ;
--hiển thị tên khách hàng
SELECT customers.full_name, COUNT(orders.order_id) AS số_đơn ,SUM(orders.amount) AS tổng_tiền, AVG(orders.amount) AS trung_bình
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id 
Where city IN ('Hà Nội', 'TP.HCM')  
GROUP BY customers.full_name
HAVING SUM(orders.amount) > 500 
ORDER BY SUM(orders.amount) DESC ;





--Bài 2
-- Tạo bảng
CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id    INT PRIMARY KEY,
    full_name VARCHAR(50),
    dept_id   INT,
    salary    INT  -- đơn vị: nghìn đồng/tháng
);

-- Insert dữ liệu
INSERT INTO departments VALUES
(1, 'Kỹ thuật'),
(2, 'Kinh doanh'),
(3, 'Data & AI'),
(4, 'Hành chính');

INSERT INTO employees VALUES
(1,  'Nguyễn Văn An',   1, 18000),
(2,  'Trần Thị Bình',   2, 15000),
(3,  'Lê Minh Châu',    3, 22000),
(4,  'Phạm Thị Dung',   1, 20000),
(5,  'Hoàng Văn Em',    2, 13000),
(6,  'Vũ Thị Phương',   3, 25000),
(7,  'Đặng Văn Quân',   1, 17000),
(8,  'Bùi Thị Hoa',     4, 11000),
(9,  'Trịnh Văn Khoa',  3, 23000),
(10, 'Ngô Thị Lan',     2, 16000);

-- Hiển thị danh sách nhân viên kèm tên phòng ban,Sắp xếp theo lương giảm dần.

SELECT * FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id 
ORDER BY e.salary DESC  ;

-- Với mỗi phòng ban, tính số nhân viên, lương trung bình, lương cao nhất, lương thấp nhất. 
-- Sắp xếp lương trung bình giảm dần.

SELECT Count(e.emp_id) AS số_nhân_viên , AVG(e.salary) AS lương_tb , MAX(e.salary) AS lương_max , MIN(e.salary) AS lương_min, d.dept_name AS phòng_ban
FROM employees e 
INNER JOIN departments d ON e.dept_id = d.dept_id 
GROUP BY d.dept_name
ORDER BY AVG(e.salary) DESC ;

--Chỉ giữ lại phòng ban có lương trung bình > 16000 và ít nhất 2 nhân viên.
SELECT Count(e.emp_id) AS số_nhân_viên , AVG(e.salary) AS lương_tb , MAX(e.salary) AS lương_max , MIN(e.salary) AS lương_min, d.dept_name AS phòng_ban
FROM employees e 
INNER JOIN departments d ON e.dept_id = d.dept_id 
GROUP BY d.dept_name
HAVING AVG(e.salary) > 16000 
    AND Count(e.emp_id)  >= 2
ORDER BY AVG(e.salary) DESC ;




--Bài 3
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name   VARCHAR(50),
    city        VARCHAR(30)
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_date  DATE,
    amount      INT
);

INSERT INTO customers VALUES
(1, 'Nguyễn Văn An',  'Hà Nội'),
(2, 'Trần Thị Bình',  'TP.HCM'),
(3, 'Lê Minh Châu',   'Đà Nẵng'),
(4, 'Phạm Thị Dung',  'Hà Nội'),
(5, 'Hoàng Văn Em',   'Cần Thơ'),
(6, 'Vũ Thị Phương',  'TP.HCM');  -- khách chưa có đơn nào

INSERT INTO orders VALUES
(101, 1, '2026-01-05', 200),
(102, 1, '2026-01-20', 350),
(103, 1, '2026-02-10', 180),
(104, 2, '2026-01-15', 500),
(105, 2, '2026-02-28', 420),
(106, 2, '2026-03-05', 310),
(107, 3, '2026-02-01', 90),
(108, 3, '2026-02-14', 150),
(109, 4, '2026-01-11', 410),
(110, 4, '2026-03-20', 250),
(111, 5, '2026-03-08', 60);


-- Hiển thị tất cả khách hàng kèm tổng số đơn và tổng tiền. 
--Sắp xếp tổng tiền giảm dần.
SELECT c.customer_id , c.full_name , c.city ,COUNT(o.order_id) AS tổng_đơn ,SUM(o.amount) AS tổng_tiền 
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id , c.full_name 
ORDER BY SUM(o.amount) DESC ;

-- Với từng khách hàng, tính doanh thu theo từng tháng
-- Sắp xếp theo tên khách rồi tháng tăng dần.
SELECT c.full_name , MONTH(o.order_date) AS tháng, COUNT(o.order_id) AS số_đơn, SUM(o.amount) AS doanh_thu 
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY  c.full_name , MONTH(o.order_date)
ORDER BY c.full_name , MONTH(o.order_date) ;

-- Từ câu 3.2, chỉ giữ lại các tháng mà doanh thu > 400. 
-- Sắp xếp doanh thu giảm dần.
SELECT c.full_name , MONTH(o.order_date) , COUNT(o.order_id) AS số_đơn, SUM(o.amount) AS doanh_thu 
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.full_name , MONTH(o.order_date)
HAVING SUM(o.amount) > 400
ORDER BY SUM(o.amount) DESC ;




--bài 4
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    category     VARCHAR(30),
    price        INT
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_date  DATE
);

CREATE TABLE order_details (
    detail_id   INT PRIMARY KEY,
    order_id    INT,
    product_id  INT,
    quantity    INT
);

INSERT INTO products VALUES
(1, 'Sim 4G Viettel',     'Sim',      50),
(2, 'Gói Cước V120',      'Gói cước', 120),
(3, 'Gói Cước V90',       'Gói cước', 90),
(4, 'Điện Thoại Vsmart', 'Thiết bị', 2000),
(5, 'Sim Doanh Nghiệp',  'Sim',      150),
(6, 'Gói Cước V200',      'Gói cước', 200);

INSERT INTO orders VALUES
(101, 1, '2026-01-05'),
(102, 2, '2026-01-10'),
(103, 3, '2026-02-01'),
(104, 1, '2026-02-15'),
(105, 4, '2026-03-01'),
(106, 2, '2026-03-10'),
(107, 5, '2026-03-20');

INSERT INTO order_details VALUES
(1,  101, 1, 3),
(2,  101, 2, 2),
(3,  102, 2, 1),
(4,  102, 3, 4),
(5,  103, 1, 2),
(6,  103, 5, 1),
(7,  104, 3, 3),
(8,  104, 6, 2),
(9,  105, 2, 2),
(10, 105, 4, 1),
(11, 106, 1, 1),
(12, 106, 3, 2),
(13, 107, 5, 3),
(14, 107, 6, 1);

-- Hiển thị tên sản phẩm, tổng số lượng bán, tổng số đơn chứa sản phẩm đó
-- Sắp xếp tổng số lượng giảm dần.

SELECT p.product_name AS tên_sp , SUM(od.quantity) AS tổng_sl_bán, COUNT(od.order_id) AS tổng_số_đơn
FROM order_details od
INNER JOIN orders o   ON od.order_id   = o.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id , p.product_name
ORDER BY  SUM(od.quantity) DESC ;

-- Chỉ giữ sản phẩm xuất hiện trong ít nhất 3 đơn hàng. 
-- Hiển thị thêm cột category.
SELECT p.product_name AS tên_sp , SUM(od.quantity) AS tổng_sl_bán, COUNT(od.order_id) AS tổng_số_đơn,p.category AS danh_mục
FROM order_details od
INNER JOIN orders o   ON od.order_id   = o.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id , p.product_name
HAVING COUNT(od.order_id) >= 3
ORDER BY  SUM(od.quantity) DESC ;

-- Nhóm theo danh mục (category). 
-- Tính tổng số lượng bán, tổng doanh thu, số loại sản phẩm trong danh mục. 
-- Chỉ giữ danh mục có tổng doanh thu > 500.

SELECT  SUM(od.quantity) AS tổng_sl_bán,SUM(od.quantity * p.price) AS tổng_doanh_thu ,COUNT(p.product_id) AS tổng_số_sp,p.category AS danh_mục
FROM order_details od
INNER JOIN orders o   ON od.order_id   = o.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY p.category
HAVING SUM(od.quantity * p.price) > 500




