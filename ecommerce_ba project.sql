CREATE DATABASE ecommerce_ba;
USE ecommerce_ba;
SHOW DATABASES;
SELECT * FROM online_retail LIMIT 10;

# Total Revenue
SELECT ROUND(SUM(Revenue),2) AS Total_Revenue FROM online_retail;

# Total Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers FROM online_retail;

# Total orders
SELECT
COUNT(DISTINCT InvoiceNo)
AS Total_Orders
FROM online_retail;

# Top Products
SELECT
Description,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

# Top Customers
SELECT
CustomerID,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

# Country Revenue
SELECT
Country,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY Country
ORDER BY Revenue DESC;


# Bottom !0 products
SELECT
Description,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Description
ORDER BY Revenue ASC
LIMIT 10;


# Country-wise Revenue
SELECT
Country,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Country
ORDER BY Revenue DESC;

# Repeated Customrs
SELECT
COUNT(*) AS Repeat_Customers
FROM
(
SELECT CustomerID
FROM online_retail
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 1
) t;

# One time customers
SELECT
COUNT(*) AS One_Time_Customers
FROM
(
SELECT CustomerID
FROM online_retail
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) = 1
) t;

# Monthly growth Rate
SELECT
YEAR(InvoiceDate) AS Year,
MONTH(InvoiceDate) AS Month,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY Year, Month
ORDER BY Year, Month;

# Peak Sales Hours
SELECT
HOUR(InvoiceDate) AS Hour,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Hour
ORDER BY Revenue DESC;

# Top 5 products in Each Country
SELECT
Country,
Description,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY Country, Description
ORDER BY Country, Revenue DESC;

# Revenue Category Analysis
SELECT
CASE
    WHEN Revenue > 1000 THEN 'High Sale'
    WHEN Revenue BETWEEN 100 AND 1000 THEN 'Medium Sale'
    ELSE 'Low Sale'
END AS Revenue_Category,
COUNT(*) AS Transactions
FROM online_retail
GROUP BY Revenue_Category;

# Product Performance Rating
SELECT
Description,
SUM(Revenue) AS Revenue,
CASE
    WHEN SUM(Revenue) > 50000 THEN 'Excellent'
    WHEN SUM(Revenue) > 10000 THEN 'Good'
    ELSE 'Poor'
END AS Product_Performance
FROM online_retail
GROUP BY Description
ORDER BY Revenue DESC;