DELIMITER $$
DROP trigger if exists payment_after_insert;
CREATE TRIGGEr payment_after_insert
	after insert on payments
	for each row
begin
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = new.invoice_id;
END $$

DELIMITER ; 

--- to view all triggers
SHOW TRIGGERS
--- Drop a trigger
DROP trigger if exists payment_after_insert;

---

DELIMITER $$
DROP trigger if exists payment_after_delete;

CREATE TRIGGEr payment_after_delete
	after delete on payments
	for each row
begin
	UPDATE invoices
    SET payment_total = payment_total - old.amount
    WHERE invoice_id = old.invoice_id;
END $$

DELIMITER ; 

