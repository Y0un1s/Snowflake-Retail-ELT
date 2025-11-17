{{ config(materialized='view') }}

select
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
from {{ source('raw', 'customers') }}
