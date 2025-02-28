# Pizza Sales Analysis using SQL

**Objective**
This project aims to analyze pizza sales data using SQL queries to extract key insights such as revenue trends, order patterns, and category-wise performance.

## Key SQL Queries and Insights

**1.Total Revenue**

**SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;**

> Calculates the total revenue generated from pizza sales.

**2.Average Order Value**

**SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales;**

> Determines the average revenue per order.

**3.Total Pizzas Sold**

**SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;**

> Finds the total number of pizzas sold.

**4.Total Orders**

**SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;**

> Counts the total unique orders placed.

**5.Average Pizzas Per Order**

**SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_Pizza_Per_Order FROM pizza_sales;**

> Calculates the average number of pizzas purchased per order.

### Trend Analysis

**6.Daily Order Trends**

**SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);**

> Identifies which days of the week receive the highest number of orders.

**7.Hourly Order Trends**

**SELECT DATEPART(HOUR, order_time) AS Order_Hour, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);**

> Determines peak ordering hours.

### Sales Distribution

**8.Percentage of Sales by Pizza Category**

**SELECT pizza_category, 
       SUM(total_price) AS Total_Sales,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL(10,2)) AS Sales_Percentage
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;**

> Analyzes how different pizza categories contribute to total sales.


## Conclusion

This SQL project provides a comprehensive analysis of pizza sales data, helping businesses understand revenue trends, customer purchasing behavior, and peak sales periods. The insights can be leveraged for strategic decision-making, such as optimizing inventory, planning promotions, and improving operational efficiency.




![Screenshot 2025-02-28 090743](https://github.com/user-attachments/assets/009b6566-f861-4c83-bf83-9e63465fe8f1)

