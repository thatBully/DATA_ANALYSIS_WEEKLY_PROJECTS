-- Week 1: E-commerce Revenue Analysis

-- 1. Total sales revenue
SELECT 
    ROUND(SUM(SalesRevenue), 2) AS total_sales_revenue
FROM cleaned_online_retail
;

-- 2. Total return value
SELECT 
    ROUND(SUM(ReturnValue), 2) AS total_return_value
FROM cleaned_online_retail
;

-- 3. Net revenue
SELECT 
    ROUND(SUM(Revenue), 2) AS net_revenue
FROM cleaned_online_retail
;

-- 4. Revenue by country
SELECT 
    Country,
    ROUND(SUM(SalesRevenue), 2) AS sales_revenue
FROM cleaned_online_retail
GROUP BY Country
ORDER BY sales_revenue DESC;

-- 5. Top 10 products by revenue
SELECT 
    StockCode,
    Description,
    ROUND(SUM(SalesRevenue), 2) AS sales_revenue
FROM cleaned_online_retail
GROUP BY StockCode, Description
ORDER BY sales_revenue DESC
LIMIT 10;

-- 6. Top 10 customers by revenue
SELECT 
    CustomerID,
    ROUND(SUM(SalesRevenue), 2) AS customer_revenue
FROM cleaned_online_retail
WHERE CustomerID IS NOT NULL
  AND CustomerID != 'nan'
  AND CustomerID != 'None'
GROUP BY CustomerID
ORDER BY customer_revenue DESC
LIMIT 10;

-- 7. Monthly revenue trend
SELECT 
    strftime('%Y-%m', InvoiceDate) AS month,
    ROUND(SUM(SalesRevenue), 2) AS monthly_revenue
FROM cleaned_online_retail
GROUP BY month
ORDER BY month;

-- 8. Return-heavy products
SELECT 
    StockCode,
    Description,
    ROUND(SUM(ReturnValue), 2) AS total_returns
FROM cleaned_online_retail
WHERE is_return = 1
GROUP BY StockCode, Description
ORDER BY total_returns DESC
LIMIT 10;