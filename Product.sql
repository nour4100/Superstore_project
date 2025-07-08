--Product Categories: Which product categories contributed the most to the company's sales?
SELECT
category,
SUM(sales) total_sales
FROM gold.store
GROUP BY category
ORDER BY total_sales DESC;


--Yearly sales per sub_category
SELECT
YEAR(order_date) order_year,
Sub_category,
SUM(sales) total_sales
FROM gold.store
GROUP BY YEAR(order_date),Sub_category
ORDER BY total_sales DESC
