
DROP procedure IF EXISTS `get_client_by_state`;
DELIMITER $$
CREATE PROCEDURE `get_client_by_state`(
	state CHAR(2)
)
BEGIN
IF state IS NULL THEN
	SET state = 'ca';
END IF;
	SELECT * FROM clients c
    WHERE c.state = state;
END $$
DELIMITER ;

---
---

-- WITH else if  statament 


DROP procedure IF EXISTS `get_client_by_state`;
DELIMITER $$
CREATE PROCEDURE `get_client_by_state`(
	state CHAR(2)
)
BEGIN
IF state IS NULL THEN
	SELECT * FROM clients;
ELSE
	SELECT * FROM clients c
    WHERE c.state = state;
END IF;
	
END $$
DELIMITER ;

----
----

-- WITH IFNULL statament 


DROP procedure IF EXISTS `get_client_by_state`;
DELIMITER $$
CREATE PROCEDURE `get_client_by_state`(
	state CHAR(2)
)
BEGIN
	SELECT * FROM clients c
	WHERE c.state = IFNULL(state, c.state);
END $$
DELIMITER ;


---
---

DROP PROCEDURE IF EXISTS get_payments;

DELIMITER $$
CREATE PROCEDURE get_payments
(
	client_id INT,
    payment_method_id TINYINT
)
BEGIN
	SELECT * FROM payments p
    WHERE p.client_id = IFNULL(client_id, p.client_id) AND
		p.payment_method = IFNULL(payment_method_id, p.payment_method);
END $$
DELIMITER ;

