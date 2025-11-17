FROM apache/airflow:2.9.2

USER airflow

# Ensure dbt is on PATH
ENV PATH="/home/airflow/.local/bin:${PATH}"

# Install dbt + Snowflake adapter
RUN pip install --no-cache-dir dbt-core dbt-snowflake

USER root
