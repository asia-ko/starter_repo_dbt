WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        date_part('day', date) AS weekday
        date_part('weekday', date) AS day_num
    FROM temperature_daily
)
SELECT *
FROM add_weekday