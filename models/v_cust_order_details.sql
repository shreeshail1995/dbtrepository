 {{
    config(
        materialized='table',
        transient=false
    )
 }}
SELECT
    c.first_name,
    o.status,
    o.order_date,
    p.paymentmethod,
    p.amount
FROM RAW.JAFFILE_SHOP.customers c
INNER JOIN RAW.JAFFILE_SHOP.orders o
    ON o.user_id = c.id
INNER JOIN RAW.STRIP.payment p
    ON o.id = p.order_id
