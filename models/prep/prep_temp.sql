WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
        o_char(timestamp, 'Day') AS weekday,
        weekday AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday