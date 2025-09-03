{{
    config(
        materialized='incremental',
        unique_key='order_id',
        alias='stg_orders'
    )
}}

SELECT
    order_id::integer as order_id,
    user_id::integer as user_id,
    amount::numeric(10, 2) as order_amount,
    status::varchar(20) as order_status,
    order_date::date as order_date,
    CURRENT_TIMESTAMP as load_dttm
FROM {{ ref('raw_orders') }}
