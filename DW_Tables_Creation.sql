CREATE DATABASE item_sphere_DW ;

USE item_sphere_DW ;

-- PRODUCT Dimension Table --

DROP TABLE IF EXISTS product_dimension;

CREATE TABLE product_dimension(
	product_key int identity PRIMARY KEY,
	product_id varchar(10),
	product_name varchar(100),
	product_price numeric(20,2),
	product_category_name varchar(50),
	product_vendor_name varchar(50)
);

SELECT *
FROM product_dimension

-- CALENDAR Dimension Table --

DROP TABLE IF EXISTS calendar_dimension;

CREATE TABLE calendar_dimension(
	calendar_key int identity PRIMARY KEY,
	full_date date,
	day_of_week varchar(10),
	day_of_month int,
	month varchar(10),
	quarter int,
	year int
) ;

SELECT *
FROM calendar_dimension

-- CUSTOMER Dimension Table --

DROP TABLE IF EXISTS customer_dimension;

CREATE TABLE customer_dimension(
	customer_key int identity PRIMARY KEY,
	customer_id varchar(10),
	customer_name varchar(50),
	customer_zip int
) ;

SELECT *
FROM customer_dimension

-- STORE Dimension Table --

DROP TABLE IF EXISTS store_dimension;

CREATE TABLE store_dimension(
	store_key int identity PRIMARY KEY,
	store_id varchar(10),
	store_zip int,
	store_region_name varchar(50)
) ;

SELECT *
FROM store_dimension

-- SALES Fact Table --

DROP TABLE IF EXISTS sales_fact_table ;

CREATE TABLE sales_fact_table(
	customer_key int,
	product_key int,
	calendar_key int,
	store_key int,
	rupees_sold numeric(20,2),
	quantity_sold int,
	PRIMARY KEY (customer_key, product_key, calendar_key, store_key),
	CONSTRAINT fk_customer FOREIGN KEY (customer_key) REFERENCES customer_dimension(customer_key),
	CONSTRAINT fk_product FOREIGN KEY (product_key) REFERENCES product_dimension(product_key),
	CONSTRAINT fk_calendar FOREIGN KEY (calendar_key) REFERENCES calendar_dimension(calendar_key),
	CONSTRAINT fk_store FOREIGN KEY (store_key) REFERENCES store_dimension(store_key)
) ;

SELECT *
FROM sales_fact_table