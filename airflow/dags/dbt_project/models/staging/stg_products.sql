{{ config(materialized='view') }}

select
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    brand
from {{ source('raw', 'products') }}
