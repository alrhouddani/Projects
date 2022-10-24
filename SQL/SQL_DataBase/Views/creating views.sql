Use sql_invoicing;
CREATE VIEW Seles_by_client as
SELECT c.client_id,
    c.name,
    sum(invoice_total) as total_sales
FROM clients c
    Join invoices i using (client_id)
Group by Client_id,
    name