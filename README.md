# Cohort_Performance_And_Temporal_Trends_in_OnlineRetail
### Project Overview   
This project analyzes **cohort performance** and **temporal trends** in online retail to evaluate customer retention, churn rates, and revenue generation. Using transactional data from a UK-based online retailer, the analysis provides insights into customer behavior over time through the following:

- **Cohort Performance**: A detailed comparison of cohort-wise **retention rates**, **total revenue**, and **active customers**. This analysis identifies patterns in customer retention across different cohorts and evaluates how various customer groups contribute to overall revenue and active customer counts.

- **Temporal Trends**: Examination of key metrics such as **Total Revenue**, **Active Customers**, and **New Customer Acquisition** over each month. The analysis also tracks percentage changes in these metrics from the starting month, providing a clear picture of growth or decline over time.

The results are presented through an interactive [Tableau dashboard](https://public.tableau.com/app/profile/ganesh.gautam7819/viz/CohortPerformanceTemporalTrendsinOnlineRetail/Cohort_Analysis_Online_Retail) that visualizes these trends, offering a comprehensive view of the retailer’s performance in terms of customer retention, revenue growth, and active customer engagement.






### **1. Business Case**

#### Overview  
The retailer specializes in occasional gifts and primarily serves wholesalers. To remain competitive, the business aims to improve customer retention, optimize resource allocation for marketing, and maximize revenue generation. The retailer lacks an effective method to monitor key metrics such as revenue trends, customer retention, acquisition, and churn. With a limited budget for marketing and engagement activities, there is a need to identify high-value customers and develop strategies to retain them while addressing churn for at-risk customers.  

---

#### Business Problem  
The absence of a comprehensive system to analyze customer and revenue trends has made it difficult for the retailer to:  
- Identify key customer groups that contribute the most to revenue.  
- Allocate marketing resources effectively to retain high-value customers.  
- Reduce customer churn by engaging with at-risk segments.  
- Understand and respond to customer feedback to improve product offerings.  

This insight gap restricts the retailer’s ability to strategically plan customer engagement initiatives, maximize revenue, and improve customer satisfaction.  

---

#### Objectives  
The retailer seeks to develop a dashboard that addresses the following business needs:  

**Monitor Temporal Trends**:  
- **Revenue Trends**: Track monthly revenue generation from December 2010 to December 2011.  
- **Customer Acquisition**: Analyze the number of new customers acquired each month.  
- **Customer Retention and Churn**: Assess the number of customers retained and churned each month.  

**Customer Segmentation and Prioritization**:  
- Identify high-value customer cohorts who generate significant revenue and engage with them through exclusive discounts and early access to new products.  
- Recognize churn-prone customers who disengage early and develop strategies to retain them, such as offering personalized engagement or gathering feedback.  

**Actionable Insights for Marketing**:  
- Ensure limited marketing budgets are allocated effectively by focusing on:  
  - Retaining high-value customers.  
  - Re-engaging churn-prone customers.  

**Customer Feedback and Engagement**:  
- Implement feedback mechanisms for churn-prone customers through email and messaging to understand their needs and expectations.  

**Group-Level Metrics**:  
- Provide insights into revenue, retention, and customer acquisition across customer cohorts to evaluate performance on a monthly basis.  

---

#### Questions to be Addressed by the Dashboard  

**Revenue and Acquisition**:  
- What is the monthly revenue generated from December 2010 to December 2011?  
- How many new customers were acquired in each month?  

**Retention and Churn**:  
- How many customers are retained each month across cohorts?  
- What are the churn rates for each customer cohort?  

**Customer Segmentation**:  
- Which customer groups contribute the most to revenue?  
- Which customer groups disengage quickly, and what steps can be taken to retain them?  

**Marketing Focus**:  
- How can the retailer best allocate limited resources to maximize revenue and retention?  
- Which customers should be prioritized for exclusive offers and new product access?  
- How can the retailer engage churn-prone customers more effectively?  

**Feedback and Product Improvement**:  
- How can customer feedback be collected and utilized to improve product offerings and customer engagement?  

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
For this project, the transactional data from the CSV file is stored in a relational database, which provides an efficient way to manage, query, and clean large datasets. The data is loaded into two tables within the database and the SQL code for the database creation and loading  can be found in the file [create_load.sql](https://github.com/ganeshgautam-official/Cohort_Performance_And_Temporal_Trends_in_OnlineRetail/blob/main/Queries/create_load.sql)

1. **sales_data_raw**: This table stores the raw data directly from the CSV file without any modifications. It serves as the backup table and ensures the original dataset is preserved for reference or reprocessing.

2. **sales_data**: After the data is loaded into the sales_data_raw table and cleaned through various preprocessing steps (such as removing cancellations, duplicates, and invalid entries like null CustomerID and zero UnitPrice), the cleaned data is transferred to the sales_data table. This table will hold the cleaned and validated dataset, which is now ready for analysis. It has the same structure as the sales_data_raw table but only contains relevant, high-quality data for further processing and insights.







### **3. Data Preprocessing**

#### **Data Cleaning**
- **Remove Canceled Transactions**: Identified and deleted transactions where InvoiceNo starts with 'C'.
- **Remove Duplicates**: Checked for duplicate records based on InvoiceNo, StockCode, and CustomerID, and deleted them.
- **Remove Null Customer IDs**: Filtered out rows where CustomerID was NULL, ensuring only valid customer data remains.
- **Remove Records with Zero UnitPrice**: Deleted records where UnitPrice was 0, indicating invalid or free transactions.
  
The SQL code for the data cleaning process can be found in the file [cleaning_transformation.sql](https://github.com/ganeshgautam-official/Cohort_Performance_And_Temporal_Trends_in_OnlineRetail/blob/main/Queries/cleaning_transformation.sql). This file contains all the necessary SQL queries for removing cancellations, duplicates, and invalid entries to ensure the dataset is cleaned and ready for analysis.


### **4. Analyze**
This section outlines the steps of analysis performed to assess cohort performance and temporal trends for UK-based online retailers. The goal is to evaluate customer retention, churn rates, total revenue per cohort, and key temporal trends such as new customer acquisition and changes in active customer counts. The following steps were used to extract and calculate insights from the data and the code for SQL queries for the analysis process can be found in the file [analyze.sql](https://github.com/ganeshgautam-official/Cohort_Performance_And_Temporal_Trends_in_OnlineRetail/blob/main/Queries/analyze.sql).

#### **1. Cohort Performance Analysis**
Cohort analysis provides insights into customer retention and behavior over time, enabling an understanding of how different customer groups (cohorts) contribute to overall revenue and engagement. The code for SQL queries for Cohort Performance Analysis can be found in the file [analyze.sql](https://github.com/ganeshgautam-official/Cohort_Performance_And_Temporal_Trends_in_OnlineRetail/blob/main/Queries/analyze.sql).

- **Monthly Cohort Assignment**:  
  Customers are grouped into cohorts based on the month of their first purchase (`Cohort_Month`). This is calculated by identifying the minimum transaction date for each customer and extracting the year and month.

- **Total Revenue Per Cohort**:  
  The total revenue for each cohort is calculated by summing the product of `Quantity` and `UnitPrice` for all transactions made by customers within each cohort, grouped by cohort and transaction month.

- **Average Revenue per Customer**:  
  For each cohort, the average revenue per customer is calculated as the total revenue for the cohort divided by the number of unique customers in that cohort.

- **Customer Retention Per Cohort**:  
  Retention is measured by counting the number of unique customers from each cohort who make purchases in subsequent months. This is grouped by `Cohort_Month` and `Order_Month`.

- **Retention Rate**:  
  The retention rate is calculated as the percentage of customers in a cohort who make purchases in a specific month. It is derived as:  
  **Retention Rate (%) = (Active Customers in Month / Initial Customers in Cohort) × 100**

- **Churn Rate**:  
  Churn rate measures the percentage of customers who stop making purchases. It is calculated as:  
  **Churn Rate (%) = 100 - Retention Rate (%)**

---

#### **2. Temporal Trends Analysis**
Temporal trends provide insights into how key metrics evolve over time, helping assess customer engagement, revenue trends, and business performance. These metrics were calculated 

- **Key Metrics Analyzed**:
  - **Total Revenue**: Calculated as the sum of `Quantity × UnitPrice` for all transactions in each month. This measures the overall revenue generated over time.
  - **Active Customers**: The count of unique customers who made purchases in each month. This reflects customer engagement and activity trends.
  - **New Customer Acquisition**: The count of customers making their first purchase in each month. This metric tracks growth in the customer base.

- **Percentage Change**:  
  For each metric, the percentage change from the starting month is calculated using **calculated fields in Tableau** as:  
  **Percentage Change (%) = ((Current Month Value - Starting Month Value) / Starting Month Value) × 100**

 All these key metrics are calculated using **calculated fields in Tableau**, leveraging the cleaned dataset.

By comparing these metrics month-over-month, temporal trends highlight areas of growth or decline, seasonal patterns, and the effectiveness of marketing or customer retention strategies.

---


### **4. Key Insights**
#### **1. Revenue Contribution by Cohort**










