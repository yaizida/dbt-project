{{ log_model_start('stg_orders') }}

SELECT
    *,
    CURRENT_TIMESTAMP as loaded_at
FROM {{ ref('raw_orders') }}

{{ log_model_end('stg_orders', 'count(*)') }}