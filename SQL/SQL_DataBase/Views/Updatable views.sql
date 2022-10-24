CREATE OR REPLACE VIEW invoce_with_balance as
SELECT invoice_id,
    Number,
    Client_id Invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    Due_date,
    Payment_date
FROM invoices
Where (invoice_total - payment_total) > 0