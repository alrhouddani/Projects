USE sql_store;
SELECT o.order_id,
    o.order_date,
    c.first_name,
    c.first_name,
    os.name as status
FROM orders as o
    JOIN customers as c USING (customer_id)
    JOIN order_statuses as os ON o.status = os.order_status_id