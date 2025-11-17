{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    order_date,
    total_amount,
    payment_method,
    shipping_country
from {{ source('raw', 'orders') }}
