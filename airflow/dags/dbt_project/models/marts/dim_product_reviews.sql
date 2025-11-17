{{ config(materialized='table') }}

select
    review_id,
    product_id,
    customer_id,
    rating,
    review_text,
    review_date
from {{ ref('stg_product_reviews') }}
