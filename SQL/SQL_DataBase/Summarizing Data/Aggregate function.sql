-- MAX() Min() AVG() Sum() count()
USE sql_invoicing;
Select Max(invoice_total) AS Highest,
    Min(invoice_total) AS Lowest,
    AVG(invoice_total) AS Average,
    Sum(invoice_total) AS Total,
    count (DISTINCT client_id) as DISTINCT_total,
    count(invoice_total) AS invoice_total count(payment_date) AS Count_of_payment,
    -- does not incloud null rows,
    count (*) AS Total_record --Shows all records incloudig Null values
FROM invoices
Where invoice_Date > '2019-07-01' ---
    --------------
    --------------
    --------------
Select 'first half of 2019' as Data_range,
    Sum(invoice_total) as Total_sales,
    SUM(payment_total) as Total_payments,
    sum(invoice_total - payment_total) as whats_expacted
From invoices
Where invoice_Date BEtween '2019-01-01' and '2019-07-01'
UNION
Select 'secend half of 2019' as Data_range,
    Sum(invoice_total) as Total_sales,
    SUM(payment_total) as Total_payments,
    sum(invoice_total - payment_total) as whats_expacted
From invoices
Where invoice_Date BEtween '2019-07-01' and '2019-12-31'
UNION
Select 'total' as Data_range,
    Sum(invoice_total) as Total_sales,
    SUM(payment_total) as Total_payments,
    sum(invoice_total - payment_total) as whats_expacted
From invoices
Where invoice_Date BEtween '2019-01-01' and '2019-12-31';