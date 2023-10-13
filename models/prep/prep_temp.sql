WITH temperature_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        to_char(date, 'Day') AS weekday,
        date_part('day', date) AS day_num
        date_part('year', date) AS year
    FROM temperature_daily
)
SELECT *
FROM add_weekday