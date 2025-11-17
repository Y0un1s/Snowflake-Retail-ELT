
  create or replace   view ECOMMERCE._STG.stg_products
  
  
  
  
  as (
    

select
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    brand
from ECOMMERCE.RAW.products
  );

