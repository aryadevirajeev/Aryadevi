# Supply Chain Analysis in FMCG Domain

## Table of Contents
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Recommendatios](#recommendations)
  
## Project Overview
AtliQ Mart is a growing FMCG manufacturer headquartered in Gujarat, India. It is currently operational in three cities Surat, Ahmedabad and Vadodara. They want to expand to other metros/Tier 1 cities in the next 2 years.

AtliQ Mart is currently facing a problem where a few key customers did not extend their annual contracts due to service issues. It is speculated that some of the essential products were either not delivered on time or not delivered in full over a continued period, which could have resulted in bad customer service. Management wants to fix this issue before expanding to other cities and requested their supply chain analytics team to track the ’On time’ and ‘In Full’ delivery service level for all the customers daily basis so that they can respond swiftly to these issues.

The Supply Chain team decided to use a standard approach to measure the service level in which they will measure ‘On-time delivery (OT) %’, ‘In-full delivery (IF) %’, and OnTime in full (OTIF) %’ of the customer orders daily basis against the target service level set for each customer.
## Data Source
There are 6 .csv files:  
**dim_customers** This table contains all the information about customers  
**dim_products**  This table contains all the information about the products  
**dim_date** This table contains the dates at daily, monthly level and week numbers of the year  
**dim_targets_orders**  This table contains all target data at the customer level  
**fact_order_lines** This table contains all information about orders and each item inside the orders  
**fact_orders_aggregate** This table contains information about OnTime, InFull and OnTime Infull information aggregated at the order level per customer  
### Tools
- Excel - Analysis and Cleaning
- Power BI - Creating reports
### Data Cleaning/Preperation  
In the initial phase of data preperation, files were downloaded and performed the following tasks:  
1.Checking for missing values if any  
2.Checked for dupilcate values  
3.Formatting
### Exploratory Data Analysis(EDA)
EDA involved exploring on the data sets to relate the variables for key matrices which stakeholders wants to take into account:  
1. Caluculated all key matrices.
2. Some major key matrices : OT%,IF%,OTIF%,LIFR%,VOFR%
### Results  
The analysis results are summarized as follows:  
1.All the ordered quantity was not delivered to the customers.  
2.Top customers also faces the same issue. 
3.Delivery of Diary and Food products faces the  major issue.  
4.All the key matrices IF%,OT%,OTIF% did not reach their respective targets not even a single day.
## Recommendations  
* Focus on the availability of products ordered by the customer
* Make sure if there is any missing of the product during logistics
* After analysing the availability and missing products, marketing team should focus on the customers ensuring full delivery of products
* In case if there is insufficient products for delivery customers should informed regarding the same
