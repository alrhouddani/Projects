USE `sql_invoicing`;
DROP procedure IF EXISTS `get_invoice_by_client`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE `get_invoice_by_client` 
(
client_id INT
)
BEGIN
select * FROM invoices i
WHERE i.client_id = client_id;
END$$

DELIMITER ;

---
---

USE `sql_invoicing`;
DROP procedure IF EXISTS `get_invoice_by_client`;
DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE `get_client_payments` 
(
client_name VARCHAR(50)
) 
select
	c.client_id,
	c.name,
    i.invoice_date,
    i.payment_total,
    i.payment_date
FROM invoices AS i 
join clients AS c
	USING (client_id)
WHERE c.name = client_name;

END$$

DELIMITER ; 