-- CUSTOMER View --

CREATE VIEW customer_view AS
	SELECT customer_id, customer_name, customer_zip
	FROM customer

SELECT *
FROM customer_view