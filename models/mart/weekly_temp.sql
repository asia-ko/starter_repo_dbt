with weekly_temp 
 			as (select city, lat, lon, country
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
                    group by (country, city, lat, lon, week, year)
                    order by year, week, city, lat,lon, country
)
select * from weekly_temp