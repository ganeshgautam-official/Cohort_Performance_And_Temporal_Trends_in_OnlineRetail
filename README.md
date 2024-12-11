# Cohort_Performance_And_Temporal_Trends_in_OnlineRetail
### Project Overview  
This project focuses on evaluating **cohort performance** and **temporal trends** in online retail to address key business challenges related to customer retention, churn, and revenue generation. Using transactional data from a UK-based retailer specializing in occasional gifts for wholesalers, the analysis provides actionable insights into customer behavior through the following:  

- **Cohort Performance**:  
  - Detailed analysis of **retention rates**, **revenue contribution**, and **active customer counts** across customer cohorts.  
  - Identification of high-value customer groups who generate significant revenue and at-risk customers prone to early churn.  
  - Evaluation of patterns in customer engagement and their contribution to monthly revenue.  

- **Temporal Trends**:  
  - Analysis of key metrics such as **Monthly Revenue**, **New Customer Acquisition**, and **Customer Retention vs. Churn** from December 2010 to December 2011.  
  - Tracking trends in these metrics over time to identify growth opportunities and areas needing improvement.  

The results of the analysis are presented through an interactive [Tableau dashboard](https://public.tableau.com/app/profile/ganesh.gautam7819/viz/CohortPerformanceTemporalTrendsinOnlineRetail/Cohort_Analysis_Online_Retail), which provides:  
- A clear visualization of revenue trends, customer engagement, and cohort performance.  
- Insights to guide resource allocation, marketing efforts, and customer retention strategies.  

This project equips the retailer with a data-driven approach to prioritize high-value customers, re-engage at-risk segments, and optimize marketing efforts to maximize revenue and improve customer satisfaction.  




### **1. Business Case**

#### Overview  
The retailer specializes in occasional gifts and primarily serves wholesalers. To remain competitive, the business aims to improve customer retention, optimize resource allocation for marketing, and maximize revenue generation. The retailer lacks an effective method to monitor key metrics such as revenue trends, customer retention, acquisition, and churn. With a limited budget for marketing and engagement activities, there is a need to identify high-value customers and develop strategies to retain them while addressing churn for at-risk customers.  

---

#### Problem  
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
- Provide insights into revenue, retention, and customer acquisition across customer cohorts to evaluate performance monthly.  

---

#### Questions to be Addressed by the Dashboard  

**Revenue and Acquisition**:  
- What is the monthly revenue generated from December 2010 to December 2011?  
- How many new customers were acquired in each month?
- How many active customers made purchases each month?

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
- From which customer segments should feedback be collected to identify key issues and make improvements, particularly focusing on those with high churn rates in successive months?  


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
  The churn rate measures the percentage of customers who stop making purchases. It is calculated as:  
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
Here’s the dashboard for the retailer system that helps track key performance indicators (KPIs) and segment customers for revenue, retention, and churn analysis. Explore the dashboard here: [Cohort Performance and Temporal Trends](https://github.com/ganeshgautam-official/Cohort_Performance_And_Temporal_Trends_in_OnlineRetail/blob/main/Queries/analyze.sql).
#### **1. Revenue, Acquisition, and Active Customer Trends**
![Monthly Trends Dashboard](images/monthly_trends_dashboard.png)

- Monthly revenue has steadily increased over time.
- Active customers are growing consistently.
- Customer Acquisitions exhibit a fluctuating pattern with a noticeable decline in recent months.


#### **2. Retention and Churn**
![Monthly Trends Dashboard](images/monthly_trends_dashboard.png)

- Retention rates are highest during the initial months for all cohorts, then decline over time.
- Cohort 2010-12 stands out as the most retained cohort, with 50% retention in November 2011 and ending the year at 26% retention, far above other cohorts.
- Churn rates show an inverse pattern, with most churn happening early in the lifecycle.


#### **2. Customer Segments**
![Monthly Trends Dashboard](images/monthly_trends_dashboard.png)

- Cohort 2010-11(Customers who made their first purchase in December 2010) contribute nearly 50% of total revenue ($4,093k) to date making them a pivotal group for long-term profitability.
- Customer segment May 2011 has a high average revenue per user (ARPU), despite fewer active customers and higher churn rates. Their revenue increased from $113k at acquisition to $173k by December 2011, indicating strong spending behavior among a small base.
- Customer segments in October 2011 and November 2011 show high initial churn within a short time interval. These groups disengage quickly.

### **5. Recommendations**
- **Engage high-value customer segments, such as December 2010 and May 2011**, with exclusive discounts, early access to new products, and loyalty programs.
- **Develop personalized engagement strategies to retain churn-prone customer segments**, particularly for  **October 2011 and November 2011**.
- **Allocate 70% of the marketing budget to loyalty programs targeting high-value customer segments**, focusing on **December 2010 and May 2011** to maximize retention and revenue.
- **Allocate 30% of the marketing budget to targeted re-engagement campaigns for churn-prone customer segments**, especially for **October 2011 and November 2011**.
- **Implement targeted feedback mechanisms to understand the needs and expectations of recent customer segments**, particularly **October 2011 and November 2011 segments**, to enhance retention and engagement.







