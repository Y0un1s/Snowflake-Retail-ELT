
  create or replace   view ECOMMERCE._STG.stg_customers
  
  
  
  
  as (
    

select
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
from ECOMMERCE.RAW.customers
  );

