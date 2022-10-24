SELECT client_id,
    sum(invoice_total) AS total_sales
FROM invoices
GROUP BY client_id with rollup