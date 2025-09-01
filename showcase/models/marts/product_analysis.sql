{{ config(materialized='view') }}

SELECT
    product_category,
    COUNT(*) as product_count,
    AVG(product_price) as avg_price,
    SUM(product_price) as total_value
FROM {{ ref('stg_products') }}
GROUP BY product_category
