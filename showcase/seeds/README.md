# Загрузить все seeds
dbt seed

# Загрузить конкретный seed файл
dbt seed --select raw_products

# Полностью перезагрузить данные (удалит и создаст таблицу заново)
dbt seed --full-refresh