INSERT INTO orders_archived
Select *
from orders
Where order_date < '2019-01-01'