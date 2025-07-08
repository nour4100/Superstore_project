--Sales Performance: What are the overall sales trends, and how have they evolved over time? Are there any significant fluctuations that need to be addressed?
WITH CTE_SALES AS (
SELECT
order_year,
order_month,
total_sales,
LAG(total_sales) OVER (ORDER BY order_year,order_month) AS prv_month,
ROUND((total_sales - LAG(total_sales) OVER (ORDER BY order_year,order_month))*100 / NULLIF(LAG(total_sales) OVER (ORDER BY order_year,order_month),0),2) AS MOM,
SUM(total_sales) OVER (ORDER BY order_year,order_month) AS running_total_sales,
AVG(total_sales) OVER (ORDER BY order_year,order_month) AS mov_avg,
SUM(total_sales) OVER () AS overall_sales
FROM(
SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales) AS total_sales
FROM gold.store
GROUP BY YEAR(order_date),MONTH(order_date)
)T
)
SELECT
order_year,
order_month,
total_sales,
prv_month,
MOM,
CASE WHEN MOM > 0 THEN 'Increase'
	 WHEN MOM < 0 THEN 'Decrease'
	 ELSE 'NO CHANGE'
END AS trend,
mov_avg,
running_total_sales,
overall_sales
FROM CTE_SALES
ORDER BY order_year,order_month
