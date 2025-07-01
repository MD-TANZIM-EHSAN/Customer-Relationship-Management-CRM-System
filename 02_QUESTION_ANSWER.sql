--  2. Top Product Categories by Sales: Analyze which product categories generate the highest revenue 
select * from
(SELECT p.Category,
sum(Subtotal) TOTAL_SALE,
dense_rank() over (order by sum(Subtotal) desc) TOP_RANK
FROM crm.customer_orders co
join product p  on p.ProductID = co.ProductID
group by p.Category)t
where TOP_RANK = 1
;