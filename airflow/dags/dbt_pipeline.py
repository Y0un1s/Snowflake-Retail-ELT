from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.hooks.base import BaseHook

# Load connection from Airflow UI
sf_conn = BaseHook.get_connection("eco_snow")

# Build environment for dbt
sf_env = {
    "SF_USER": sf_conn.login or "",
    "SF_PASSWORD": sf_conn.password or "",
    "SF_ACCOUNT": sf_conn.extra_dejson.get("account", ""),
    "SF_ROLE": sf_conn.extra_dejson.get("role", ""),
    "SF_WAREHOUSE": sf_conn.extra_dejson.get("warehouse", ""),
    "SF_DATABASE": sf_conn.extra_dejson.get("database", ""),
    "SF_SCHEMA": sf_conn.extra_dejson.get("schema", ""),
}

DBT = "/home/airflow/.local/bin/dbt"
PROJECT_DIR = "/opt/airflow/dags/dbt_project"

with DAG(
    dag_id="ecom_dbt_pipeline",
    start_date=datetime(2025, 1, 1),
    schedule_interval="@daily",
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"cd {PROJECT_DIR} && {DBT} run --profiles-dir {PROJECT_DIR}",
        env=sf_env,
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"cd {PROJECT_DIR} && {DBT} test --profiles-dir {PROJECT_DIR}",
        env=sf_env,
    )

    dbt_snapshot = BashOperator(
        task_id="dbt_snapshot",
        bash_command=f"cd {PROJECT_DIR} && {DBT} snapshot --profiles-dir {PROJECT_DIR}",
        env=sf_env,
    )

    dbt_run >> dbt_test >> dbt_snapshot
