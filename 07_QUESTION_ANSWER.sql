select CustomerID,
count(diff)
 from
(select *,
 months - ranks diff
 from 
(select *,
row_number() over (partition by CustomerID order by months ) ranks
 from 
(SELECT 
   distinct
   CustomerID,
    MONTH(STR_TO_DATE(OrderDate, '%m/%d/%Y')) AS months
FROM
    orderdetails
WHERE
    YEAR(STR_TO_DATE(OrderDate, '%m/%d/%Y')) = (SELECT 
            MAX(YEAR(STR_TO_DATE(OrderDate, '%m/%d/%Y')))
        FROM
            orderdetails
        WHERE
            OrderDate IS NOT NULL))t)t1)t2
 where diff = 0
group by 1
having count(diff) = 2