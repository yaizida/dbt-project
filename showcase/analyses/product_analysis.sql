
--Анализ данных продуктов на основе stg_products
--Этот файл не материализуется в таблицу, а используется для исследовательских запросов


-- 1. Базовый анализ продуктовой линейки
SELECT
    product_category,
    COUNT(*) as product_count,
    AVG(product_price) as avg_price,
    MIN(product_price) as min_price,
    MAX(product_price) as max_price,
    SUM(product_price) as total_value
FROM {{ ref('stg_products') }}
GROUP BY product_category
ORDER BY product_count DESC;

-- 2. Дорогие продукты (топ-10 по цене)
SELECT
    product_id,
    product_name,
    product_category,
    product_price,
    loaded_at
FROM {{ ref('stg_products') }}
WHERE product_price > 1000
ORDER BY product_price DESC
LIMIT 10;

-- 3. Анализ распределения цен по категориям
WITH price_stats AS (
    SELECT
        product_category,
        product_price,
        NTILE(4) OVER (PARTITION BY product_category ORDER BY product_price) as price_quartile
    FROM {{ ref('stg_products') }}
)
SELECT
    product_category,
    price_quartile,
    COUNT(*) as product_count,
    ROUND(MIN(product_price), 2) as min_price,
    ROUND(MAX(product_price), 2) as max_price,
    ROUND(AVG(product_price), 2) as avg_price
FROM price_stats
GROUP BY product_category, price_quartile
ORDER BY product_category, price_quartile;