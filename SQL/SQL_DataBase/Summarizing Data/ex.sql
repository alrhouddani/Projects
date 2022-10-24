select date,
    pm.name as payment_methood,
    SUM(amount) as Total_payments
FROM payments p
    Join payment_methods pm on p.payment_method = pm.payment_method_id
group by date,
    payment_methood
order by date,
    name