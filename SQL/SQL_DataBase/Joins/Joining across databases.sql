USE sql_store;
select *
from order_items OI
    Join sql_inventory.products p on oi.product_id = p.product_id