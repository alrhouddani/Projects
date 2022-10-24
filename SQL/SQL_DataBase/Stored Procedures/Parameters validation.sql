CREATE DEFINER=`root`@`%` PROCEDURE `make_payment`(
	invoice_id INT,
    payment_amount DECIMAL(9,2),
    payment_date date
)
BEGIN
	IF payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003'
        SET message_text = 'Invalid payment amount';
	END IF;
	update invoices i
    SET
	i.payment_total = payment_amount,
    i.payment_date = payment_date
    WHERE i.invoice_id = invoice_id;
	
END