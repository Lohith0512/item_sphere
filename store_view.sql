-- STORE View -- 

CREATE VIEW store_view AS
	SELECT r.region_name, s.store_id, s.store_zip
	FROM store s

	INNER JOIN region r
	ON r.region_id = s.region_id

SELECT *
FROM store_view