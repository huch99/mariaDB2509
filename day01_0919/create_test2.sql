USE sqldb;
SELECT * FROM usertbl;
SELECT * FROM usertbl WHERE NAME = '김경호';
SELECT userID, NAME FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, NAME FROM usertbl WHERE birthYear >= 1970 OR height >= 182;
SELECT NAME, height FROM usertbl WHERE height >= 180 AND height <= 183;
SELECT NAME , addr FROM usertbl WHERE addr='경남' OR addr='전남' OR addr='경북';
SELECT NAME, addr FROM usertbl WHERE addr IN ('경남','전남','경북');
SELECT NAME, height FROM usertbl WHERE NAME LIKE '김%';
SELECT NAME, height FROM usertbl WHERE NAME LIKE '_종신';
SELECT NAME, height FROM usertbl WHERE height > 177;
SELECT NAME, height FROM usertbl 
	WHERE height > (SELECT height FROM usertbl WHERE NAME='김경호');
SELECT NAME, height FROM usertbl
	WHERE height >= ANY (SELECT height FROM usertbl WHERE addr='경남');
SELECT NAME, height FROM usertbl
	WHERE height = ANY (SELECT height FROM usertbl WHERE addr='경남');
SELECT NAME, height FROM usertbl
	WHERE height IN (SELECT height FROM usertbl WHERE addr='경남');
SELECT NAME, mDate FROM usertbl ORDER BY mDate;
SELECT NAME, mDate FROM usertbl ORDER BY mDate DESC;
SELECT NAME, height FROM usertbl ORDER BY height DESC, NAME ASC;
SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;
SELECT DISTINCT addr FROM usertbl;

USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 0,5;

USE sqldb;
CREATE TABLE buytb2 (SELECT *FROM buytbl);
SELECT * FROM buytb2;
CREATE TABLE buytb3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytb3;

SELECT userID, amount FROM buytbl ORDER BY userID;
SELECT userID, SUM(amount) FROM buytbl group BY userId;
SELECT userId AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
	FROM buytbl GROUP BY userId;
SELECT userId AS '사용자 아이디', SUM(amount*price) AS '총 구매액'
	FROM buytbl GROUP BY userId;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;
SELECT userId, AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userID;
SELECT NAME, MAX(height), MIN(height) FROM usertbl;
SELECT NAME, MAX(height), MIN(height) FROM usertbl GROUP BY userID;
SELECT NAME, height FROM usertbl WHERE height = (SELECT MAX(height) FROM usertbl) OR height = (SELECT MIN(height) FROM usertbl);

SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

SELECT userID AS '사용자' , SUM(price*amount) AS '총 구매액' FROM buytbl GROUP BY userID HAVING SUM(price*amount) > 1000;
SELECT userID AS '사용자' , SUM(price*amount) AS '총 구매액' FROM buytbl WHERE SUM(price*amount) > 1000 GROUP BY userID;
SELECT userID AS '사용자' , SUM(price*amount) AS '총 구매액' FROM buytbl GROUP BY userID HAVING SUM(price*amount) > 1000 ORDER BY SUM(price*amount);
SELECT num, groupName, SUM(price * amount) AS '비용' FROM buytbl GROUP BY groupName, num WITH ROLLUP;
SELECT groupName, SUM(price * amount) AS '비용' FROM buytbl GROUP BY groupName WITH ROLLUP;

CREATE TABLE testtbl1 (id INT, userName CHAR(3), age INT);
INSERT INTO testtbl1 VALUES (1, '홍길동', 25);
INSERT INTO testtbl1(id, userName) VALUES (2, '설현');
INSERT INTO testtbl1(userName, age, id) VALUES ('초아', 26, 3);

CREATE TABLE testtbl2(id INT AUTO_INCREMENT PRIMARY KEY, userName CHAR(3), age INT);
INSERT INTO testtbl2 VALUES(NULL, '지민',25);
INSERT INTO testtbl2 VALUES(NULL, '유나',22);
INSERT INTO testtbl2 VALUES(NULL, '유경',21);
SELECT * FROM testtbl2;

ALTER TABLE testtbl2 AUTO_INCREMENT=100;
INSERT INTO testtbl2 VALUES(NULL, '찬미',23);
SELECT * FROM testtbl2;

CREATE TABLE testtbl3(id INT AUTO_INCREMENT PRIMARY KEY, userName CHAR(3), age INT);
ALTER TABLE testtbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;
INSERT INTO testtbl3 VALUES(NULL,'나연',20);
INSERT INTO testtbl3 VALUES(NULL,'정연',18);
INSERT INTO testtbl3 VALUES(NULL,'모모',19);
SELECT * FROM testtbl3;

CREATE TABLE testtbl4(id INT, fName VARCHAR(50), lName VARCHAR(50));
INSERT INTO testtbl4 SELECT emp_no, first_name, last_name FROM employees.employees;

CREATE TABLE testtbl5(SELECT emp_no, first_name, last_name FROM employees.employees);

UPDATE testtbl4 SET lName = '없음' WHERE fName = 'Koyoicho';

UPDATE buytb2 SET price = price * 1.5;

DELETE FROM testtbl4 WHERE fName = 'Aamer';
DELETE FROM testtbl4 WHERE fName = 'Mary' LIMIT 5;