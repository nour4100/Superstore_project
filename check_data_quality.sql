--Check for nulls or duplicates in primary kay
SELECT ID,COUNT(*)
FROM bronze.store
GROUP BY ID
HAVING COUNT(*) > 1 OR ID IS NULL



--Check for unwanted spaces
SELECT [Customer Name]
FROM bronze.store
WHERE [Customer Name] != TRIM([Customer Name])


--Values must not be null, zero, or negative
SELECT
Sales,
Quantity
FROM bronze.store
WHERE Sales IS NULL OR Quantity IS NULL
OR Sales <= 0 OR Quantity <= 0
