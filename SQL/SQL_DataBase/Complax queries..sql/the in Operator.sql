USE sql_invoicing;
select *
FROM clients
Where client_id NOT IN (
        select distinct client_id
        from invoices
    )