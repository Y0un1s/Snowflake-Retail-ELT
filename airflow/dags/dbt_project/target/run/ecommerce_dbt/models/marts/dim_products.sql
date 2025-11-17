
  
    

create or replace transient table ECOMMERCE._MART.dim_products
    
    
    
    as (

select
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    brand
from ECOMMERCE._STG.stg_products
    )
;


  