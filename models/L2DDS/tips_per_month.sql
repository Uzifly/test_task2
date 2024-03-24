/*
Конфиг для инкрементального наполнения таблицы. Мой BigQuery в ограниченном режиме. DML не доступен.
{{
  config(
    materialized='incremental',
    unique_key=['taxi_id', 'report_month'],
    incremental_strategy='merge',
    sort='report_month'
  )
}}
*/

{{ config(materialized='table') }}

SELECT taxi_id, DATE_TRUNC(trip_start_timestamp, MONTH) AS report_month, SUM(tips) AS month_tips
FROM {{ ref('tips_view') }} 
GROUP BY taxi_id, DATE_TRUNC(trip_start_timestamp, MONTH)
ORDER BY report_month DESC