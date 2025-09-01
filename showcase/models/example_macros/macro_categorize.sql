{{ config(materialized='table') }}

SELECT
    order_id,
    amount,
    {{ categorize_amount('amount') }} as amount_category
FROM {{ ref('raw_orders') }}
