USE retail_sales;

-- correction of column name

ALTER TABLE sales
RENAME COLUMN ï»¿transactions_id TO transaction_id;

ALTER TABLE sales
RENAME COLUMN quantiy TO quantity;

-- changing the datatype of `sale_date` to DATE

ALTER TABLE sales
MODIFY sale_date DATE;

-- checking nulls

SELECT * FROM sales
WHERE 
	transaction_id IS NULL OR 
    sale_date IS NULL OR 
    sale_time IS NULL OR 
    customer_id IS NULL OR 
    gender IS NULL OR 
    age IS NULL OR 
    category IS NULL OR 
    quantity IS NULL OR 
    price_per_unit IS NULL OR 
    cogs IS NULL OR 
    total_sale IS NULL;

-- count of total sales

SELECT COUNT(*) AS no_of_sales FROM sales;

-- count of customers

SELECT COUNT(DISTINCT customer_id) FROM sales;

-- product categories

SELECT DISTINCT category FROM sales;

-- Query 1 - retrieve all columns for sales made on '2022-11-05'

SELECT * 
FROM sales
WHERE sale_date = '2022-11-05';

-- Query 2 - retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of November

SELECT *
FROM sales
WHERE category = 'Clothing'
AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
AND quantity >= 4;

-- Query 3 - retrieve the total sales for each category

SELECT category, SUM(total_sale) AS total_sale
FROM sales
GROUP BY category;

-- Query 4 - retrieve the average ages of customers who purchased items from the 'Beauty' category

SELECT ROUND(AVG(age), 2) AS avg_age
FROM sales
WHERE category = 'Beauty';

-- Query 5 - retrieve all transactions where total sale is greater than 1000

SELECT *
FROM sales
WHERE total_sale > 1000;

-- Query 6 - retrieve total number of transactions made by each gender in each category

SELECT category, gender, COUNT(*) as total_transactions
FROM sales
GROUP BY category, gender
ORDER BY category;

-- Query 7 - retrieve average sales for each month and find out best selling month in each year
SELECT year, month, avg_sales FROM
(
	SELECT YEAR(sale_date) as year, MONTH(sale_date) AS month, AVG(total_sale) AS avg_sales, RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS ranks
	FROM sales
	GROUP BY year, month
) AS t1
WHERE ranks = 1;

-- Query 8 - retrieve top 5 customers based on the highest total sales

SELECT customer_id, SUM(total_sale) as total_sales
FROM sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Query 9 - retrieve unique customers who purchased items from each category

SELECT DISTINCT category, COUNT(DISTINCT customer_id) AS no_of_customers
FROM sales
GROUP BY category;

-- Query 10 - retrieve each shift and number of orders (example: Morning <= 12, Afternoon between 12 & 17, Evening > 17)

WITH hourly_sales 
AS
(
	SELECT *,
		CASE
			WHEN HOUR(sale_time) < 12 THEN 'Morning'
			WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS shift
	FROM sales
)
SELECT shift, COUNT(*) AS no_of_orders
FROM hourly_sales
GROUP BY shift;

-- End of project

