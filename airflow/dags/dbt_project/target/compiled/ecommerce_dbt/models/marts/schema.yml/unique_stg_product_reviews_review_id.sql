
    
    

select
    review_id as unique_field,
    count(*) as n_records

from ECOMMERCE._STG.stg_product_reviews
where review_id is not null
group by review_id
having count(*) > 1


