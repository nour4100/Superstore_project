--Geographic Insights: How does sales performance vary across the regions? Are there promising geographical regions or areas requiring improved marketing?
--region monthly sales trand or each year
SELECT
YEAR(Order_date) AS order_year,
MONTH(Order_date) AS order_month,
region,
SUM(sales) AS total_sales
FROM gold.store
GROUP BY YEAR(Order_date),MONTH(Order_date),Region
ORDER BY order_year,total_sales DESC;

--total sales per product sub-category by region
SELECT
region,
sub_category,
SUM(sales) total_sales
FROM gold.store
GROUP BY region,sub_category
ORDER BY total_sales DESC;


--year sales per region
SELECT
YEAR(ORDER_DATE) AS order_year,
region,
SUM(sales) total_sales
FROM gold.store
GROUP BY YEAR(ORDER_DATE),region
ORDER BY YEAR(ORDER_DATE),total_sales DESC;
