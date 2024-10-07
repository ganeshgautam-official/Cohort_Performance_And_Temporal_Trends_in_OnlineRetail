SELECT
    *
FROM
    sales_data_raw
LIMIT 10;


SELECT
    *
FROM
    sales_data
LIMIT 10;

SELECT
    COUNT(*)
FROM
    sales_data;

SELECT
    DISTINCT CustomerId 
FROM
    sales_data;