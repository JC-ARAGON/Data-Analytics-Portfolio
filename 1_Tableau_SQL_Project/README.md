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

--------------------------------------------------------------------------------------------------------------------------
1. **What are the total sales, profits, quantities and costs over the years?**
   
   This is the query used to retrieve that information:
   
   ![kpi_query](./2_visuals/03_kpi_query.png)
   
   This is the chart used in Tableau:
   
   ![kpi_tableau](./2_visuals/04_kpi_tableau_visual.png)

2. **Which subcategories had the highest and lowest sales, costs, and profits in 2023?**

   This is the query used to retrieve that information:

   ![kpi_query](./2_visuals/21_query_sales_cost_profit.png)

   This is the chart used in Tableau:

    ![kpi_tableau](./2_visuals/22_sales_costs_profits_subcategory.png)

**Insights**
1.	Most Profitable Subcategory: Copiers had the highest total profit of $25,031.79, despite having lower total sales ($62,899.39) compared to Phones.
2.	High Sales, Moderate Profit: Phones generated the highest revenue ($113,370.98) but had a significantly lower profit margin ($13,860.53), suggesting either high costs or aggressive discounting.
3.	Strong Performance in Accessories and Paper: Both subcategories had good profits, with Accessories at $17,805.24 and Paper at $13,416.86, indicating steady demand.
4.	Appliances' Marginal Profitability: While Appliances had $43,531.83 in sales, its profit was only $8,016.49, meaning potential cost issues or pricing inefficiencies.

**Recommendations**
1.	Optimize Phone Pricing and Costs: Since Phones generate high revenue but lower profit, analyze cost structures or reconsider discounts to improve margins.
2.	Continue Investing in Copiers & Accessories: These categories show strong profitability and demand, making them ideal for further promotion and inventory management.
3.	Review Appliance Costs & Discounts: Appliances’ low profitability suggests evaluating supplier costs, reducing unnecessary discounts, or reconsidering the product mix.
4.	Leverage Paper’s Stability: Paper has a solid profit margin, making it a steady revenue contributor. Consider bundling strategies to increase volume sales.

3.**- Which products generate the highest sales but have low profitability, and which products have high profitability despite lower sales?**

   This is the query used to retrieve that information:

 ![kpi_query](./2_visuals/05_query_product_performance.png)

    This is the chart used in Tableau:

 ![kpi_tableau](./2_visuals/06_product_performance.png)

**Insights**
1.	Best Performing Product: The Canon imageCLASS 2200 Advanced Copier generated the highest profit ($15,679.96) and had the highest total sales ($35,699.90), confirming its strong market demand and profitability.
2.	Other High-Profit Products: The Hewlett Packard LaserJet 3310 Copier and the GBC DocuBind TL300 Electric Binding System were also profitable, but at a lower scale, with profits of $3,623.94 and $1,910.59, respectively.
3.	Binding Machines Show Consistent Performance: Both the Fellowes PB300 Plastic Comb Binding Machine and the GBC DocuBind TL300 showed decent profitability, indicating a stable demand in office supplies.
4.	Canon's Strong Presence: Two Canon copier models made it to the top five in terms of profitability, suggesting the brand's strong reputation and customer trust in this segment.
   
**Recommendations**
1.	Invest More in Canon Copiers: The Canon imageCLASS 2200 is highly profitable, making it a strong candidate for increased inventory and targeted marketing campaigns.
2.	Expand Sales of Binding Machines: Since both binding machines performed well, exploring bundle deals or volume discounts could further boost sales.
3.	Analyze Lower-Performing Products: Products with high sales but low profitability should be evaluated to understand cost inefficiencies or pricing strategy issues.
4.	Leverage Brand Loyalty for Future Sales: The success of Canon products suggests an opportunity to introduce and promote newer models under this brand.

4.**- How did sales trends evolve month by month in 2023?**

   This is the query used to retrieve that information:

 ![kpi_query](./2_visuals/07_query_sales_trends.png)

 This is the chart used in Tableau:

 ![kpi_tableau](./2_visuals/08_monthly_trend_sales.png)

**Insights**
1.	Overall Sales Growth: Total sales in 2023 increased by 20.36% compared to 2022 ($733,215.26 vs. $609,205.60), indicating a strong upward trend.
2.	Peak Sales Shifted Earlier: The highest sales month in 2022 was December ($96,999.04), while in 2023, the peak was in November ($118,447.83). This could suggest an earlier holiday shopping season or better Black Friday promotions.
3.	Slowest Month Improvement: The lowest sales month in 2022 was January ($18,542.49), while in 2023, it was February ($20,301.13). Despite February being the weakest month, it still showed a small improvement over the previous year.
4.	Holiday Sales Strengthened: The November peak in 2023 outperformed December 2022, suggesting that holiday shopping habits may have shifted earlier.
   
**Recommendations**
1.	Capitalize on Early Holiday Demand: Since November had the highest sales in 2023, businesses should start holiday promotions earlier and optimize Black Friday/Cyber Monday campaigns.
2.	Address Post-Holiday Slumps: January and February continue to be the slowest months. Implement off-season discounts or targeted marketing efforts to boost Q1 sales.
3.	Monitor Trends for Further Shifts: If this earlier peak continues, adjust inventory planning and marketing budgets accordingly to maximize revenue.
4.	Investigate the Factors Behind the Growth: The 20.36% overall increase is positive, but understanding whether it was due to higher pricing, increased demand, or better promotions will help refine future strategies.






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


