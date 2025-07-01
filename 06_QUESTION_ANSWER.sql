-- 6 . Top 5 Customers by Order Count: Identify the five customers with the highest
-- number of orders and validate the data for accuracy.
select * from
(
select CustomerID,count(ï»¿OrderID) TOTAL_ORDER,
dense_rank() over(order by count(ï»¿OrderID) desc) rnk
 from orderdetails
group by CustomerID)t
where rnk <= 5 