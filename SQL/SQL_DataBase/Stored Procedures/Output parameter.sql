CREATE DEFINER=`root`@`%` PROCEDURE `get_unpaid_invoices_for_client`(
	client_id INT
)
BEGIN
	select
	count(*) invoice_count,
    SUM(invoice_total) as Total
FROM invoices i
WHERE i.client_id = client_id
	and payment_total = 0;
END