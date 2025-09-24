
SELECT * FROM orderdetails;

SELECT * FROM orders;

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM employees;

SELECT * FROM suppliers;

SELECT * FROM shippers;

SELECT * FROM category;

SELECT customers.CustomerName, products.ProductName, orderdetails.Quantity
FROM customers
JOIN orders ON customers.CustomerID = Orders.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID 
JOIN products ON products.ProductID = orderdetails.ProductID;

SELECT c.customerName, p.productName, SUM(od.quantity) AS 총수량, SUM(od.quantity * p.price) 총금액
FROM customers c
JOIN orders o ON c.customerID = o.customerID
JOIN ORDERdetails od ON od.orderID = o.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY c.customerName, p.productname;