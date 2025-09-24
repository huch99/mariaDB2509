 -- 데이터베이스 및 테이블 생성
CREATE DATABASE exDB_0924;

USE exdb_0924;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 -- 데이터 입력 (insert)
INSERT INTO users(NAME, email) VALUES
('홍길동', 'hong@example.com'),
('김영희', 'kim@example.com');

 -- 데이터 조회 (select)
SELECT * FROM users;
SELECT NAME, email FROM users WHERE NAME LIKE '김%';

 -- 데이터 수정 (update)
UPDATE users SET email = 'kimnew@example.com' WHERE NAME = '김영희';

 -- 데이터 삭제 (delete)
DELETE FROM users WHERE NAME = '홍길동';

 -- 조인 (join)
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	product VARCHAR(100),
	quantity INT,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (user_id, product, quantity) VALUES (2,'노트북',1);

SELECT u.name, o.product, o.quantity FROM users u JOIN orders o ON u.id = o.user_id;

	 -- inner join
	SELECT u.name, o.product FROM users u INNER JOIN orders o ON u.id = o.user_id;
	
	 -- left join
	SELECT u.name, o.product FROM users u LEFT JOIN orders o ON u.id = o.user_id;
	
	 -- right join
	SELECT u.name, o.product FROM users u RIGHT JOIN orders o ON u.id = o.user_id;
	
	 -- self join
	CREATE TABLE employees(
		emp_id INT PRIMARY KEY,
		NAME VARCHAR(50),
		manager_id int
	);
	
	INSERT INTO employees values
	(1,'홍길동',NULL),
	(2,'김철수',1),
	(3,'이영희',1);
	
	SELECT e.name AS 직원, m.name AS 상사
	FROM employees e
	LEFT JOIN employees m ON e.manager_id = m.emp_id;
	
 -- union (중복 미포함)
SELECT NAME FROM users
UNION
SELECT product FROM orders;

 -- union all (중복 포함)
SELECT NAME FROM users
UNION ALL
SELECT product FROM orders;

 -- group by
CREATE TABLE sales(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product VARCHAR(50),
	category VARCHAR(50),
	quantity INT,
	price DECIMAL(10,2),
	sale_date DATE
);

INSERT INTO sales(product, category, quantity, price, sale_date) VALUES
('노트북','전자제품',5,1000000,'2024-06-01'),
('스마트폰','전자제품',10,800000,'2024-06-02'),
('책상','가구',3,200000,'2024-06-01'),
('의자','가구',7,100000,'2024-06-02'),
('책상','가구',2,200000,'2024-06-03');

SELECT category, 
	SUM(quantity) AS total_quantity,
	SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category;

 -- having
SELECT category,
	SUM(quantity) AS total_quantity,
	SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category
HAVING total_sales > 1000000;

 -- exists
SELECT NAME
FROM users u
WHERE EXISTS (
	SELECT 1 FROM orders o WHERE o.user_id = u.id
);

 -- any
SELECT product, price
FROM sales
WHERE price > ANY (
	SELECT price FROM sales WHERE category = '전자제품'
	);
	
 -- all
SELECT product, price
FROM sales
WHERE price > ALL (
	SELECT price FROM sales WHERE category = '가구');
	
 -- case
SELECT product,
	case
		when quantity < 5 then '소량'
		when quantity BETWEEN 5 AND 10 then '중량'
		ELSE '대량'
	END AS quantity_level
FROM sales;

 -- ifnull()
ALTER TABLE users
ADD COLUMN phone CHAR(13);
 
SELECT NAME, IFNULL(phone,'전화번호 없음') AS phonusersuserse_number
FROM users;

 -- coalesce()
SELECT NAME,
	COALESCE(phone, email, '연락처 없음') AS contact_info
FROM users;