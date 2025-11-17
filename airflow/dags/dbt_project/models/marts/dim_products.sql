{{ config(materialized='table') }}

select
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    brand
from {{ ref('stg_products') }}
