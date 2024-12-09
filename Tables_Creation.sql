CREATE DATABASE item_sphere ;

USE item_sphere;

-- PRODUCT Table --

DROP TABLE IF EXISTS product;

CREATE TABLE product (
	product_id varchar(10) NOT NULL PRIMARY KEY,
	product_name varchar(100),
	product_price numeric(20,2),
	vendor_id varchar(10),
	category_id varchar(10),
	CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id),
	CONSTRAINT fk_vendor FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
) ;

SELECT *
FROM product

-- REGION Table --

DROP TABLE IF EXISTS region;

CREATE TABLE region(
	region_id varchar(10) NOT NULL PRIMARY KEY,
	region_name varchar(50)
) ;

SELECT *
FROM region

-- CATEGORY Table --

DROP TABLE IF EXISTS category;

CREATE TABLE category(
	category_id varchar(10) NOT NULL PRIMARY KEY,
	category_name varchar(50)
) ;

SELECT *
FROM category

-- CUSTOMER Table --

DROP TABLE IF EXISTS customer;

CREATE TABLE customer(
	customer_id varchar(10) NOT NULL PRIMARY KEY,
	customer_name varchar(50),
	customer_zip int
) ;

SELECT *
FROM customer

-- VENDOR Table --

DROP TABLE IF EXISTS vendor;

CREATE TABLE vendor(
	vendor_id varchar(10) NOT NULL PRIMARY KEY,
	vendor_name varchar(50)
);

SELECT *
FROM vendor

-- STORE Table --

DROP TABLE IF EXISTS store;

CREATE TABLE store(
	store_id varchar(10) NOT NULL PRIMARY KEY,
	store_zip int,
	region_id varchar(10),
	CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES region(region_id)
) ;

SELECT *
FROM store

-- SALES_TRANSACTION Table --

DROP TABLE IF EXISTS sales_transaction;

CREATE TABLE sales_transaction(
	transaction_id varchar(10) NOT NULL PRIMARY KEY,
	customer_id varchar(10),
	store_id varchar(10),
	transaction_date date,
	CONSTRAINT fk_store_transaction FOREIGN KEY (store_id) REFERENCES store(store_id),
	CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
) ;

SELECT *
FROM sales_transaction

-- SALES_QUANTITY Table --

DROP TABLE IF EXISTS sales_quantity;

CREATE TABLE sales_quantity(
	product_id varchar(10),
	transaction_id varchar(10),
	quantity int,
	CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES product (product_id),
	CONSTRAINT fk_transaction FOREIGN KEY(transaction_id) REFERENCES sales_transaction (transaction_id)
) ;

SELECT *
FROM sales_quantity