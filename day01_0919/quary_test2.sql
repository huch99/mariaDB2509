SHOW DATABASES;

USE employees;

SHOW TABLE STATUS;

DESCRIBE employees;

SELECT first_name, gender FROM employees;

SELECT first_name 이름, gender 성별, hire_date '회사 입사일'
FROM employees;