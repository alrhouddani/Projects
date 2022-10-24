Select *
FROM orders
Where order_date >= '2019-01-01'
Select *
From customers
Where birth_date > '1990-01-01'
      or (
            point > 1000
            and State = 'VA'
      ) - -
      and
      or
Where not <= >= -- AND
Select *
From Order_items
Where Order_id = '6'
      AND unit_price * quantity > 30 -- NOT
Select *
From customers
Where state = 'VA'
      OR State = 'GA'
      OR State = 'FL'
WHERE state IN ('VA', 'GA', 'FL')
WHERE state NOT IN ('VA', 'GA', 'FL') --IN
Select *
From products
WHERE quantity_in_stock IN ('49', '38', '72') -- BETWEEN
Select *
From customers
WHERE birth_date BETWEEN '1990-1-1' and '2000-1-1' -- like
      --'_____y'
SELECT *
From customers
Where last_name LIKE '%a%%'
select *
from customers -- Where address LIKE '%trail%' or '%AVENUS%'
Where phone LIKE '_________9'
SELECT *
From customers
where last_name regexp 'field|Mac|Rose' -- regexp 'field$' 'field' '^field' 'field|Mac' 'field|Mac|Rose' 
      -- '[gim]e'
      -- '[a-h]e'
      -- ^ beginning
      -- $ end
      -- | Logical or 
      -- [abcd]
      -- [a-f]
SELECT *
From customers -- WHERE first_name regexp 'elka|Ambur'
      -- WHERE last_name regexp 'ey$|on$'
      -- WHERE last_name regexp '^my|se'
      -- WHERE last_name regexp 'b[u]' --or 'br|bu'
Select *
From customers
Where Phone IS Null -- using Order by 
Select *,
      (Unit_price * quantity) as Total_Price
From Order_items
Where Order_id = 2
Order by Total_Price DESC -- using limit and order by
Select *
From Customers
Order By Points Desc
limit 3 -- inner JOIN 
Select order_id,
      first_name,
      last_name
From orders o
      inner JOIN customers ON o.customer_id = customers.customer_id --------      
      -- Join two databases
select *
from Order_Items oi
      Join sql_inventory.products p On oi.product_id = p.product_id