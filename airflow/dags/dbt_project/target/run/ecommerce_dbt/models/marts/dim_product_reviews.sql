
  
    

create or replace transient table ECOMMERCE._MART.dim_product_reviews
    
    
    
    as (

select
    review_id,
    product_id,
    customer_id,
    rating,
    review_text,
    review_date
from ECOMMERCE._STG.stg_product_reviews
    )
;


  