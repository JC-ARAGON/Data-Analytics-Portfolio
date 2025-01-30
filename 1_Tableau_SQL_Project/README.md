# **Sales and Customer Analysis Project**

## **Introduction**
This project aims to analyze sales and customer data to provide insights that can help make better business decisions. By leveraging SQL Server for querying and Tableau for visualization, we explored key trends in sales performance and customer behavior. The analysis is presented through two interactive dashboards: the **Sales Dashboard** and the **Customer Dashboard**.

## **Dataset Description**
The analysis is based on four interrelated datasets:

1. **Products**:
   - `Product ID`: Unique identifier for each product.
   - `Category` and `Sub-Category`: Classification of products.
   - `Product Name`: Description of the product.

2. **Orders**:
   - `Order ID`: Unique identifier for each order.
   - `Order Date` and `Ship Date`: Timeline of the order process.
   - `Customer ID`: Links orders to customers.
   - `Product ID`, `Sales`, `Quantity`, `Discount`, and `Profit`.

3. **Customers**:
   - `Customer ID`: Unique identifier for each customer.
   - `Customer Name`: Name of the customer.

4. **Location**:
   - `Postal Code`, `City`, `State`, `Region`, and `Country/Region`: Geographical details of customers.

## **Objectives**
The primary goals of this project are:

1. To identify key sales trends and customer behavior patterns.
2. To create insights for decision-makers through interactive dashboards.
3. To answer specific business questions related to sales and customers.

## **Technologies Used**
- **SQL Server**: For data querying and exploration.
- **Tableau**: For creating interactive dashboards and visualizations.

## **Dashboards** 
Remember that you can interact with the dashboards at [this link](https://public.tableau.com/app/profile/juan.cruz.aragon/vizzes).

### **Sales Dashboard**
This dashboard provides insights into overall sales performance:

1. **KPIs**:
   - Total Sales
   - Total Profits
   - Total Costs
   - Total Quantity

2. **Visualizations**:
   - **Sales, Costs, and Profits by Subcategory by Year**
   - **Product Performance: Sales vs. Profit by Year**
   - **Monthly Sales Trends by Year**
   - **Monthly Profit Trends by Category by Year**
   - **Orders by Shipping Method by Year**

![Sales Dashboard](./2_visuals/01_sales_dashboard.png)

### **Customer Dashboard**
This dashboard focuses on customer insights:

1. **Visualizations**:
   - **Sales by State**
   - **Top 10 States by Sales**
   - **Sales by Customer Segment**
   - **Customer Distribution by Number of Orders**
   - **Top 10 Customers by Profit**

![Customer Dashboard](./2_visuals/02_customer_dashboard.png)

## **Analysis Questions**
- What are the total sales, profits, quantities and costs over the years?
- Which subcategories had the highest and lowest sales, costs, and profits in 2023?
- Which products generate the highest sales but have low profitability, and which products have high profitability despite lower sales?
- How did sales trends evolve month by month in 2023?
- Which categories had the highest and lowest profits each month in 2023?
- Which shipping methods are preferred?
- Which states generate the most revenue?
- Which customer segment generated the highest and lowest sales in 2023?
- How many customers placed multiple orders in 2023, and what was the most common order frequency?
- Who are the most profitable customers?

## **Project Resources**
- **[Visuals](./visuals)** - Folder containing screenshots of Tableau dashboards.
- **[SQL Queries](./sql_queries)** - Folder containing the SQL queries used in this project.

## **How to Reproduce the Project**
1. Load the datasets into **SQL Server**.
2. Execute the SQL queries provided in the `sql_queries` folder.
3. Interact with the dashboards at [this link](https://public.tableau.com/app/profile/juan.cruz.aragon/vizzes).

---
This project provides a detailed view of sales and customer data, delivering actionable insights for strategic decision-making.





