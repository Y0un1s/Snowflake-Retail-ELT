{{ config(materialized='table') }}

select
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,

    -- denormalized fk links
    o.customer_id,
    p.product_name,
    p.category,

    -- measures
    oi.quantity * oi.unit_price as line_total

from {{ ref('stg_order_items') }} oi
left join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id
left join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id
