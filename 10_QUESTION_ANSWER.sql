-- 10. Best-Selling Month of the Current Year: Analyze sales data to determine the
-- top-performing month for the current calendar year
select * from
(select *,
dense_rank() over(order by SUM_TOTAL desc) rnk from
(
select months,sum(TOTAL_SALE) SUM_TOTAL from
(select month(str_to_date(o.OrderDate, '%m/%d/%Y')) months,co.Subtotal TOTAL_SALE
from customer_orders co
left join orderdetails o on co.OrderID = o.ï»¿OrderID
where year(str_to_date(o.OrderDate, '%m/%d/%Y')) = year(now()))t
group by months
order by months 
)t1
)t2
where rnk =1