-- 3. Least Popular Categories: Identify product categories with the lowest sales performance
select * from
(select p.Category,
sum(Subtotal),
dense_rank() over(order by sum(Subtotal) asc) rnk
from customer_orders co
join product p on co.ProductID = p.ProductID
group by p.Category)t
where rnk = 1