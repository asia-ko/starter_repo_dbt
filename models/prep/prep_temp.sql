WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        to_char('Day', date) AS weekday,
        date_part('day', date) AS day_num
    FROM temperature_daily
)
SELECT *
FROM add_weekday