USE sql_invoicing;
select p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name
FROM payments AS p
    JOIN clients AS c USING (client_id)
    JOIN payment_methods AS pm ON p.payment_method = pm.payment_method_id