-- 
SHOW DATABASES;
USE testdb;
SHOW TABLES;

-- 테이블 조회
SELECT * FROM customers;
SELECT COUNT(*) FROM customers;

SELECT customerID, Address FROM customers;

SELECT * FROM customers WHERE country='Mexico';

-- order by
SELECT * FROM customers ORDER BY country;
SELECT * FROM customers ORDER BY country DESC;

-- limit
SELECT *FROM customers LIMIT 4;
SELECT * FROM customers WHERE country='Germany' LIMIT 5;

-- like
SELECT * FROM customers WHERE CustomerName LIKE 'a%';
SELECT * FROM customers WHERE customerName LIKE '%or%';

-- join
SELECT orders.OrderID, customers.CustomerName, orders.OrderDate FROM orders 
INNER JOIN customers ON orders.customerId=customers.CustomerID;

-- union
SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;