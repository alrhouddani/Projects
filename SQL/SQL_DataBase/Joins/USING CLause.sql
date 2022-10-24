use sql_store;
Select order_id,
    c.customer_id,
    first_name,
    last_name
From orders o
    INNER Join customers c USING (customer_id) ---------------------
    -- Using clause with two databases
    USE sql_store;
select *
from order_items OI
    Join sql_inventory.products p USING (product_id) ----
    ---
    USE sql_store;
SELECT *
FROM order_items oi
    JOIN order_item_notes oin -- ON oi.order_id = oin.order_id
    -- AND oi.product_id = oin.product_id
    USING (order_id, product_id) ----
    ---
    USE sql_invoicing;
SELECT p.date,
    c.name AS client,
    p.amount,
    pm.name as Payment_type
FROM payments p
    JOIN clients as c USING (client_id)
    JOIN payment_methods pm on pm.payment_method_id = p.payment_id