{% macro log_model_start(model_name) %}
    {{ log("Starting model: " ~ model_name, info=true) }}
{% endmacro %}

{% macro log_model_end(model_name, row_count) %}
    {{ log("Completed model: " ~ model_name ~ ", rows: " ~ row_count, info=true) }}
{% endmacro %}
