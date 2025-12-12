Select * 
From PizzaDB..pizza_sales

--Total Revenue

Select SUM(total_price) AS Total_Revenue
From PizzaDB..pizza_sales 

--Average Order Amount

Select SUM(total_price)/COUNT(Distinct (order_id)) as 'AVG_Order_Amount'
From PizzaDB..pizza_sales

--Total Pizas Sold 

Select SUM(quantity) as Total_Pizza_Sold
From PizzaDB..pizza_sales

--Total Orders

Select Count(DISTINCT(order_id)) as Total_Orders
From PizzaDB..pizza_sales

--Average Pizza Per Order

Select CAST(CAST(SUM(quantity) as decimal(10,2))/
CAST(Count(DISTINCT(order_id)) as decimal(10,2)) as decimal(10,2)) as AVG_Pizza_Per_Order
From PizzaDB..pizza_sales

--Daily Trend for Total Orders

Select DATENAME(DW, order_date) as order_day
,COUNT(Distinct(order_id)) as Total_orders
From PizzaDB..pizza_sales
Group By DATENAME(DW, order_date)

--Hourly Trend

Select DATEPART(HOUR,order_time) as Order_Hours
,COUNT(Distinct(order_id)) as Total_orders
From PizzaDB..pizza_sales
Group By DATEPART(HOUR,order_time) 
Order By DATEPART(HOUR,order_time)

--Percentage of Sales By Pizza Order

Select pizza_category, SUM(total_price)*100 / 
(Select sum(total_price) from pizza_sales Where MONTH(order_date) = 1) as Percent_of_sales
From PizzaDB..pizza_sales
Where MONTH(order_date) = 1
Group By pizza_category

--Percentage Of Sales By Pizza Size

Select pizza_size, CAST(SUM(total_price) *100 / 
(Select SUM(total_price) from PizzaDB..pizza_sales) as decimal(10,2)) as PCT
From PizzaDB..pizza_sales
Group By pizza_size
Order By PCT DESC

--Total Pizza Sold By Pizza Category

Select pizza_category,SUM(quantity) as Pizza_Sold
From PizzaDB..pizza_sales
Group by pizza_category

--Top 5 Best Sellers


Select TOP 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
From PizzaDB..pizza_sales
Group By pizza_name
Order By Sum(quantity) DESC

--Bottom 5 Sellers

Select TOP 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
From PizzaDB..pizza_sales
Group By pizza_name
Order By Sum(quantity) ASC









