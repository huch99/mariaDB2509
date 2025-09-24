create database exDB_0924_master;

USE exdb_0924_master;

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50),
	phone VARCHAR(20),
	email VARCHAR(50)
);

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50),
	category VARCHAR(50),
	price DECIMAL(10,2)	
);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	product_id INT,
	quantity INT,
	order_date DATE,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO users (NAME , phone, email) VALUES
('홍길동', '010-1111-2222', 'hong@example.com'),
('김철수', NULL, 'kim@example.com'),
('이영희', '010-3333-4444', NULL);

INSERT INTO products (NAME, category, price) VALUES
('노트북', '전자제품', 1500000),
('스마트폰', '전자제품', 800000),
('책상', '가구', 300000),
('의자', '가구', 150000);

INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2024-06-01'),
(1, 2, 2, '2024-06-02'),
(2, 3, 1, '2024-06-03'),
(3, 4, 4, '2024-06-04'),
(3, 2, 1, '2024-06-05');

SELECT u.name AS 고객명,
	SUM(p.price * o.quantity) AS 총매출액
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN products p ON o.product_id = p.id
GROUP BY u.id
ORDER BY 총매출액 DESC;

SELECT u.name AS 고객명,
   SUM(p.price * o.quantity) AS 총매출액
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN products p ON o.product_id = p.id
GROUP BY u.id
HAVING 총매출액 > 2000000;

SELECT NAME
FROM users u
WHERE EXISTS (
	SELECT 1 FROM orders o WHERE o.user_id = u.id
);

SELECT u.name AS 고객명,
	SUM(p.price * o.quantity) AS 총매출액,
	case
	when SUM(p.price * o.quantity) >= 2500000 then 'VIP'
	when SUM(p.price * o.quantity) >= 1000000 then '일반'
	ELSE '신규'
	END AS 매출_등급
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
LEFT JOIN products p ON o.product_id = p.id
GROUP BY u.id;

SELECT NAME,
	IFNULL(phone, '전화번호 없음') AS phone_number,
	COALESCE(phone, email, '연락처 없음') AS contact_info
FROM users;

ALTER TABLE users ADD COLUMN referrer_id INT;

UPDATE users SET referrer_id = 1 WHERE id = 2;
UPDATE users SET referrer_id = 2 WHERE id = 3;

SELECT u.name AS 고객명, r.name AS 추천인명
FROM users u
LEFT JOIN users r ON u.referrer_id = r.id;

SELECT phone AS contact FROM users WHERE phone IS NOT NULL
UNION
SELECT email AS contact FROM users WHERE email IS NOT NULL;

SELECT phone AS contact FROM users WHERE phone IS NOT NULL
UNION all
SELECT email AS contact FROM users WHERE email IS NOT NULL;