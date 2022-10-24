SELECT client_id,
    SUM(invoice_total) AS Total_sales COUNT(*) AS number_of_invoices
FROM invoices
GROUP BY client_id
HAVING Total_sales > 500
---
---

