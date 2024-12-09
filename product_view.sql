-- PRODUCT View --

CREATE VIEW product_view AS
	SELECT p.product_id, p.product_name, p.product_price, c.category_name,
		v.vendor_name
	FROM product p

	INNER JOIN category c
	ON c.category_id = p.category_id

	INNER JOIN vendor v
	ON v.vendor_id = p.vendor_id

SELECT *
FROM product_view