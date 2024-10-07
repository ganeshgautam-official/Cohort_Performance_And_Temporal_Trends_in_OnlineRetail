DROP TABLE If EXISTS sales_data_raw;
DROP TABLE If EXISTS sales_data;


CREATE TABLE sales_data_raw (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC(10, 2),
    CustomerID INTEGER,
    Country VARCHAR(50)
);

CREATE TABLE sales_data (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC(10, 2),
    CustomerID INTEGER,
    Country VARCHAR(50)
);



COPY sales_data_raw(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
FROM 'D:\Online Retail Cohort Analysis\data\Online Retail.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';


INSERT INTO sales_data (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
SELECT InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
FROM sales_data_raw;
