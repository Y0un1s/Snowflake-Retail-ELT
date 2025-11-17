{% macro try_to_timestamp(col) -%}
  try_to_timestamp({{ col }})
{%- endmacro %}
