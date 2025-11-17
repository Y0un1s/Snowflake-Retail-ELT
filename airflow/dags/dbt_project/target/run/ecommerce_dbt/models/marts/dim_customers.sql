
  
    

create or replace transient table ECOMMERCE._MART.dim_customers
    
    
    
    as (

select
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
from ECOMMERCE._STG.stg_customers
    )
;


  