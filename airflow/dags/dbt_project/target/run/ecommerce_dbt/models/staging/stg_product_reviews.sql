
  create or replace   view ECOMMERCE._STG.stg_product_reviews
  
  
  
  
  as (
    

select
    review_id,
    product_id,
    customer_id,
    rating,
    review_text,
    review_date
from ECOMMERCE.RAW.product_reviews
  );

