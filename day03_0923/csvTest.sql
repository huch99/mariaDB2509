CREATE DATABASE testDB;

USE testDB;

CREATE TABLE categories(
	CategoryID INT,
	CategoryName VARCHAR(50),
	Descriptions VARCHAR(255)
);

CREATE TABLE customers(
	CustomerID INT,
	CustomerName VARCHAR(50),
	ContactName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	PostalCode VARCHAR(50),
	Country VARCHAR(50)
);

CREATE TABLE employees(
	EmployeeID INT,
	LastName VARCHAR(50),
	FirstName VARCHAR(50),
	BirthDate DATE,
	Photo VARCHAR(50),
	Notes text
);

DROP TABLE employees;

CREATE TABLE orderdetails(
	OrderDetailID	INT,
	OrderID	INT,
	ProductID	INT,
	Quantity int
);

CREATE TABLE orders(
	OrderID	INT,
	CustomerID	INT,
	EmployeeID	INT,
	OrderDate	DATE,
	ShipperID INT
);

CREATE table products(
	ProductID INT,	
	ProductName	VARCHAR(50),
	SupplierID	INT,
	CategoryID	INT,
	Unit	VARCHAR(50),
	Price DECIMAL(10,2)
);

CREATE TABLE shippers(	
	ShipperID	INT,
	ShipperName	VARCHAR(50),
	Phone VARCHAR(50)
);

CREATE TABLE suppliers(
	SupplierID	INT,
	SupplierName	VARCHAR(50),
	ContactName	VARCHAR(50),
	Address	VARCHAR(50),
	City	VARCHAR(50),
	PostalCode	VARCHAR(50),
	Country	VARCHAR(50),
	Phone VARCHAR(50)
);