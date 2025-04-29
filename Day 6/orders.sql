-- Write a SQL query that groups the orders by year and month, showing the total revenue and the number of distinct orders for each group.
SELECT month(InvoiceDate) as month ,year(InvoiceDate) as year,SUM(Quantity*UnitPrice) as revenue , COUNT(DISTINCT(InvoiceNo)) as cnt_orders FROM taskelevatelabs.online_sales_dataset
GROUP BY month(InvoiceDate),year(InvoiceDate);


-- How would you write a SQL query that calculates the total revenue for each month, using SUM()?
SELECT month(InvoiceDate) as month ,ROUND(SUM(Quantity*UnitPrice),2) as revenue FROM taskelevatelabs.online_sales_dataset
GROUP BY month(InvoiceDate);


-- Write a SQL query that counts the distinct order_id for each year in the data.
SELECT year(InvoiceDate) as year,COUNT(DISTINCT(InvoiceNo)) as cnt_orders FROM taskelevatelabs.online_sales_dataset
GROUP BY Year(InvoiceDate);


-- How can you modify a SQL query to sort the results by total revenue in descending order?
SELECT month(InvoiceDate) as month ,ROUND(SUM(Quantity*UnitPrice),2) as revenue FROM taskelevatelabs.online_sales_dataset
GROUP BY month(InvoiceDate)
ORDER BY revenue DESC;


-- Write a SQL query that limits the results to the orders placed in 2022.
SELECT * FROM taskelevatelabs.online_sales_dataset
WHERE YEAR(InvoiceDate) =2022;


-- Write a SQL query that groups orders by year and month, but only includes data for the month of January across all years.
SELECT month(InvoiceDate) as month ,year(InvoiceDate) as year,SUM(Quantity*UnitPrice) as revenue , COUNT(DISTINCT(InvoiceNo)) as cnt_orders FROM taskelevatelabs.online_sales_dataset
WHERE month(InvoiceDate)=1
GROUP BY month(InvoiceDate),year(InvoiceDate);



-- Write a SQL query to filter the results for orders placed between January 1st, 2022, and December 31st, 2022.
SELECT * FROM taskelevatelabs.online_sales_dataset 
WHERE InvoiceDate BETWEEN '2022-01-01' AND '2022-12-31';


-- Write a SQL query that shows the total revenue for each month, as well as the distinct order volume (number of unique customers).
SELECT month(InvoiceDate) as month ,ROUND(SUM(Quantity*UnitPrice)) as revenue , COUNT(DISTINCT(CustomerID)) as cnt_customers FROM taskelevatelabs.online_sales_dataset
GROUP BY month(InvoiceDate);


-- How would you write a SQL query that limits the results to orders from 2021 and sorts the data by revenue in ascending order?
SELECT month(InvoiceDate) as month ,ROUND(SUM(Quantity*UnitPrice)) as revenue  FROM taskelevatelabs.online_sales_dataset
WHERE year(InvoiceDate) = 2021 
GROUP BY month(InvoiceDate)
ORDER BY revenue;
