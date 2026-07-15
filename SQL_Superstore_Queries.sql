/*Calculate total sales and profit by region to compare regional 
 Performance*/
SELECT Region,
       Cast(Sum(sales) as decimal(18,2)) As Total_Sales,
       Cast(Sum(Profit) as decimal(18,2)) As Total_Profit
FROM dbo.Superstore_Dataset
GROUP BY Region
ORDER BY Total_Sales;

/* Calculate sales and profit in East Region to support regional 
performance comparison */

SELECT Region,Category,
       Cast(Sum(Sales) as Decimal(18,2)) as Total_Sales,
       Cast (Sum(Profit) as Decimal(18,2)) as  Total_Profit
FROM dbo.Superstore_Dataset
Where Region = 'East'
Group By Region,Category
ORDER BY Total_Sales DESC;

/* Calculate total sales and profit by Category in the West region 
to support regional performance*/
SELECT Region,Category,
      Cast(Sum(Sales) as Decimal(18,2)) as Total_Sales,
      Cast (Sum(Profit) as Decimal(18,2)) as  Total_Profit
FROM dbo.Superstore_Dataset
Where Region = 'West'
Group By Region,Category
ORDER BY Total_Sales DESC;

/* Analyze sales and profit by category in central region 
to identify the categories with the lowest profit*/
 
SELECT Region,Category,
       Cast(Sum(Sales) as Decimal(18,2)) as Total_Sales,
       Cast (Sum(Profit) as Decimal(18,2)) as  Total_Profit
FROM dbo.Superstore_Dataset
Where Region = 'Central'
Group By Region,Category
ORDER BY Total_Sales ASC;

/* Calculate total sales and profit by Category in the south region 
to support regional performance*/
SELECT Region,Category,
      Cast(Sum(Sales) as Decimal(18,2)) as Total_Sales,
      Cast (Sum(Profit) as Decimal(18,2)) as  Total_Profit
FROM dbo.Superstore_Dataset
Where Region = 'South'
Group By Region,Category
ORDER BY Total_Sales DESC;

/* Calculate avg discount in central region to analyze the relationship 
between discount levels and negative profit */
SELECT Region, 
       Category,
       Sub_Category,
       CAST(AVG(Discount) * 100 AS DECIMAL(5,2)) AS Avg_Discount_Percent,
       CAST(SUM(Sales) AS DECIMAL(18,2)) AS Total_Sales,
       CAST(SUM(Profit) AS DECIMAL(18,2)) AS Total_Profit
FROM dbo.Superstore_Dataset
WHERE Region = 'Central'
GROUP BY Region, Category, Sub_Category
ORDER BY Total_Profit ASC;

/* Calculate the average discount, total sales, and total profit 
for each Furniture sub-category in the Central region to identify 
which sub-categories are generating losses.*/

SELECT 
    Region,
    Category,
    Sub_Category,
    CAST(AVG(Discount) AS DECIMAL(5,2)) AS Avg_Discount,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS Total_Sales,
    CAST(SUM(Profit) AS DECIMAL(18,2)) AS Total_Profit
FROM dbo.Superstore_Dataset
WHERE Region = 'Central'
AND Category = 'Furniture'
GROUP BY Region, Category, Sub_Category
ORDER BY Total_Profit ASC;

/* Calculate the average discount and total profit to analyze the  
relationship between discount levels and profitability */

SELECT Region,
       Cast(Avg(Discount) as Decimal(10,2)) as Avg_Discount,
       Cast(Sum(Profit) as Decimal(18,2)) as Total_Profit
FROM dbo.Superstore_Dataset
Group By Region
ORDER BY Avg_Discount DESC;

/* Calculate profit margin by region to identify which region has the
lowest profit margin */

SELECT Region,
       CAST((SUM(Profit) / SUM(Sales)) * 100 AS DECIMAL(5,2)) AS Profit_Margin_Percent
FROM dbo.Superstore_Dataset
GROUP BY Region
ORDER BY Profit_Margin_Percent ASC;