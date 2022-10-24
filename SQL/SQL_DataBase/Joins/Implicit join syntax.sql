USE sql_store;
SELECT *
FROM orders AS o
    JOIN customers AS c ON O.customer_id = c.customer_id --- Better not be used   
    USE sql_store;
SELECT *
FROM orders AS o,
    customers AS c
WHERE O.customer_id = c.customer_id