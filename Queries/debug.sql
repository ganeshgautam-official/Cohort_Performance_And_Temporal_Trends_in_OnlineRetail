-- Raw table
SELECT
    *
FROM
    sales_data_raw
LIMIT 10;

-- cleaned table
SELECT
    *
FROM
    sales_data
LIMIT 10;

-- Row count
SELECT
    COUNT(*)
FROM
    sales_data;

-- Distinct customer count
SELECT
    DISTINCT CustomerId 
FROM
    sales_data;
