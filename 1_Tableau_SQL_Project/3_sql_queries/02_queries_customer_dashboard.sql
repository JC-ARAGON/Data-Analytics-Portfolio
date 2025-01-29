-- This query retrieves the top 10 states based on total sales in 2023.
SELECT TOP 10
    l.State,
    SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Location l ON o.Postal_Code = l.Postal_Code
WHERE YEAR(o.Order_Date) = 2023
GROUP BY l.State
ORDER BY Total_Sales DESC;


-- This query calculates total sales for each customer segment in 2023.
SELECT 
    o.Segment,
    SUM(o.Sales) AS Total_Sales
FROM Orders o
WHERE YEAR(o.Order_Date) = 2023
GROUP BY o.Segment
ORDER BY Total_Sales DESC;


-- This query calculates how many customers placed a specific number of orders in 2023.
SELECT 
    Order_Count,
    COUNT(Customer_ID) AS Number_of_Customers
FROM (
    SELECT 
        o.Customer_ID,
        COUNT(o.Order_ID) AS Order_Count
    FROM Orders o
    WHERE YEAR(o.Order_Date) = 2023
    GROUP BY o.Customer_ID
) OrderFrequency
GROUP BY Order_Count
ORDER BY Order_Count;

-- This query retrieves the top 10 customers based on total profit in 2023.
SELECT TOP 10
    o.Customer_ID,
    c.Customer_Name,
    SUM(o.Profit) AS Total_Profit
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
WHERE YEAR(Order_Date) = 2023
GROUP BY o.Customer_ID, c.Customer_Name
ORDER BY Total_Profit DESC;


