-- Total Sales, Total Profit, Total Quantity, and Total Costs
-- This query calculates the total sales, total profit, total quantity, and total costs for 2023.

SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales - Profit) AS Total_Costs
FROM Orders 
WHERE YEAR(Order_Date) = 2023;