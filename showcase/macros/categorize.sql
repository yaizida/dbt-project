{% macro categorize_amount(amount_column) %}
    CASE
        WHEN {{ amount_column }} = 0 THEN 'zero'
        WHEN {{ amount_column }} < 100 THEN 'small'
        WHEN {{ amount_column }} < 1000 THEN 'medium'
        ELSE 'large'
    END
{% endmacro %}
