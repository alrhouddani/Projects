SELECT first_name, last_name,points, (points  + 10) * 100 AS Discount
FROM customers
UPDATE `sql_store`.`customers` SET `state` = 'VA' WHERE (`customer_id` = '1');
