TRUNCATE TABLE silver.store ;
INSERT INTO silver.store (
    ID,
    [Order ID],
    [Order Date],
    [Ship Date],
    [Ship Mode],
    [Customer ID],
    [Customer Name],
    Segment,
    Country,
    City,
    State,
    [Postal Code],
    Region,
    [Product ID],
    Category,
    [Sub-Category],
    [Product Name],
    Sales,
    Quantity,
    Discount,
    Profit
)
SELECT 
	ID,
	[Order ID],
	ISNULL(
	TRY_CONVERT(DATE,[ORDER DATE],105),
	TRY_CONVERT(DATE,[ORDER DATE],120)
	) AS [ORDER DATE],
	ISNULL(
	TRY_CONVERT(DATE,[Ship Date],105),
	TRY_CONVERT(DATE,[Ship Date],120)
	) AS [Ship Date],
    [Ship Mode],
    [Customer ID],
    [Customer Name],
    Segment,
    Country,
    City,
    State,
    [Postal Code],
    Region,
    [Product ID],
    Category,
    [Sub-Category],
    [Product Name],
    Sales,
    Quantity,
    Discount,
    Profit
FROM bronze.store
