
  create or replace   view ECOMMERCE._STG.stg_orders
  
  
  
  
  as (
    

select
    order_id,
    customer_id,
    order_date,
    total_amount,
    payment_method,
    shipping_country
from ECOMMERCE.RAW.orders
  );

