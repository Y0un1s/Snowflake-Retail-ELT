{% snapshot orders_snapshot %}
{{ config(target_schema='SNAPSHOTS', strategy='check', unique_key='order_id', check_cols=['status','total_amount']) }}

select * from {{ ref('stg_orders') }}

{% endsnapshot %}
