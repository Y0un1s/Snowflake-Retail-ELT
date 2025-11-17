
  create or replace   view ECOMMERCE._STG.stg_order_items
  
  
  
  
  as (
    

select
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
from ECOMMERCE.RAW.order_items
  );

