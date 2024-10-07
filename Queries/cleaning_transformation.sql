-- Data Cleaning
-- Identify cancelled transactions 
SELECT
    *
FROM
    sales_data
WHERE
    InvoiceNo  LIKE 'C%';


-- Remove cancelled transactions
DELETE FROM sales_data
WHERE InvoiceNo  LIKE 'C%';




-- check for duplication
SELECT
    *
FROM
    (SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY InvoiceNo, StockCode ORDER BY InvoiceDate) AS dup_flag
    FROM
        sales_data) AS duplicates
WHERE
    dup_flag > 1;


-- Remove duplicates
DELETE FROM sales_data
WHERE 
    InvoiceNo IN(SELECT  
                    InvoiceNo
                FROM
                    (SELECT
                        *,
                        ROW_NUMBER() OVER(PARTITION BY InvoiceNo, StockCode,Customerid ORDER BY InvoiceDate) AS dup_flag
                    FROM
                        sales_data) AS duplicates
                WHERE
                    dup_flag > 1)
    AND 
    stockCode IN(SELECT  
                    stockCode
                FROM
                    (SELECT
                        *,
                        ROW_NUMBER() OVER(PARTITION BY InvoiceNo, StockCode,Customerid ORDER BY InvoiceDate) AS dup_flag
                    FROM
                        sales_data) AS duplicates
                WHERE
                    dup_flag > 1);

-- Check for NULL in CustomerId
SELECT
    *
FROM
    sales_data
WHERE
    CustomerId is NULL;

-- Filter out all rows with NULL customerId
DELETE FROM sales_data
WHERE  CustomerId is NULL;

 -- Check for records with 0 unitprice
SELECT
    *
FROM
    sales_data
WHERE
    UnitPrice = 0;

-- Filter out all rows with 0 UnitPrice
DELETE FROM sales_data
WHERE    UnitPrice = 0; 



