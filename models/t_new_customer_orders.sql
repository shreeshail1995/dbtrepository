{{
    config(
        materialized='ephemeral'
    )
}}
select
user_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(*) as number_of_orders
from RAW.JAFFILE_SHOP.orders
group by 1