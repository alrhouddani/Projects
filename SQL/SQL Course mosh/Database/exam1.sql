SELECT name,
    unit_price,
    (unit_price * 1.1) as 'New Price'
FROM products USE sql_invoicing;
SELECT c.name,
    pm.name
FROM payments p
    JOIN clients c ON p.client_id = c.client_id
    JOIN payment_methods pm ON p.payment_method = pm.payment_method_id USE Sql_store;
Select *
FROM order_items oi
    Join order_item_notes oin on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id
Select c.name,
    p.amount,
    pm.name,
    i.payment_total
From clients c
    Join payments p using (client_id)
    join payment_methods pm on pm.payment_method_id = p.payment_method
    join invoices i using (client_id)
    join sql_store.products sp on sp.unit_price -- UNION
Select order_id,
    order_date,
    'active' as status
FROM orders
Where order_date >= '2019_01_01'
UNION
Select order_id,
    order_date,
    'Archived' as status
FROM orders
Where order_date < '2019_01_01'