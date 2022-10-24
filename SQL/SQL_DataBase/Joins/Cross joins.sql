USE sql_store;
SELECT c.first_name as client,
    p.name as product
FROM customers c
    CROSS JOIN products p
order by c.first_name --
    --USING implicit syntax
    USE sql_store;
SELECT s.name as shipper,
    p.name as product
FROM shippers s,
    products p ----
    -- using Explicit syntax
    USE sql_store;
SELECT s.name as shipper,
    p.name as product
FROM shippers s
    CROSS JOIN products p