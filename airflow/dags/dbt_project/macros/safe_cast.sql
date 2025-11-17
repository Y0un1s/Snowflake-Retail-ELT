{% macro safe_cast(col, data_type) -%}
  case when {{ col }} is null then null
  else try_cast({{ col }} as {{ data_type }})
  end
{%- endmacro %}
