USE sql_store;
SELECT c.customer_id,
    c.first_name,
    o.order_id,
    sh.name
FROM customers AS c
    LEFT OUTER JOIN orders AS o ON O.customer_id = c.customer_id
    LEFT OUTER JOIN shippers AS sh USING (shipper_id)
order by c.customer_id ---___
    --
    USE sql_store;
Select o.order_date,
    o.order_id,
    c.first_name,
    s.name,
    os.name
FROM orders AS o
    LEFT OUTER JOIN customers AS c ON o.customer_id = c.customer_id
    LEFT OUTER JOIN shippers AS s ON o.shipper_id = s.shipper_id
    LEFT OUTER JOIN order_statuses os ON os.order_status_id = o.status --- 
    #   --BETTer way using (USING (colum)
    USE sql_store;
Select o.order_date,
    o.order_id,
    c.first_name,
    s.name AS shipper,
    os.name AS status
FROM orders AS o
    LEFT OUTER JOIN customers AS c USING (customer_id)
    LEFT OUTER JOIN shippers AS s USING (shipper_id)
    LEFT OUTER JOIN order_statuses os ON os.order_status_id = o.status