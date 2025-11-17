{{ config(materialized='table') }}

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.payment_method,
    o.shipping_country,

    -- foreign key
    c.customer_id as dim_customer_id

from {{ ref('stg_orders') }} o
left join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
