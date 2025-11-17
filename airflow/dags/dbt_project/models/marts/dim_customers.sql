{{ config(materialized='table') }}

select
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
from {{ ref('stg_customers') }}
