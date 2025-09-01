{{ config(materialized='table',
    alias='stg_products') }}

SELECT
    id::integer as product_id,
    name::varchar(255) as product_name,
    category::varchar(100) as product_category,
    price::numeric(10, 2) as product_price,
    CURRENT_TIMESTAMP as loaded_at
FROM {{ ref('raw_products') }}
