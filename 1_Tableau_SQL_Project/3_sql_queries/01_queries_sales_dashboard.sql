-- Sales, costs, and profit by subcategory in 2023
SELECT 
    p.Sub_Category,
    SUM(o.Sales) AS Total_Sales,
    SUM(o.Sales - o.Profit) AS Cost, 
    SUM(o.Profit) AS Total_Profit
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE YEAR(o.Order_Date) = 2023
GROUP BY p.Sub_Category
ORDER BY Total_Profit DESC;

-- Product Performance: Sales vs. Profit in 2023
SELECT 
    p.Product_Name,
    SUM(o.Sales) AS Total_Sales,
    SUM(o.Profit) AS Total_Profit
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE YEAR(o.Order_Date) = 2023
GROUP BY p.Product_Name
ORDER BY Total_Profit DESC;


-- This query compares total sales per month in 2023 and 2022 to identify trends.
SELECT 
    YEAR(o.Order_Date) AS Year,
    MONTH(o.Order_Date) AS Month,
    SUM(o.Sales) AS Total_Sales
FROM Orders o
WHERE YEAR(o.Order_Date) IN (2022, 2023)
GROUP BY YEAR(o.Order_Date), MONTH(o.Order_Date)
ORDER BY Year, Month;


-- This query calculates total profit per category for each month in 2023.
SELECT 
    p.Category,
    MONTH(o.Order_Date) AS Month,
    SUM(o.Profit) AS Total_Profit
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE YEAR(o.Order_Date) = 2023
GROUP BY p.Category, MONTH(o.Order_Date)
ORDER BY p.Category, Month;


-- This query counts the number of orders per shipping method in 2023.
SELECT 
    o.Ship_Mode,
    COUNT(o.Order_ID) AS Total_Orders
FROM Orders o
WHERE YEAR(o.Order_Date) = 2023
GROUP BY o.Ship_Mode
ORDER BY Total_Orders DESC;





