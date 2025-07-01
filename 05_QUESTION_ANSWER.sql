-- SALE_QUANTITY
with CTE_TOTAL_SALES AS
(SELECT p.ProductID,p.Name,p.StockQuantity,
count(Quantity)  sale_quantity
FROM crm.customer_orders co
join product p on p.ProductID = co.ProductID
group by p.ProductID,p.Name,p.StockQuantity),
-- ============================================================
-- -- - - -p.StockQuantity - cts.sale_quantity Stock_Quantity
CTE_STATUS_ALERT as
(select p.ProductID,p.Name,p.StockQuantity,cts.sale_quantity,
p.StockQuantity - cts.sale_quantity Stock_Quantity
from product p
left join CTE_TOTAL_SALES  cts on cts.ProductID = p.ProductID)

-- stock report with alerts
select *,
 case 
    when Stock_Quantity <=20 then 'Low'
    when Stock_Quantity >20 and Stock_Quantity <= 70  then 'Moderate' 
    else 'Full'
    end Stock_Status
 from CTE_STATUS_ALERT
