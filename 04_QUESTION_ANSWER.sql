-- 4. Weakest Products per Category: For each category, find the product with the lowest sales or revenue.
select * from
(select p.Category,p.Name,sum(Subtotal),
dense_rank() over(partition by p.Category order by sum(Subtotal)) rnk
from product p 
join customer_orders co on p.ProductID = co.ProductID
group by p.Category,p.Name)t
where rnk = 1