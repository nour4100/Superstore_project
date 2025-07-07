CREATE VIEW gold.store AS
SELECT
    ID,
    [Order ID] AS Order_id,
    [Order Date] AS Order_date,
    [Ship Date] AS Ship_date,
    [Ship Mode] AS Ship_mode,
    [Customer ID] AS Customer_id,
    [Customer Name] AS Customer_name,
    Segment,
    Country,
    City,
    State AS States,
    [Postal Code] AS Postal_code,
    Region,
    [Product ID] AS Product_id,
    Category,
    [Sub-Category] AS Sub_category,
    [Product Name] AS Product_name,
    Sales,
    Quantity,
    Discount,
    Profit
FROM silver.store
