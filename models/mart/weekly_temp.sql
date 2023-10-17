with weekly_temp 
 			as (select city, date,
            		date_part('week', date) as week,
                    date_part('year', date) as year,
            		avg(avgtemp_c) as weekly_avg,
            		max(avgtemp_c) as weekly_avg_max,
            		min(avgtemp_c) as weekly_avg_min,
                    avg(maxtemp_c) as weekly_max,
                    avg(mintemp_c) as weekly_min,
                    avg(totalprecip_mm) as avg_precip_mm,
                    avg(maxwind_kph) as avg_wind_kph
            		from {{ref('staging_weather')}}                  
                    group by (city, week, year, date)
                    order by year, week, city
)
select * from weekly_temp