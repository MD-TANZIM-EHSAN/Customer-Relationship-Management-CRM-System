-- 8. Monthly Sales Breakdown for 2024 Generate a detailed report of sales
-- performance for each month of 2024 
select months,sum(TOTAL_SALE) SUM_TOTAL from
(select month(str_to_date(o.OrderDate, '%m/%d/%Y')) months,co.Subtotal TOTAL_SALE
from customer_orders co
left join orderdetails o on co.OrderID = o.ï»¿OrderID
where year(str_to_date(o.OrderDate, '%m/%d/%Y')) = 2024)t
group by months
order by months 