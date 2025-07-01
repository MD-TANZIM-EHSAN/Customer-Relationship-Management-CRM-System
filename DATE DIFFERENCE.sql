-- DIfference between RegistrationDate and FIRST_ORDER
SELECT 
    *,
    TIMESTAMPDIFF(DAY,RegistrationDate,FIRST_ORDER) DIFFERENCE --  (day,older_date ,new_date)
FROM
    (SELECT 
        c.CustomerID,
		c.RegistrationDate,
		MIN(STR_TO_DATE(OrderDate, '%m/%d/%Y')) FIRST_ORDER -- min mean older date
    FROM
        customer c
    JOIN orderdetails o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID , c.RegistrationDate) t