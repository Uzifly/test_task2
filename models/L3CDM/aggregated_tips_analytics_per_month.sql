
SELECT 
    taxi_id, report_month AS year_month, month_tips AS tips_sum, 
    ROUND(month_tips/(LAG(month_tips) OVER (PARTITION BY taxi_id ORDER BY report_month)*0.01)-100) AS tips_change
FROM {{ ref('tips_per_month') }} 
WHERE 
    taxi_id IN (SELECT * FROM {{ ref('get_much_tips_by_id') }}) 
    AND report_month >= CAST('{{ var('start_tips_year') }}-{{ var('start_tips_month') }}-01' AS TIMESTAMP)
ORDER BY report_month, taxi_id

