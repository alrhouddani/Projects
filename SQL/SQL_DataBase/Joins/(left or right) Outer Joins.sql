USE sql_store;
SELECT c.customer_id,
    c.first_name,
    o.order_id
FROM customers AS c
    LEFT OUTER JOIN orders AS o ON O.customer_id = c.customer_id
order by c.customer_id --
    ---------------------------------------------------------------
SELECT c.customer_id,
    c.first_name,
    o.order_id
FROM customers AS c
    RIGHT OUTER JOIN orders AS o ON O.customer_id = c.customer_id
order by c.customer_id ---
    --ex
    USE sql_store;
SELECT p.product_id,
    p.name,
    oi.quantity
FROM products AS p
    LEFT OUTER JOIN order_items AS oi ON p.product_id = oi.product_id