-- CALENDAR View --

CREATE VIEW calendar_view AS

	SELECT DISTINCT transaction_date AS full_date,
		DATENAME(WEEKDAY, transaction_date) AS day_of_week,
		DATEPART(DAY, transaction_date) AS day_of_month,
		DATENAME(MONTH, transaction_date) AS month,
		DATEPART(QUARTER, transaction_date) AS quarter,
		DATEPART(YEAR, transaction_date) AS year
	FROM sales_transaction

SELECT *
FROM calendar_view