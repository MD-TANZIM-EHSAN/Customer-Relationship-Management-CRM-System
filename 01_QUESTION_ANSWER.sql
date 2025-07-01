-- 1. Identify the Top Five Products by Sales: Determine the five best-selling products
--    based on total revenue or units sold
select Product_Name, SUB_TOTAL from
(select p.name as Product_Name,sum(Subtotal) as SUB_TOTAL,
dense_rank() over(order by sum(Subtotal) desc) rn
from customer_orders c 
join product p on p.ProductID = c.ProductID
group by p.name)t
where rn <= 5
