with customers as (
select * from {{ ref('t_new_customers') }}
),
orders as (
select * from {{ ref('t_new_orders') }}
),
customer_orders as (
select * from {{ ref('t_new_customer_orders') }}
),
final as (
select
customers.id,
customers.first_name,
customers.last_name,
customer_orders.first_order_date, customer_orders.most_recent_order_date,
coalesce (customer_orders.number_of_orders, 0) as number_of_orders
from raw.jaffile_shop.customers
left join customer_orders on customers.id=customer_orders.user_id
)
select * from final