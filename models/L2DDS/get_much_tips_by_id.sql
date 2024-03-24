{{ config(materialized='view') }}

SELECT taxi_id 
FROM {{ ref('tips_per_month') }}
WHERE report_month = CAST('{{ var('start_tips_year') }}-{{ var('start_tips_month') }}-01' AS TIMESTAMP)
ORDER BY month_tips DESC
LIMIT {{ var('car_limit') }}