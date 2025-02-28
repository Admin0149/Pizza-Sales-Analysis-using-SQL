
SELECT SUM(total_price) as Total_Revenue from pizza_sales ;

SELECT * FROM pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales;
SELECT SUM(quantity) as Total_Pizza_Sold from pizza_sales;

SELECT COUNT(DISTINCT order_id) as Total_Order from pizza_sales;
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) Average_Pizza_Per_Order FROM pizza_sales;

--DAILY TREND
SELECT DATENAME(DW, order_date) as order_day, count(distinct order_id)  as Total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date);

--HOURLY TREND
SELECT DATEPART(HOUR,order_time)as Order_hours,  count(distinct order_id)  as Total_orders
from pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time);

--PERCENTAGE OF SALES BY PIZZA CATEGORY

SELECT pizza_category , sum(total_price) as Total ,CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales where month(order_date)=1 ) AS DECIMAL(10,2)) as Percentage_sale
from pizza_sales
where month(order_date)=1
GROUP BY pizza_category;

-- PERCENTAGE OF SALE BY PIZZA SizE
SELECT pizza_size, sum(total_price) as Total ,CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)) as Percentage_sale
from pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_sale DESC;

-- TOTAL PIZZA SOLD BY PIZZA CATEGORY 
SELECT pizza_category , sum(quantity) as Total_Pizza_sold
from pizza_sales
GROUP BY pizza_category;

--TOP 5 SELLER 
SELECT top 5 pizza_name , sum(quantity) As Total_Pizza_sold
from pizza_sales
GROUP BY pizza_name
order by sum(quantity);
