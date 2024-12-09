-- SALES Fact View --

DROP VIEW IF EXISTS sales_fact ;

CREATE VIEW sales_fact AS 
	SELECT dcad.calendar_key, dsd.store_key, dcd.customer_key, dpd.product_key,
		sq.quantity as quantity_sold, p.product_price * sq.quantity as rupees_sold
	FROM sales_quantity sq

	INNER JOIN product p
	ON sq.product_id = p.product_id

	INNER JOIN item_sphere_DW.dbo.product_dimension dpd
	ON sq.product_id = dpd.product_id

	INNER JOIN sales_transaction st
	ON sq.transaction_id = st.transaction_id

	INNER JOIN item_sphere_DW.dbo.customer_dimension dcd
	ON st.customer_id = dcd.customer_id

	INNER JOIN item_sphere_DW.dbo.store_dimension dsd
	ON st.store_id = dsd.store_id

	INNER JOIN item_sphere_DW.dbo.calendar_dimension dcad
	ON st.transaction_date = dcad.full_date