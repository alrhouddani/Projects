Use sql_invoicing;
UPDATE invoices
SET payment_total = 10,
    payment_date = '2019-03-01'
Where client_id = 1