BULK INSERT bronze.store
FROM 'C:\Users\nour\Downloads\archive\Superstore.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
