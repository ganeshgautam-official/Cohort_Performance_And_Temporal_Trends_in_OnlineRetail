# Cohort_Performance_And_Temporal_Trends_in_OnlineRetail
### Project Overview   
This project analyzes **cohort performance** and **temporal trends** in online retail to evaluate customer retention, churn rates, and revenue generation. Using transactional data from a UK-based online retailer, the analysis provides insights into customer behavior over time through the following:

- **Cohort Performance**: A detailed comparison of cohort-wise **retention rates**, **total revenue**, and **active customers**. This analysis identifies patterns in customer retention across different cohorts and evaluates how various customer groups contribute to overall revenue and active customer counts.

- **Temporal Trends**: Examination of key metrics such as **Total Revenue**, **Active Customers**, and **New Customer Acquisition** over each month. The analysis also tracks percentage changes in these metrics from the starting month, providing a clear picture of growth or decline over time.

The results are presented through an interactive [Tableau dashboard](https://public.tableau.com/app/profile/ganesh.gautam7819/viz/CohortPerformanceTemporalTrendsinOnlineRetail/Cohort_Analysis_Online_Retail) that visualizes these trends, offering a comprehensive view of the retailer’s performance in terms of customer retention, revenue growth, and active customer engagement.






### **1. Business Case**
Customer retention and revenue growth are vital for any online retailer to thrive in a competitive market. This analysis evaluates customer behavior through cohort performance and temporal trends, providing actionable insights into retention, churn, and revenue generation. Using transactional data from a UK-based retailer, the project aims to:

1. **Analyze Customer Retention and Churn**:
- Measure retention rates and identify factors driving customer churn.
- Highlight opportunities to improve customer loyalty.



2. **Evaluate Revenue Contribution by Cohort**:
- Identify high-value customer cohorts and assess spending patterns.
- Inform strategies to optimize resources for key segments.



3. **Track Temporal Performance**:
- Examine monthly trends in total revenue, active customers, and new customer acquisition.
- Monitor percentage changes over time to assess growth or decline.
- Results are presented in an interactive Tableau dashboard, offering stakeholders a clear view of customer engagement and business performance to support data-driven decision-making.


### **2. Data Preparation**
#### **Data Source and Structure**
#### **Data Source**
The dataset is a transactional record from a UK-based non-store online retailer, covering transactions between December 1, 2010, and December 9, 2011. The retailer primarily sells unique all-occasion gifts, and many customers are wholesalers. This dataset is publicly available on the [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/352/online+retail).



#### **Data Structure**

| **Variable Name** | **Type**           | **Description**                                             | **Units** |
|--------------------|--------------------|-------------------------------------------------------------|----------|
| `InvoiceNo`        | Categorical (ID)    | Unique 6-digit identifier for each transaction. Starts with 'C' for cancellations. | -        |
| `StockCode`        | Categorical (ID)    | Unique 5-digit identifier for each product.                | -        |
| `Description`      | Categorical         | Product name.                                              | -        |
| `Quantity`         | Integer             | Number of units purchased per transaction.                 | -        |
| `InvoiceDate`      | Date/Time           | Date and time when the transaction occurred.               | -        |
| `UnitPrice`        | Continuous          | Price per unit in sterling (GBP).                          | GBP      |
| `CustomerID`       | Categorical (ID)    | Unique 5-digit identifier for each customer.               | -        |
| `Country`          | Categorical         | Country where the customer resides.                        | -        |

---

##### **Key Notes**

- **Timeframe**: Covers 1 year of transactions.
- **Special Records**: Cancellations are indicated by `InvoiceNo` starting with "C."
- **No Missing Values**: All fields are fully populated, simplifying the cleaning process.
- **Potential Insights**: The dataset enables cohort analysis, customer segmentation, and revenue trends exploration, ideal for clustering and classification tasks.

This dataset forms the foundation for exploring customer retention, churn rates, and revenue generation trends.

#### **Data Storage**
For this project, the transactional data from the CSV file is stored in a relational database, which provides an efficient way to manage, query, and clean large datasets. The data is loaded into two tables within the database and the SQL code for the database creation and loading  can be found in the file [create_load.sql]()

1. **sales_data_raw**: This table stores the raw data directly from the CSV file without any modifications. It serves as the backup table and ensures the original dataset is preserved for reference or reprocessing.

2. **sales_data**: After the data is loaded into the sales_data_raw table and cleaned through various preprocessing steps (such as removing cancellations, duplicates, and invalid entries like null CustomerID and zero UnitPrice), the cleaned data is transferred to the sales_data table. This table will hold the cleaned and validated dataset, which is now ready for analysis. It has the same structure as the sales_data_raw table but only contains relevant, high-quality data for further processing and insights.







### **3. Data Preprocessing**

#### **Data Cleaning**
- **Remove Canceled Transactions**: Identified and deleted transactions where InvoiceNo starts with 'C'.
- **Remove Duplicates**: Checked for duplicate records based on InvoiceNo, StockCode, and CustomerID, and deleted them.
- **Remove Null Customer IDs**: Filtered out rows where CustomerID was NULL, ensuring only valid customer data remains.
- **Remove Records with Zero UnitPrice**: Deleted records where UnitPrice was 0, indicating invalid or free transactions.
  
The SQL code for the data cleaning process can be found in the file [cleaning_transformation.sql](). This file contains all the necessary SQL queries for removing cancellations, duplicates, and invalid entries to ensure the dataset is cleaned and ready for analysis.












