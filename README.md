# Supply Chain Analysis in FMCG Domain

## Table of Contents
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Results](#results)
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

 **Order Analysis**
  ![orderanalysis-1](https://github.com/user-attachments/assets/88e08744-8599-4cbe-a1b0-d3abdeea1227)

 **Key Metrics**  
  ![keymetrocs-2](https://github.com/user-attachments/assets/22940f40-bdf0-4f19-a6d1-fc3ec7d47260)  

 **Key Metrics vs Target levels**  
  ![keymetrics vs targets-3](https://github.com/user-attachments/assets/4c9c8d1f-da2c-470e-b67c-603f8daec10f)  

 **Customer Product Analysis**  
  ![customerproductanalysis-4](https://github.com/user-attachments/assets/5b7cef69-6f4b-420e-b677-c10f3de9bd58)

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
1. All the ordered quantity was not delivered to the customers.  
2. Top 3 customers are Vijay Stores, Relfresh, Lotus Mart who also didn't get their full deliveries.    
3. Delivery of Diary and Food products faces the  major issue.  
4. All the key matrices IF%,OT%,OTIF% did not reach their respective targets not even a single day and is far away to reach the target  
5. On an average orders are delayed by 0.42 days  

## Recommendations  
1. Ensure Product Availability
    - Regularly monitor inventory levels to guarantee that all products ordered by customers are available.
    - Implement stock replenishment strategies to avoid any out-of-stock situations.
2. Identify Product Shortages
    - Conduct a thorough check during the logistics process to identify any missing products.
    - Use tracking systems to pinpoint where and why shortages occur, ensuring accurate stock records.
3. Analyze Availability and Shortages
    - Collect and analyze data on product availability and instances of missing items.
    - Generate reports to highlight trends and root causes of product shortages.
4. Focus on Full Delivery
    - The marketing team should prioritize ensuring that customers receive their full order quantities.
    - Communicate clearly with other departments to synchronize efforts for complete and timely deliveries.
5. Customer Communication
    - In cases where products are insufficient for delivery, promptly inform customers about the shortage.
    - Offer solutions, such as alternative products or adjusted delivery schedules, to maintain customer satisfaction.
