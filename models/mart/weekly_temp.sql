with weekly_temp 
 			as (select city,
            		date_part('week', date) as week,
            		avg(avgtemp_c) as weekly_avg,
            		max(avgtemp_c) as weekly_avg_max,
            		min(avgtemp_c) as weekly_avg_min,
                    avg(maxtemp_c) as weekly_max,
                    avg(mintemp_c) as weekly_min,
                    avg(totalprecip_mm) as avg_precip_mm,
                    avg(maxwind_kph) as avg_wind_kph
            		from {{ref('prep_temp')}}                  
                    group by (city, week)
                    order by week
)
select * from weekly_temp