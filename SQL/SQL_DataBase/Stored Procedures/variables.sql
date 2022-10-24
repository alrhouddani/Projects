CREATE DEFINER=`root`@`%` PROCEDURE `get_rish_factor`(
)
BEGIN
	DECLARE risk_factor decimal(9,2) default 0;
	DECLARE invoices_total decimal (9.2);
	DECLARE invoices_count INT;
    
	SELECT count(*), SUM(invoices_total)
    INTO invoices_count, invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
    SELECT risk_factor;
END