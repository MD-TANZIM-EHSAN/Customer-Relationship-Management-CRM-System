-- 11. Last 3 Month Sales Comparison: Compare sales performance over the past three
-- months and assess whether the results meet expectations
select *,
 case when difference < 0 then 'BAD'
 else 'GOOD'
 end  BUSINESS_STATUS
 from
(
select  *, coalesce((lead(TOTAL_SALE_PER_MONTH) over(order by months desc)),0),
TOTAL_SALE_PER_MONTH - coalesce((lead(TOTAL_SALE_PER_MONTH) over(order by months desc)),0)  difference
from
(
select *from
(select *,
dense_rank() over(order by months desc) last_3_Month
 from 
(select months,sum(TOTAL_SALE) TOTAL_SALE_PER_MONTH
 from
(select *,
month(str_to_date(ODR_DATE, '%m/%d/%Y')) months
from
(select o.OrderDate ODR_DATE ,co.Subtotal TOTAL_SALE from customer_orders co
left join orderdetails o on co.OrderID = o.ï»¿OrderID
where year(str_to_date(o.OrderDate, '%m/%d/%Y')) =  
(select max(year(str_to_date(OrderDate, '%m/%d/%Y'))) from orderdetails))t
)t2
group by months)t3)t4
where last_3_Month <=3
)t3
)t4