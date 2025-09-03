{% snapshot orders_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='order_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select
    order_id,
    user_id,
    order_amount,
    order_status,
    order_date,
    current_timestamp as updated_at
from {{ ref('stg_orders') }}

{% endsnapshot %}
