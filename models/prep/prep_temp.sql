WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        o_char(timestamp, 'Day') AS weekday,
        -- o_char(timestamp, weekday) AS day_num
    FROM temperature_daily
)
SELECT *
FROM add_weekday