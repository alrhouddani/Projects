Select *
FROM products
WHERE unit_price > (
        select unit_price
        FROM products
        Where product_id = 3
    ) --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    use sql_hr;
Select concat('first_name', 'last_name') as Full_name,
    salary
FROM employees
WHERE salary > (
        select AVG(salary)
        from employees
    )