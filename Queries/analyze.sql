-- Monthly Cohort Assignment
CREATE VIEW CustomerCohorts AS
SELECT
    CustomerId,
    TO_CHAR(MIN(InvoiceDate), 'YYYY-MM') AS Cohort_Month
FROM
    sales_data
GROUP BY
    CustomerId;


-- Total Revenue Per Cohort
CREATE VIEW RevenueCohort AS
    SELECT
        c.Cohort_Month,
        TO_CHAR(s.InvoiceDate, 'YYYY-MM') AS Order_Month,
        SUM(s.Quantity * s.UnitPrice) AS TotalRevenue
    FROM
        CustomerCohorts c 
    INNER JOIN
        sales_data s ON c.CustomerId = s.customerid
    GROUP BY
        c.Cohort_Month, Order_Month;


--Results
SELECT
    *
FROM
    RevenueCohort;


-- Average Revenue per each customer
SELECT
    r.Cohort_Month,
    ROUND(SUM(s.Quantity * s.UnitPrice)/COUNT(DISTINCT s.CustomerId), 2) AS Revenue_Per_cust
FROM
    RevenueCohort r 
INNER JOIN
    sales_data s ON r.Cohort_Month = TO_CHAR(s.InvoiceDate, 'YYYY-MM')
GROUP BY
    r.Cohort_Month;


-- Customer Retention Per Cohort
CREATE VIEW Customer_Retention AS
    SELECT
        c.Cohort_Month,
        TO_CHAR(s.InvoiceDate, 'YYYY-MM') AS Order_Month,
        COUNT(DISTINCT s.CustomerId) AS Active_Customer
    FROM
        CustomerCohorts c 
    INNER JOIN
        sales_data s ON c.CustomerId = s.customerid
    GROUP BY
        c.cohort_month, Order_Month;


--Results
SELECT
    *
FROM
    Customer_Retention;


-- Retention Rate
SELECT
    r.Cohort_Month,
    r.Order_Month,
    ROUND((r.Active_Customer::NUMERIC/cohort_customer.Initial_Customer)*100, 2) AS retention_rate
FROM
    customer_retention r 
INNER JOIN
    (SELECT
        c.Cohort_Month,
        COUNT(DISTINCT s.CustomerId)AS Initial_Customer
    FROM
        CustomerCohorts c 
    INNER JOIN
        sales_data s ON c.CustomerId = s.customerid
    GROUP BY
        c.cohort_month) AS cohort_customer ON r.Cohort_Month = cohort_customer.Cohort_Month;


--Churn Rate
SELECT
    r.Cohort_Month,
    r.Order_Month,
    ROUND((1 - (r.Active_Customer::NUMERIC/cohort_customer.Initial_Customer))*100, 2) AS churn_rate
FROM
    customer_retention r 
INNER JOIN
    (SELECT
        c.Cohort_Month,
        COUNT(DISTINCT s.CustomerId)AS Initial_Customer
    FROM
        CustomerCohorts c 
    INNER JOIN
        sales_data s ON c.CustomerId = s.customerid
    GROUP BY
        c.cohort_month) AS cohort_customer ON r.Cohort_Month = cohort_customer.Cohort_Month;
