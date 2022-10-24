SELECT state,
    city,
    sum(invoice_total) AS Total_sales
From invoices i
    JOIN clients using (client_id)
WHERE invoice_date >= '2019-07-01'
GROUP BY state,
    city;
------
------
SSELECT 
    date,
    pm.name AS payment_methood, 
    sum(amount) as Total_payments
    FROM payments AS p
JOiN payment_methods pm 
    ON p.payment_method = pm.payment_method_id
group by date 
order by date