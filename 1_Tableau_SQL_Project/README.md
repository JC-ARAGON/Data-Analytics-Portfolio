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

### **Sales Dashboard**
Remember that you can interact with the dashboards at [this link](https://public.tableau.com/app/profile/juan.cruz.aragon/vizzes).
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
- What are the total sales, profits, and costs over the years?
- How do sales, costs, and profits vary by product subcategory?
- What is the monthly trend of sales and profits across categories?
- Which shipping methods are preferred?
- Which states generate the most revenue?
- What is the sales distribution by customer segment?
- Who are the most profitable customers?





--------------------------------------------------------------------------------------------------------------------------
## **Key Insights**
1. **Sales Performance**:
   - **Total Sales**: $2,297,200.86
   - **Total Profits**: $286,397.02
   - **Total Costs**: $2,010,803.84
   - **Total Quantity Sold**: 37,873 units.
   - Top-performing subcategories by sales:
     - **Phones**: $356,702.35 in sales with a profit of $46,936.19.
     - **Chairs**: $330,891.13 in sales with a profit of $26,707.65.
     - **Storage**: $224,958.56 in sales with a profit of $21,408.70.

2. **Regional Trends**:
   - **Top 3 States by Sales**:
     - **California**: $465,333.76 with a profit of $77,842.74.
     - **New York**: $310,876.27 with a profit of $74,038.55.
     - **Texas**: $170,188.05 but incurred a loss of $25,729.36.

3. **Customer Insights**:
   - Top 10 customers by profit:
     - **Tamara Chand**: $8,981.32.
     - **Raymond Buch**: $6,976.10.
     - **Sanjit Chand**: $5,757.41.
   - Customer loyalty and profitability are concentrated among a few high-performing customers.

4. **Monthly Sales Trends** (Last 3 months of 2023):
   - **October**: $65,501.16 in sales with $6,572.07 in profit.
   - **November**: $89,306.24 in sales with $11,141.88 in profit.
   - **December**: $56,969.20 in sales with $7,413.63 in profit.

## **Recommendations**
1. **Product Strategy**:
   - It is recommended to focus on high-performing subcategories like Phones and Chairs to improve profitability.
   - Address the negative profitability of products like **Storage** by reviewing pricing or cost structures.

2. **Regional Strategy**:
   - Capitalize on strong sales performance in California and New York through targeted campaigns.
   - Investigate the loss in Texas to identify operational inefficiencies or pricing issues.

3. **Customer Engagement**:
   - Prioritize loyalty programs and exclusive offers for top customers like **Tamara Chand** and **Raymond Buch**.
   - Expand customer engagement efforts to underperforming regions or segments to balance sales distribution.

4. **Operational Improvements**:
   - Optimize inventory and shipping processes in states like Texas to reduce losses.
   - Use monthly sales trends to prepare for peak periods, especially in November, which shows strong sales and profitability.

## **Project Resources**
- [Visuals](./visuals) - Folder containing screenshots of Tableau dashboards.
- [SQL Queries](./sql_queries) - Folder containing the SQL queries used in this project.

## **How to Reproduce the Project**
1. Load the datasets into SQL Server.
2. Execute the SQL queries provided in the `sql_queries` folder.
3. Import the query results into Tableau.
4. Use Tableau to recreate the dashboards based on the examples above.

---

This project offers a detailed view of sales and customer data, providing actionable insights for strategic decision-making.


