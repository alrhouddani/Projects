use sql_store;
Select order_id,
    c.customer_id,
    first_name,
    last_name
From orders o
    INNER Join customers c on o.customer_id = c.customer_id